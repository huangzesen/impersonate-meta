#!/usr/bin/env bash
#
# three_copy_scan.sh — Detect skill directory duplication across .library/
#
# Usage: ./scripts/three_copy_scan.sh <persona-dir>
#
# Scans all .library/ subdirectories (intrinsic, custom, and any _shared)
# for a skill directory with the given name, and reports every location
# where it exists.
#
# This applies to a LingTai-style runtime layout. If you are running
# standalone-persona QA (no .library/ on disk), this script will report
# "no library" and exit 0 -- it has nothing to drift-check.
#
# Exits with error (1) if more than one canonical location is found
# (i.e. the same skill appears in multiple user-writeable locations),
# exits 0 if 0 or exactly 1 location.
#
# "Canonical location" = any custom/ or .library_shared/ directory.
# Intrinsic skills (capabilities/, addons/) are excluded from the
# "multiple" check — they are system-provided and may coexist.
#
set -euo pipefail

PERSONA_DIR="${1:-}"
SKILL_NAME="${2:-}"

if [ -z "$PERSONA_DIR" ] || [ -z "$SKILL_NAME" ]; then
    echo "ERROR: Usage: $0 <persona-dir> <skill-name>"
    echo "  Scans .library/ directories for skill folder: <skill-name>"
    exit 2
fi
if [ ! -d "$PERSONA_DIR" ]; then
    echo "ERROR: Persona directory not found: $PERSONA_DIR"
    exit 2
fi

LIBRARY_DIR="$PERSONA_DIR/.library"

if [ ! -d "$LIBRARY_DIR" ]; then
    echo "ℹ️   No .library/ directory at $LIBRARY_DIR -- nothing to scan."
    echo "    (This script targets the LingTai runtime layout. For"
    echo "     standalone-persona QA, run verify_citekeys.sh instead.)"
    exit 0
fi

echo "=== Three-Copy Scan ==="
echo "Persona dir  : $PERSONA_DIR"
echo "Skill name   : $SKILL_NAME"
echo ""

# Gather all locations
declare -a ALL_LOCATIONS=()
declare -a CANONICAL=()
declare -a INTRINSIC=()

while IFS= read -r -d '' dir; do
    ALL_LOCATIONS+=("$dir")
    # Classify by path
    if echo "$dir" | grep -qE '(intrinsic/capabilities|intrinsic/addons)'; then
        INTRINSIC+=("$dir")
    else
        CANONICAL+=("$dir")
    fi
done < <(find "$LIBRARY_DIR" -maxdepth 3 -type d -name "$SKILL_NAME" -print0 2>/dev/null | sort -z)

TOTAL="${#ALL_LOCATIONS[@]}"
CANON_COUNT="${#CANONICAL[@]}"
INTRI_COUNT="${#INTRINSIC[@]}"

if [ "$TOTAL" -eq 0 ]; then
    echo "🔍  Skill '$SKILL_NAME' not found anywhere in .library/"
    exit 0
fi

echo "Locations found: $TOTAL (canonical: $CANON_COUNT, intrinsic: $INTRI_COUNT)"
echo ""

for loc in "${ALL_LOCATIONS[@]}"; do
    # Determine type label
    label=""
    if echo "$loc" | grep -q 'intrinsic/capabilities'; then
        label="[intrinsic/capability]"
    elif echo "$loc" | grep -q 'intrinsic/addons'; then
        label="[intrinsic/addon]"
    elif echo "$loc" | grep -q 'custom/'; then
        label="[custom]"
    elif echo "$loc" | grep -q '\.library_shared'; then
        label="[shared]"
    else
        label="[other]"
    fi

    # Check for SKILL.md
    if [ -f "$loc/SKILL.md" ]; then
        lines=$(wc -l < "$loc/SKILL.md")
        echo "  ✓ $label  $loc  ($lines lines)"
    else
        echo "  ⚠️  $label  $loc  (no SKILL.md — empty directory?)"
    fi
done

echo ""

# Canonical conflict check
if [ "$CANON_COUNT" -gt 1 ]; then
    echo "❌  ERROR: Skill '$SKILL_NAME' exists in $CANON_COUNT user-writeable locations!"
    echo "   This is the 'three-copy drift' anti-pattern."
    echo "   Consolidate to ONE canonical location and symlink or remove duplicates."
    exit 1
elif [ "$CANON_COUNT" -eq 1 ]; then
    echo "✅  Single canonical location — no drift."
else
    echo "ℹ️   Skill only exists in intrinsic directories (system-provided)."
fi

echo ""
echo "=== Scan Complete ==="
