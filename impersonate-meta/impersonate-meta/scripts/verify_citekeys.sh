#!/usr/bin/env bash
#
# verify_citekeys.sh — Verify BibTeX citekey integrity for persona arguments
#
# Usage: ./scripts/verify_citekeys.sh <persona-dir>
#
# Extracts all citekeys from <persona-dir>/<subject>.bib (the first *.bib
# file found), extracts all cited keys from **Citekeys**: lines in argument
# .md files, and cross-references them. Reports:
#   (a) citekeys referenced but NOT in bib (orphans -- treated as failures)
#   (b) bib entries that are never referenced (informational; run prune_bib.py)
#
# Exits 1 only when orphan citekeys exist (broken references). Unreferenced
# bib entries are reported but do not affect exit code.
#
# Works with the standard impersonate-meta persona layout:
#   persona-dir/
#     <subject>.bib          # BibTeX file
#     arguments/**/*.md      # VA argument files with **Citekeys**: lines
#
# The script handles mixed citekey formats:
#   **Citekeys**: key1, key2              — bare citekeys (comma-separated)
#   **Citekeys**: [key1, key2]            — bracketed
#   **Citekeys**: [text description]      — non-bib references (ignored)
#   **Citekeys**: [No specific paper...]  — no-bib markers (ignored)
#
set -euo pipefail

PERSONA_DIR="${1:-}"
if [ -z "$PERSONA_DIR" ]; then
    echo "ERROR: Usage: $0 <persona-dir>"
    exit 2
fi
if [ ! -d "$PERSONA_DIR" ]; then
    echo "ERROR: Persona directory not found: $PERSONA_DIR"
    exit 2
fi

# ---------------------------------------------------------------------------
# Locate the .bib file
# ---------------------------------------------------------------------------
BIB_FILE=""
for f in "$PERSONA_DIR"/*.bib; do
    [ -f "$f" ] && BIB_FILE="$f" && break
done

if [ -z "$BIB_FILE" ]; then
    echo "ERROR: No .bib file found in $PERSONA_DIR"
    exit 2
fi

echo "=== Citekey Verification Report ==="
echo "Bib file : $BIB_FILE"
echo ""

# ---------------------------------------------------------------------------
# Step 1: Extract all citekeys from BibTeX entries
# ---------------------------------------------------------------------------
ALL_BIB_KEYS=$(mktemp)
grep -oP '(?<=@\w+\{)[^,]+' "$BIB_FILE" | tr -d ' \t' | sort -u > "$ALL_BIB_KEYS"
BIB_COUNT=$(wc -l < "$ALL_BIB_KEYS")
echo "Entries in bib : $BIB_COUNT"

# ---------------------------------------------------------------------------
# Step 2: Extract all referenced citekeys from **Citekeys**: lines in .md files
# ---------------------------------------------------------------------------
RAW_CITED_KEYS=$(mktemp)
ALL_CITED_KEYS=$(mktemp)

# Find all argument .md files (skip SKILL.md index files)
find "$PERSONA_DIR/arguments" -name '*.md' ! -name 'SKILL.md' -print0 2>/dev/null \
  | xargs -0 grep -h '^\*\*Citekeys\*\*' 2>/dev/null \
  | sed 's/^\*\*Citekeys\*\*:[[:space:]]*//' \
  > "$RAW_CITED_KEYS" || true

CITED_COUNT_TOTAL=$(wc -l < "$RAW_CITED_KEYS")
echo "VA entries with citekeys : $CITED_COUNT_TOTAL"

# Parse each line: extract individual citekeys (alphanumeric+hyphens, no punctuation)
# Skip lines that are bracketed descriptions, URLs, or "No specific paper" markers
while IFS= read -r line; do
    # Skip non-bib lines: descriptions in brackets, URLs, "No specific paper"
    if echo "$line" | grep -qiP '(no specific paper|video source|youtube\.com|codex |lecture|career timeline)'; then
        continue
    fi

    # Remove surrounding brackets [...] if present
    cleaned=$(echo "$line" | sed 's/^\[//;s/\]$//')

    # Split by comma or whitespace and extract bare citekeys
    # A citekey is alphanumeric + hyphens (no spaces, no quotes, no brackets)
    for token in $(echo "$cleaned" | tr ',' '\n' | tr -s ' \t' '\n'); do
        token=$(echo "$token" | xargs)  # trim
        # Citekeys are lower-alphanumeric with hyphens (bibtex convention)
        if echo "$token" | grep -qP '^[a-z0-9][a-z0-9-]+$'; then
            echo "$token"
        fi
    done
done < "$RAW_CITED_KEYS" | sort -u > "$ALL_CITED_KEYS"

CITED_COUNT=$(wc -l < "$ALL_CITED_KEYS")
echo "Unique citekeys referenced : $CITED_COUNT"
echo ""

# ---------------------------------------------------------------------------
# Step 3: Cross-reference
# ---------------------------------------------------------------------------
ORPHANS=$(comm -23 "$ALL_CITED_KEYS" "$ALL_BIB_KEYS")
UNREFERENCED=$(comm -13 "$ALL_CITED_KEYS" "$ALL_BIB_KEYS")

EXIT_CODE=0

if [ -n "$ORPHANS" ]; then
    echo "⚠️  BROKEN: Citekeys referenced but NOT in bib ($(echo "$ORPHANS" | wc -l) total):"
    echo "$ORPHANS" | sed 's/^/    /'
    echo ""
    EXIT_CODE=1
else
    echo "✅ All referenced citekeys exist in the bib file."
    echo ""
fi

if [ -n "$UNREFERENCED" ]; then
    echo "📦  Unreferenced bib entries ($(echo "$UNREFERENCED" | wc -l) total):"
    echo "$UNREFERENCED" | sed 's/^/    /'
    echo ""
    echo "Tip: Run prune_bib.py to generate a minimal bib."
else
    echo "✅ All bib entries are referenced. No pruning needed."
fi

# ---------------------------------------------------------------------------
# Cleanup
# ---------------------------------------------------------------------------
rm -f "$ALL_BIB_KEYS" "$RAW_CITED_KEYS" "$ALL_CITED_KEYS"

# ---------------------------------------------------------------------------
# Summary
# ---------------------------------------------------------------------------
echo "=== Summary ==="
echo "Bib entries    : $BIB_COUNT"
echo "Referenced     : $CITED_COUNT"
echo "Unreferenced   : $(echo "$UNREFERENCED" | wc -l)"
echo "Orphans        : $(echo "$ORPHANS" | wc -l)"
echo "Exit code      : $EXIT_CODE"

exit $EXIT_CODE
