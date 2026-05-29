# Impersonation Methodology

> A reusable methodology for distilling any academic or public figure into a deep, structured persona skill — using an agent network for parallel extraction, cross-validation, and systematic quality control.

This repository is a **reverse distillation** of the [Marco Velli persona](https://github.com/huangzesen/marco-velli) project. What started as building one figure's persona became a methodology for doing it again, better, with less hallucination and more authenticity.

---

## Why This Exists

Persona engineering (convincingly impersonating a real person with an AI) faces three hard problems:

| Problem | What goes wrong | How this methodology addresses it |
|---------|----------------|-----------------------------------|
| **Hallucination** | AI invents papers, quotes, collaborations that never existed | 7-field VA claim schema forces every assertion to have a source. Citekey cross-validation catches invented references. |
| **Voice authenticity** | AI sounds generic — no distinctive metaphors, humor, or argument patterns | 4-piece profile (voice, values, biography, relationships) combined with method cards that capture cognitive fingerprints. |
| **Source discipline** | AI confuses public and private knowledge, mixes eras, flattens complexity | Three-tier source framework. Semantic drift detection. Close-out checklist with 44 verifiable items. |

The methodology is not a research paper about persona engineering — it is a **reproducible process** with templates, scripts, and a failure catalog.

---

## Structure

This repository follows the [LingTai recipe bundle format](https://github.com/huangzesen/lingtai/blob/main/tui/internal/preset/skills/lingtai-recipe/references/recipe-format.md): a `.recipe/` dotfolder with the recipe manifest, plus a sibling library folder named `impersonate-meta` containing the skill itself.

```
impersonate-meta/                       # this repo (recipe bundle root)
├── .recipe/
│   └── recipe.json                     # bundle manifest
├── README.md                           # you are here
└── impersonate-meta/                   # the library folder
    └── impersonate-meta/               # the skill
        ├── SKILL.md                    # entry point — 5 patterns, 7 anti-patterns, close-out checklist
        ├── primers/                    # how to research a person
        │   ├── research-a-person.md    #   full research workflow (primary/secondary/tertiary sources)
        │   ├── reading-the-web.md      #   extracting signal from web content
        │   └── online-pitfalls.md      #   6 types of LLM hallucination + 6 search traps
        ├── scripts/                    # quality automation
        │   ├── verify_citekeys.sh      #   cross-refs citekeys between .bib and arguments
        │   ├── prune_bib.py            #   strips unreferenced bib entries (brace-depth safe)
        │   ├── token_count.sh          #   estimates token consumption
        │   └── three_copy_scan.sh      #   detects drift across skill copies
        ├── templates/                  # reusable production templates
        │   ├── va_template.md          #   blank 7-field VA claim schema
        │   ├── vm_template.md          #   blank method card with induction guide
        │   ├── profile_skeleton.md     #   complete 4-piece profile skeleton
        │   └── bib_entry_template.bib  #   5 entry types + journal abbreviations
        ├── failure-catalog.md          # 13 real failure cases from the Velli project
        └── archive/                    # historical versions
            └── SKILL-v1.md             # v1.0 of this skill (3-stage pipeline design)
```

---

## How to Use

### Full Process (LingTai or any agent network)

1. **Read** `SKILL.md` — understand the 5 patterns and 7 anti-patterns
2. **Study** the `primers/` — how to research a person without falling into AI traps
3. **Copy** the `templates/` — customize for your target figure
4. **Launch** an agent network — one coordinator + specialized research avatars
5. **Run** the close-out checklist (44 items, all verifiable by command)
6. **Use** the `scripts/` — validate citekeys, prune bibliography, scan for drift

### As a LingTai recipe

If you use the [LingTai](https://github.com/huangzesen/lingtai) agent platform, clone this repo and launch the TUI from inside it — the `.recipe/` bundle is picked up automatically:

```bash
# 1. Clone the recipe bundle anywhere you'd like to host the project
git clone https://github.com/huangzesen/impersonate-meta
cd impersonate-meta

# 2. Launch the TUI from the bundle root
lingtai-tui
```

The TUI detects the `.recipe/` dotfolder, applies the bundle to the project, registers `impersonate-meta/` as a library, and makes the methodology available to every agent on first launch.

### As a standalone reference

Anyone building a persona skill — even without LingTai — can use this as plain markdown + scripts:

1. Read `impersonate-meta/impersonate-meta/primers/research-a-person.md` to plan research
2. Use `impersonate-meta/impersonate-meta/templates/va_template.md` to structure your first argument
3. Run `impersonate-meta/impersonate-meta/scripts/verify_citekeys.sh` on your bibliography
4. Check `impersonate-meta/impersonate-meta/failure-catalog.md` to avoid mistakes already made

### Quick start (bare clone)

```bash
git clone https://github.com/huangzesen/impersonate-meta
cd impersonate-meta/impersonate-meta   # the skill folder

# Read the methodology
cat SKILL.md

# Copy templates into your own project
cp -r templates/ ~/your-project/

# Read the research workflow
cat primers/research-a-person.md
```

---

## The Core: 5 Patterns + 7 Anti-Patterns

### Patterns (what to do)

| # | Pattern | Summary |
|---|---------|---------|
| 1 | **VA Claim Schema** | Every claim gets 7 fields: Claim, What he did, The product, Primary results, Context, Citekeys, Cross-refs |
| 2 | **Source Discipline as Mechanism** | Not just "cite the source" but enforce it structurally — the schema makes unfounded claims visible |
| 3 | **4-Piece Profile Scorecard** | Biography + Voice + Values + Relationships — four orthogonal dimensions of personhood |
| 4 | **Cognitive Fingerprints → Method Cards** | Extract thinking patterns from ≥3 VA instances each, not from one |
| 5 | **Progressive Exposure Loading Table** | Load the persona in tiers: Voice → Values → Claims → Methods |

### Anti-Patterns (what to avoid)

| # | Anti-Pattern | The fix |
|---|------------|---------|
| 1 | **Metadata Decay** | SKILL.md header drifts from reality. Fix: `wc -w`, grep counts, commit at milestones |
| 2 | **Token Bloat** | Unreferenced bib entries accumulate. Fix: `prune_bib.py` |
| 3 | **Citation Discipline** | Broken citekeys (D-class). Fix: `verify_citekeys.sh` |
| 4 | **Citation Bloat** | Flooding with VA claims but never citing. Fix: enforce Cross-refs field |
| 5 | **Three-Copy Drift** | Same skill diverges across library/custom/, shared/, and root/ |
| 6 | **"Dispatched" ≠ "Done"** | Spawning a writer avatar doesn't create output. Fix: check files on disk |
| 7 | **Premature Export** | Exporting before QA catches semantic drift. Fix: close-out checklist first |

---

## Known Case Study

- **[Marco Velli persona](https://github.com/huangzesen/marco-velli)** — 105 VA claims, 10 method cards, 7 physics domains, 338 bibliography entries (77 directly cited). Built through iterative agent collaboration. This methodology is the generalization of that project.

---

## Failure Catalog

The `failure-catalog.md` documents 13 real failures from the Velli project, each with:

- **Symptom** — what the human saw
- **Root Cause** — why it happened
- **Detection** — how we found it
- **Fix** — what we did
- **Prevention** — what the methodology now does to prevent recurrence

Failure types range from fabricated papers (`wyper2026` in a massage therapy journal) to semantic drift (citekey pointing to a real paper but prose describing a different one) to self-archiving (an avatar's soul-flow archived its own output).

---

## License

MIT — free to use, modify, and distribute.

---

## Related

- [Marco Velli persona](https://github.com/huangzesen/marco-velli) — The case study that produced this methodology
- [LingTai](https://github.com/huangzesen/lingtai) — The multi-agent orchestration platform (TUI + portal)

---

## Examples

- [`examples/chuanfei-writing/`](examples/chuanfei-writing/) — a target-specific manuscript-writing skill distilled from Chuanfei Dong MAVEN switchback draft samples using this methodology plus a Zhipu GLM review pass.
