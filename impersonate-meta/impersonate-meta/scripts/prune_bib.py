#!/usr/bin/env python3
"""
prune_bib.py — Prune a BibTeX file to only entries referenced in VA argument files.

Usage:
    ./scripts/prune_bib.py <persona-dir>

Given a persona directory with:
    <subject>.bib                      # Full BibTeX library (any *.bib)
    arguments/**/*.md                  # VA argument files with **Citekeys**: lines

This script:
  - Reads all VA argument .md files
  - Extracts all citekeys from **Citekeys** lines
  - Filters <subject>.bib to keep only those entries
  - Writes the minimal bib to <subject>-minimal.bib
  - Copies the original to <subject>-bib-full.bib (if not already backed up)
  - Outputs stats: original count, pruned count, delta

Supports multiple citekey formats:
    **Citekeys**: key1, key2              — bare citekeys (comma-separated)
    **Citekeys**: [key1, key2]            — bracketed
    **Citekeys**: [text description]      — non-bib references (skipped)
"""

import re
import sys
import shutil
import os
from pathlib import Path


def find_bib_file(persona_dir: Path) -> Path:
    """Locate the .bib file in the persona directory."""
    for f in persona_dir.glob("*.bib"):
        if "full" not in f.stem and "minimal" not in f.stem:
            return f
    raise FileNotFoundError(f"No .bib file found in {persona_dir}")


def extract_cited_keys(persona_dir: Path) -> set[str]:
    """Extract unique BibTeX citekeys from **Citekeys** lines in argument .md files."""
    args_dir = persona_dir / "arguments"
    if not args_dir.is_dir():
        print(f"WARNING: arguments/ directory not found at {args_dir}")
        return set()

    cited: set[str] = set()
    citekey_re = re.compile(r'\b[a-z][a-z0-9-]+\b')

    # Lines to skip: **Citekeys** values that are descriptions, not bib keys.
    # The generic markers cover the common cases; subject-specific institution
    # names (e.g. "ISSI Pro", "UCAR Summer School") should be added by users
    # via the IMPERSONATE_META_SKIP_PATTERNS env var (pipe-separated regex).
    base_skip = (
        r'no specific paper|video source|youtube\.com|codex\s|lecture|'
        r'career timeline|distilled from|transcripts|interview'
    )
    extra_skip = os.environ.get("IMPERSONATE_META_SKIP_PATTERNS", "").strip()
    skip_re_src = base_skip + (f"|{extra_skip}" if extra_skip else "")
    skip_patterns = re.compile(skip_re_src, re.IGNORECASE)

    for md_file in sorted(args_dir.rglob("*.md")):
        if md_file.name == "SKILL.md":
            continue
        with open(md_file, "r", encoding="utf-8") as f:
            for line in f:
                if not line.startswith("**Citekeys**"):
                    continue
                # Extract content after "**Citekeys**: "
                content = line.split("**Citekeys**:", 1)[1].strip()
                # Skip non-bib lines
                if skip_patterns.search(content):
                    continue
                # Remove surrounding brackets
                content = content.strip("[]")
                # Find all potential citekeys
                for token in citekey_re.findall(content):
                    # Typical bibtex citekey pattern: lowercase start, alphanumeric + hyphens
                    if re.match(r'^[a-z][a-z0-9-]+$', token):
                        cited.add(token)

    return cited


def parse_bib_entries(bib_path: Path) -> dict[str, str]:
    """Parse a BibTeX file into {citekey: full_entry_text}."""
    with open(bib_path, "r", encoding="utf-8") as f:
        content = f.read()

    # Split on @article{, @inproceedings{, etc.
    # Each entry starts with @type{key, and ends before the next @
    entries: dict[str, str] = {}

    # Find all @ entries — capture full text from @type{key to closing }
    # Use a simple state machine for robustness
    i = 0
    while i < len(content):
        # Look for @type{
        m = re.search(r'@(\w+)\s*\{', content[i:])
        if not m:
            break
        start = i + m.start()
        # Extract the citekey (after the first {, before the first comma)
        entry_start = i + m.end()
        key_match = re.match(r'([^,]+)', content[entry_start:])
        if not key_match:
            i = entry_start
            continue
        key = key_match.group(1).strip().lower()

        # Find the matching closing brace
        # Count brace depth from this entry's opening {
        brace_start = content.index('{', start)
        depth = 0
        pos = brace_start
        while pos < len(content):
            if content[pos] == '{':
                depth += 1
            elif content[pos] == '}':
                depth -= 1
                if depth == 0:
                    break
            pos += 1

        if depth == 0:
            entry_text = content[start:pos + 1]
            entries[key] = entry_text
            i = pos + 1
        else:
            i = pos + 1

    return entries


def main():
    if len(sys.argv) < 2:
        print(f"Usage: {sys.argv[0]} <persona-dir>")
        sys.exit(2)

    persona_dir = Path(sys.argv[1])
    if not persona_dir.is_dir():
        print(f"ERROR: Persona directory not found: {persona_dir}")
        sys.exit(2)

    # Locate bib file
    bib_path = find_bib_file(persona_dir)
    print(f"Bib file : {bib_path}")

    # Extract cited keys
    cited_keys = extract_cited_keys(persona_dir)
    print(f"VA argument files scanned : {len(cited_keys)} unique citekeys extracted")
    print()

    # Parse all bib entries
    all_entries = parse_bib_entries(bib_path)
    orig_count = len(all_entries)
    print(f"Original bib entries : {orig_count}")

    # Filter to only cited entries
    pruned_entries: dict[str, str] = {}
    missing_keys: list[str] = []
    for key in sorted(cited_keys):
        if key in all_entries:
            pruned_entries[key] = all_entries[key]
        else:
            missing_keys.append(key)

    pruned_count = len(pruned_entries)
    delta = orig_count - pruned_count

    print(f"Pruned bib entries  : {pruned_count}")
    print(f"Removed             : {delta}")
    print(f"Keep ratio          : {pruned_count/orig_count*100:.1f}%")
    print()

    if missing_keys:
        print(f"⚠️  {len(missing_keys)} cited keys NOT found in bib (orphans):")
        for k in missing_keys:
            print(f"    {k}")
        print()

    # Back up original to velli-bib-full.bib
    full_bib_path = bib_path.with_name(bib_path.stem + "-bib-full.bib")
    if not full_bib_path.exists():
        shutil.copy2(bib_path, full_bib_path)
        print(f"Full bib backed up : {full_bib_path.name}")
        print(f"  ({bib_path.name} → {full_bib_path.name})")
    else:
        print(f"Full bib already backed up: {full_bib_path.name}")

    # Write minimal bib (derived from input stem so this works for any subject)
    minimal_path = bib_path.with_name(bib_path.stem + "-minimal.bib")
    with open(minimal_path, "w", encoding="utf-8") as f:
        f.write(f"% {minimal_path.name}: pruned to {pruned_count} cited entries\n")
        f.write(f"% Auto-generated by prune_bib.py from {bib_path.name}\n")
        f.write(f"% Original: {orig_count} entries, pruned: {pruned_count}\n\n")
        for key in sorted(pruned_entries.keys()):
            f.write(pruned_entries[key] + "\n\n")

    minimal_size = minimal_path.stat().st_size
    print(f"Minimal bib written : {minimal_path.name} ({minimal_size} bytes)")
    print()

    # Summary
    print("=== Summary ===")
    print(f"Original : {orig_count}")
    print(f"Pruned   : {pruned_count}")
    print(f"Removed  : {delta}")
    print(f"Orphans  : {len(missing_keys)}")


if __name__ == "__main__":
    main()
