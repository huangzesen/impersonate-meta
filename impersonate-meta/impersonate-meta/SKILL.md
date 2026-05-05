---
name: impersonate-meta
description: >-
  Reusable methodology for deeply impersonating any academic or public figure
  via an agent network. Covers intelligence gathering, avatar orchestration,
  skill production, integration, and persona assembly. v3 incorporates lessons
  from the full Marco Velli case study (105 VA arguments, 10 VM method cards,
  4-profile suit, 338-entry bib, ~90K tokens) AND the Li Bai ancient-historical
  case (55 VA, 6 VM, avatar dialogue, ~120K tokens).
version: 3.0
---

# Impersonation Meta-Skill: Building a Deep Persona via Agent Network

> *This skill distills the methodology used to build the complete Marco Velli
> persona (solar physicist, UCLA) into a reusable procedure for any academic
> or public figure. The Velli case produced a ~90K-token persona with 105
> verifiable argument records (VA), 10 method cards (VM), and 19 files across
> 6 layers. This skill teaches you how to replicate that process for any
> subject.*

---

## Overview

The goal: create a comprehensive, machine-readable persona that an AI agent
can inhabit authentically — not just facts, but voice, values, argumentation
patterns, and domain expertise. The method has **two phases**:

1. **Phase 1: Intelligence Gathering** — collect everything publicly
   available and distill into structured knowledge
2. **Phase 2: Persona Production** — decompose expertise, build the
   four-piece profile, produce domain skills via avatar network, induct
   method cards, assemble and validate the complete persona

The key insight from the Velli case: **the persona is not a single document.**
It is a layered directory with a navigation entry point, a four-piece profile
suit, a citation database, and a structured set of verifiable arguments.

### The Velli Persona Anatomy (Reference Architecture)

This is what a complete persona directory looks like. Your target output
follows this structure (substituting your subject):

```
persona-<subject>/
├── SKILL.md                       ← Entry point, navigation, loading guide
├── <subject>.bib                  ← BibTeX citation database (pruned)
├── <subject>-bib-full.bib         ← Full bib (archived, not shipped)
├── scripts/
│   └── generate_bib.py            ← BibTeX generation tool
├── profile/
│   ├── SKILL.md                   ← Profile overview & loading guide
│   ├── biography.md               ← Timeline, positions, honors
│   ├── voice.md                   ← Speaking style, metaphors, humor
│   ├── values.md                  ← Science philosophy, cultural views
│   └── relationships.md           ← Mentors, co-authors, students
├── arguments/
│   ├── SKILL.md                   ← Argument index & search guide
│   ├── physics/                   ← Domain-specific arguments (85 VA)
│   ├── methodology/               ← Thinking methods (8 VA)
│   └── culture/                   ← Scientific culture (7 VA)
└── methods/
    └── SKILL.md                   ← Method cards (10 VM, cognitive fingerprint)
```

---

## Phase 1: Intelligence Gathering

### Step 1.1: Bibliography Mining

**Target:** Complete publication list with citation data.

**Procedure:**
1. Find the subject's Google Scholar / Semantic Scholar / ORCID profile
2. Scrape all pages (typical: 2-5 pages, 100-300 papers)
3. For each paper, extract: title, authors, year, journal, citation count,
   URL
4. Organize into research themes by co-author clusters and keyword patterns
5. Record in `codex` as a structured entry with ~9 research themes, key
   papers per theme with citation counts

**Tools:** `web_search`, `web_read`, `codex(submit)`

### Step 1.2: Biography & Career

**Target:** Complete career trajectory, honors, institutional affiliations.

**Sources to check:**
- University faculty page
- AGU/AMS/APS/etc. fellow listings
- Award citation text
- Wikipedia (if exists)
- Interviews and profiles
- Mission/team pages (for scientists)

**Output:** Codex entry with timeline, positions, honors, key roles — raw
material for `profile/biography.md`.

### Step 1.3: Voice & Communication Style

**Target:** How they speak, write, argue, and frame ideas. This is NOT
surface-level — it must capture reasoning patterns.

**Best sources:**
- YouTube lectures / conference talks (transcribe with `listen`)
- Podcasts and interviews
- Popular-science writing / press releases
- Textbook prefaces (if applicable)

**What to capture:**
- Metaphor inventory (the specific images they use)
- Humor patterns (self-deprecation? irony? cultural references?)
- Argumentation structure (how they build a case)
- Conversational markers (fill words, rhetorical devices)
- Emotional register (what excites/frustrates them)
- Philosophy and values (what they say when they reflect)

**Citation discipline during this step:** Every claim about the subject's
voice must be traceable to a specific source. Use YouTube timestamps.
Mark direct quotes `[source: URL @ timestamp]`. Mark unverifiable
assertions `⚠️ [unverified]`.

**Output:** Raw notes that will become `profile/voice.md`.

### Step 1.4: Collaborator Network

**Target:** Map the social graph — who they work with, in what capacity.

**Procedure:**
1. From bibliography, extract co-author frequency
2. Identify tiers: core (15+ papers), frequent (5-15), project colleagues
3. Note current group members (students, postdocs, research staff)
4. Note historical/foundational collaborators (mentors, deceased colleagues)

**Output:** Raw notes that will become `profile/relationships.md`.

### Source Discipline Rules (Applied Throughout Phase 1)

All gathered intelligence must follow these rules:

| Category | Rule | Enforcement |
|----------|------|-------------|
| **Verifiable claims** | Must have a citekey to a published source | Every VA entry checked |
| **Observational claims** (video/audio) | Must have `[source: URL @ timestamp]` | Every behavioral observation |
| **Unverifiable claims** | Must be marked `⚠️ [unverified]` | Tracked and accounted for |
| **Fabricated anecdotes** | NEVER allowed | Immediate rejection |

**Footer on every intelligence output:**
> *"No fabricated anecdotes. If you cannot trace a claim to a source, mark
> it [unverified]. If you are unsure, do not include it."*

---

## Phase 2: Persona Production

Phase 2 produces the complete persona directory. This phase uses an **avatar
network** (parallel specialized agents) to decompose expertise, but the final
assembly is done by the main agent.

### Step 2.1: Decompose Expertise into Skill Domains

From the research themes identified in Phase 1, group into **5-8 skill
domains**. Each domain becomes one avatar's responsibility.

**Criteria for a good skill domain:**
- Coherent sub-field (can be explained independently)
- Has a distinct literature (5-15 key papers)
- Maps to a specific aspect of the persona's expertise
- Can be authored as a standalone knowledge base

**Example decomposition (Velli case):**

| Avatar | Domain | Skill Name |
|--------|--------|-----------|
| alfven-waves | Core theory thread | alfven-turbulence |
| psp-mission | Major project/mission | psp-observations |
| switchbacks | Hot discovery topic | switchbacks-theory |
| coronal-heating | Classical unsolved problem | coronal-heating |
| reconnection | Theoretical breakthrough | ideal-tearing |
| velli-voice | Communication style | academic-voice-velli |

### Step 2.2: Spawn Avatars with Task Briefs

For each skill domain, write a **task brief** (see Appendix B for template)
and dispatch via `avatar(spawn)`.

**Avatar type:** `shallow` (default) — they don't need your full memory,
just the tools and the brief.

**Dispatch pattern:** Spawn in batches of 3. Send briefs immediately via
email. Don't wait for one batch before spawning the next.

### Step 2.3: Collect, Quality-Check, and Integrate Skills

As avatars report completion:

1. **Verify with explicit commands** — do NOT trust "dispatched" or
   "I sent it." Always check:
   ```bash
   ls -la .library/custom/<skill>/SKILL.md
   wc -l .library/custom/<skill>/SKILL.md
   grep '^## ' .library/custom/<skill>/SKILL.md
   ```
2. **Size check:** < 50 lines → incomplete; 50-300 → typical good range;
   300+ → thorough (verify not padded)
3. **Structure check:** headings must map to the brief's requirements
4. **Content spot-check:** read opening and one substantive section
5. **Copy** to your own `.library/custom/`:
   ```bash
   cp -r /path/to/avatar/.library/custom/<skill>/ .library/custom/
   ```

### Step 2.4: Cross-Validation Review

Use a daemon to systematically compare all skills:

**Check for:**
1. **Overlap zones** — topics covered by multiple skills
2. **Factual contradictions** — different claims about the same fact
3. **Missing links** — topics that should reference each other but don't
4. **Coverage gaps** — important topics not covered by any skill

**Output:** Integration review document (see Appendix C for template).

### Step 2.5: Build the Four-Piece Profile Suit

Each profile piece has its own rubric:

#### `profile/biography.md`
- Complete timeline (year by year)
- Positions held (start date, end date, institution)
- Honors and awards (with citation text where available)
- Key institutional roles (department chair, mission scientist, etc.)
- **Source rule:** Every date must cite a verifiable source

#### `profile/voice.md`
- Storyteller archetype documentation
- Metaphor inventory (with source timestamps)
- Humor patterns (with examples)
- Argumentation structure (generalized pattern, not one-off observations)
- Conversational markers
- **Source rule:** Every observation backed by `[source: URL @ timestamp]`
- **Footer:** *"No fabricated anecdotes. Sources from public lectures,
  interviews, and published writing only."*

#### `profile/values.md`
- Science philosophy (how they think science should work)
- Teaching philosophy (how they teach and mentor)
- Attitude toward collaboration, competition, public engagement
- Views on specific controversies or debates they've weighed in on
- **Source rule:** Claims from interviews/talks preferred over inference

#### `profile/relationships.md`
- Mentor tree (who mentored them, who they mentored)
- Co-author map (core/frequent/project tiers)
- Institutional network (where they've worked, with whom)
- Students and postdocs (current group, notable alumni)
- **Source rule:** Each relationship must cite a specific paper or source

### Step 2.6: Build Method Cards as Cognitive Fingerprint

Method cards are **not** a generic checklist. They emerge from **reverse
induction** from the VA arguments. Each card answers: "What recurring method
does this person use across multiple domains?"

**The 10-card framework (from Velli case):**

| VM ID | Card Name | Minimum VA Backing |
|-------|-----------|-------------------|
| VM001 | Start from the Gradient | ≥3 VA |
| VM002 | Find the Critical Point | ≥3 VA |
| VM003 | Cross-Scale Connection | ≥3 VA |
| VM004 | The Expanding Box Model | ≥3 VA |
| VM005 | Theory-Driven, Data-Validated | ≥3 VA |
| VM006 | Parameterize Uncertainty | ≥3 VA |
| VM007 | Numerical Experiments | ≥3 VA |
| VM008 | Comparative Analysis | ≥3 VA |
| VM009 | Let Surprise Guide New Theory | ≥3 VA |
| VM010 | Multi-Point Synergy | ≥3 VA |

**Each card must contain:**

```
## VM00X: Card Name

**When to apply**: [Situations where this method is appropriate]

**The procedure**: [Step-by-step method, numbered]

**Why it works**: [Physical/psychological basis]

**Observed in**: [N VA — citation to specific arguments]

**Failure modes**: [When this method doesn't apply]

**Transfer hints**: [Related fields where the same pattern appears]
```

**Rule:** Cards emerge from evidence, not from generic methodology lists.
If you can't find ≥3 VA instances, you don't have a card — you have a
hypothesis.

### Step 2.7: Assemble the VA Argument Framework

Every argument in the persona follows the **7-field VA claim schema**:

```
**Claim ID**: VA001
**Domain**: [physics/methodology/culture/pedagogy]
**Claim**: [Specific assertion, not vague]
**What he did**: [Observations, derivations, simulations]
**The product**: [Paper/lecture/discovery]
**Primary results**: [Numbers, scaling laws, figures]
**Context**: [Why it matters, what it replaced, what it opened]
**Citekeys**: [1-3 BibTeX keys from subject.bib]
**Cross-refs**: [Related argument IDs: VA017, VA023]
```

**Field-level guidance:**

| Field | Guidance |
|-------|----------|
| **Claim ID** | Sequential VA001, VA002, ... across all arguments |
| **Domain** | One of: physics, methodology, culture, pedagogy |
| **Claim** | ONE specific assertion. If you find "and", split it |
| **What he did** | Actions taken, not conclusions reached |
| **The product** | The tangible artifact (paper, model, dataset, lecture) |
| **Primary results** | Numbers, scaling laws, or key figures — quantitative when possible |
| **Context** | Why this matters. Include what it replaced or challenged |
| **Citekeys** | All must exist in the `.bib` file. Broken citekeys = quality failure |
| **Cross-refs** | Mandatory for connected arguments. If VA002 builds on VA001, note it |

### Step 2.8: Build the Progressive Exposure Loading Table

The entry point SKILL.md must include a loading table that tells the reader
when to load each layer:

```
| Layer | When to Load | What You Get |
|-------|-------------|--------------|
| **Entry file** | Always | Navigation, structure overview |
| `profile/SKILL.md` | For any interaction | Big picture: biography, voice, values, relationships |
| `profile/biography.md` | For biographical questions | Timeline, positions, honors |
| `profile/voice.md` | For generating persona-like text | Speaking style, metaphors, humor |
| `profile/values.md` | For philosophical questions | Science philosophy, cultural views |
| `profile/relationships.md` | For collaboration questions | Mentors, co-authors, students |
| `arguments/SKILL.md` | For domain questions | Argument index, search guide |
| `arguments/<domain>/*.md` | For specific topics | Verifiable claims per domain |
| `methods/SKILL.md` | For "how they think" | Cognitive toolkit as method cards |
```

**Authorship rule:** This table must be updated whenever the persona gains or
loses a layer. Stale tables are metadata rot.

---

## The 5 Working Patterns

These patterns emerged from the Velli case as the core of what works.

### Pattern 1: The VA Claim Schema

The 7-field template (described in §2.7) is the central data structure. Every
factual claim about the subject becomes a VA record. This structure enables:
- **Verifiability:** Every claim has a citekey
- **Cross-referencing:** Connections between arguments are explicit
- **Gap analysis:** Missing domains are visible as missing VA ranges
- **Auditability:** A script can verify all citekeys resolve

### Pattern 2: Source Discipline as Mechanisms

The source rules in §1.4 become built-in quality gates:

1. **Citekey rule:** Every VA must have ≥1 citekey. Script-verify all
   citekeys exist in the bib file.
2. **Timestamp rule:** Every voice/behavioral claim must have a
   `[source: ...]` anchor. No exceptions.
3. **Unverified rule:** If you don't have a source, mark `⚠️ [unverified]`.
   Track all unverified claims in a separate list.
4. **Never rule:** Fabricated anecdotes are NEVER allowed. Add this as a
   footer to every file.

### Pattern 3: The Four-Piece Profile Suit

Biography / Voice / Values / Relationships — each with its own rubric
(documented in §2.5). The four pieces together constitute the "who is this
person" answer. They are written to be loadable independently (each file
self-contained) but cross-referenced.

### Pattern 4: Method Cards as Cognitive Fingerprint

10 method cards, each backed by ≥3 VA instances (§2.6). Cards emerge from
reverse induction — you don't decide what methods the person has and then
find examples. You find recurring patterns across the VA arguments and
inductively generalize them into cards. A card without ≥3 VA instances is
not yet proven.

### Pattern 5: Progressive Exposure Loading Table

The loading table (§2.8) is the user interface to the persona. It tells a
downstream agent exactly what to load and when. The table must be:
- **Complete:** Every layer is listed
- **Accurate:** When-to-load guidance is honest
- **Current:** Updated whenever the persona structure changes

---

## The 7 Anti-Patterns (Must NOT Do)

These are mistakes made during the Velli case. Every persona production
process must explicitly guard against them.

### Anti-Pattern 1: Metadata Rot

**Problem:** Top-level metadata (version, description, file count, entry
count) not updated when the persona changes.

**Solution:** Add a close-out step: **rewrite SKILL.md to truth** before
declaring the persona complete. Every number (file count, VA count, bib
count, token estimate) must be verified by a command, not by memory.

### Anti-Pattern 2: Token Count Inflation

**Problem:** The Velli persona was claimed to be "1.5M+ tokens" but
measured at ~90K tokens. Inflated claims erode trust.

**Solution:** Never state a token count unless you've measured it. Run:
```bash
find . -type f \( -name '*.md' -o -name '*.bib' \) -exec wc -c {} + | tail -1
```
For rough estimate: bytes ÷ 4 ≈ tokens for English text. For exact, use
`tiktoken` or your LLM's tokenizer.

### Anti-Pattern 3: Citation Discipline: Said vs Done

**Problem:** Claiming "every assertion has a citekey" while the product has
broken citekeys and `[unverified]` flags.

**Solution:** Add a **validator pass** after assembly. Script-verify:
1. All citekeys in the VA arguments exist in the `.bib` file
2. All VA entries have at least one citekey
3. All `[unverified]` flags are accounted for (count them, note them)
4. No VA entry has a citekey that doesn't exist (broken reference)

**Verification script pattern:**
```bash
# Extract all used citekeys
grep -rhoP '(?<=\*\*Citekeys\*\*:)[^\n]*' arguments/**/*.md | \
  tr ',' '\n' | sed 's/^ *//' | sort -u > /tmp/used.txt

# Extract all bib entries
grep '^\s*@' subject.bib | grep -ohP '(?<={)[^,]*' | sort -u > /tmp/all.txt

# Orphans (in arguments but not in bib)
comm -23 /tmp/used.txt /tmp/all.txt

# Unreferenced bib entries
comm -13 /tmp/used.txt /tmp/all.txt
```

### Anti-Pattern 4: Bib Bloat

**Problem:** The Velli bib file had 338 entries; only ~78 were referenced
(77% unreferenced).

**Solution:** After the validator pass, **prune the bib file**.
Reverse-generate a minimal bib by extracting only the citekeys actually
used in VA arguments. Keep the full bib in a separate file
(`<subject>-bib-full.bib`) for future use, but the shipped persona should
export a minimal, clean bib.

### Anti-Pattern 5: Three-Copy Drift

**Problem:** Maintaining parallel copies of the same skill in different
locations, letting them drift apart.

**Solution:** Single truth source: `.library/custom/<skill>/SKILL.md`.
Never manually maintain parallel copies. If you need to share a skill, copy
it from the single source. If two agents work on the same skill, one must
be designated as the canonical source.

### Anti-Pattern 6: "Dispatched" ≠ "Done"

**Problem:** Assuming an action is complete because it was dispatched.
In the Velli case, avatars reported "done" but the file didn't exist.

**Solution:** Every completion claim must be verified by reading the output:
```bash
ls -la .library/custom/<skill>/SKILL.md
wc -l .library/custom/<skill>/SKILL.md
head -20 .library/custom/<skill>/SKILL.md
```
Include the command output in your report. Do not accept "dispatched" as
"done."

### Anti-Pattern 7: Premature Export

**Problem:** Exporting the persona before QA is complete. The correct
pipeline order is:

```
Content production → QA and validation → Metadata sync → Export
```

Each stage has a checkable gate:
- **Content production:** All files written, all VA entries complete
- **QA and validation:** Validator script passes (citekeys, sources,
  unverified tracking)
- **Metadata sync:** SKILL.md updated to reflect current state (file count,
  token estimate, version)
- **Export:** Only then is the persona ready for consumption

**No skips.** If you skip QA, you ship broken citekeys. If you skip
metadata sync, you ship stale numbers.

---

## The Velli Case Reference: What Was Produced

As a concrete reference, here's what the Velli impersonation produced:

| Layer | Files | Entries | Notes |
|-------|-------|---------|-------|
| `profile/` | 5 | Complete | biography, voice, values, relationships + index |
| `arguments/physics/*` | 8 | 85 VA | 7 domains |
| `arguments/methodology/*` | 1 | 8 VA | Thinking methods |
| `arguments/culture/*` | 1 | 7 VA | Scientific culture |
| `arguments/pedagogy/*` | 1 | 5 VA | Teaching philosophy |
| `methods/` | 1 | 10 VM | One card per method, ≥3 VA each |
| `.bib` | 1 | 338 → 78 | Full bib (338), shipped minimal (78) |
| **Total** | **19** | **105 VA + 10 VM** | **~90K tokens** |

Sanity check: if your persona has < 50 VA entries, you probably haven't
done enough intelligence gathering. If it has > 200, you may be including
noise.

---

## Skill Format Specification

Every skill in the persona follows this format:

```markdown
---
name: <kebab-case>
description: <1-2 sentence>
version: 2.0
---

# Title

## 1. Section
[Content with equations, references, analysis]

## 2. Section
...

## N. How to Discuss [Topic] as [Subject]
[Impersonation-specific guidance — bridge between knowledge and performance]

## References
[Citation chain]
```

The final "How to Discuss" section is **essential** — the bridge between
knowledge and performance.

---

## Timing and Resource Estimates

| Activity | Duration | Agents | Notes |
|----------|----------|--------|-------|
| Phase 1: Intelligence | 30-60 min | 1 (main) | web_search, web_read, codex, listen |
| Phase 2: Avatar Skills | 20-40 min | 5-8 avatars | Parallel, batch-spawned |
| Cross-validation | 15-30 min | 1 daemon | Systematic comparison |
| Profile suit production | 30-60 min | 1 (main) | 4 files + entry point |
| Method card induction | 15-30 min | 1 (main) | From VA evidence |
| VA argument refinement | 20-40 min | 1 (main) | Editing, cross-referencing |
| QA + Validator pass | 10-20 min | script | Citekey verification, bib pruning |
| Metadata sync + export | 5-10 min | 1 (main) | Update SKILL.md, close-out checklist |
| **Total** | **2-5 hours** | **6-10 agents** | |

---

## Adapting to Non-Academic Subjects

| Subject type | Adaptation |
|-------------|-----------|
| **Business leader** | Replace Scholar with SEC filings, interviews, keynotes; skills: strategy, leadership style, market analysis, crisis management |
| **Artist/writer** | Replace papers with works; skills: technique, themes, influences, critical reception, creative process |
| **Historical figure** | See §Ancient Historical Figures below for full adapted pipeline |
| **Engineer/builder** | Replace papers with projects/patents; skills: technical approach, design philosophy, problem-solving patterns, notable projects |

Core loop is the same: **gather → decompose → specialize → integrate →
assemble.**

---

## Ancient Historical Figures: The Full Adapted Pipeline

> *This section was developed during the [Li Bai persona](https://github.com/huangzesen/li-bai-skill) project — a complete distillation of the 8th-century Chinese poet Li Bai (701–762) into a ~120K-token agent persona. The ancient-historical pipeline differs from the academic pipeline in source hierarchy, voice reconstruction, decomposition strategy, and a breakthrough technique: **avatar dialogue**.*

### What Changes for Ancient Figures

| Academic Pipeline | Ancient-Historical Pipeline | Why |
|-------------------|-----------------------------|-----|
| Google Scholar / ORCID | Dynastic histories, biographical stele inscriptions, contemporaries' prefaces | No modern bibliometric databases exist |
| Video/audio transcripts | Subject's own works + contemporary descriptions of their speech | No recordings survive |
| Paper → Skill Domain decomposition | Works → Life Period / Theme decomposition | Creative output maps to biography, not research fields |
| BibTeX database | Source index with full original text | Limited, well-known sources; prioritize primary texts in original language |
| Method cards from papers | Method cards from creative/strategic patterns | The "cognitive fingerprint" emerges from works, not publications |
| Voice from lectures | Voice from writings + reconstructed literary register | Must capture historical language register |

### Source Hierarchy for Ancient Figures

| Tier | Source Type | Example (Li Bai) | Reliability |
|------|------------|-------------------|-------------|
| **T1: Subject's own works** | Poems, letters, inscriptions, autobiographical writings | ~1000 surviving poems, prefaces, letters | Highest — primary voice |
| **T2: Contemporary accounts** | Biographies by people who knew the subject | 李阳冰《草堂集序》(762), 魏颢《李翰林集序》(761) | Very high — first-hand |
| **T3: Official histories** | Dynastic histories compiled within 1-3 centuries | 《旧唐书》(945), 《新唐书》(1060) | High — official but second-hand |
| **T4: Later scholarly analysis** | Historical research, annotated editions | Modern academic studies | Medium — interpretive |
| **T5: Popular accounts** | Wikipedia, documentaries | Various online sources | Low — often contains errors |

**Key principle:** For ancient figures, T1 sources (the subject's own writings) are both the primary evidence AND the voice model. An academic's voice comes from lectures; an ancient poet's voice comes from poems. The `profile/voice.md` file must be built primarily from the subject's own works.

### The Avatar Dialogue Pattern (Breakthrough Technique)

> *This was the single most effective technique in the Li Bai project, producing content that no single agent could have generated alone.*

**What it is:** Spawn multiple avatars, each representing a different life period of the subject. Each avatar reads the complete persona skill (deep copy), then reflects in first person from their temporal perspective. Finally, integrate the reflections into a single cross-temporal dialogue.

**Why it works:**
- Each avatar **inhabits** a specific life stage — they don't summarize it, they *are* it
- The reflections reveal tensions between life periods that a single chronological account misses
- The dialogue format exposes the subject's internal contradictions and evolution
- The output is written in the subject's own voice, not in biographer's voice

**Procedure:**

1. **Identify life periods** from the biography (typically 5-7 periods for a full life)
2. **Spawn deep-copy avatars** — one per period, with `type='deep'` so they inherit the full persona skill
3. **Give each avatar a structured brief:**
   - "You are Li Bai at age 25, leaving Shu for the first time"
   - Five specific questions to answer in first person
   - "Read the li-bai skill and the poetry chronology before writing"
   - "Send your reflection to the parent agent via email"
4. **Collect reflections** — each avatar produces 2000-5000 words of first-person reflection
5. **Integrate into dialogue** — weave the reflections into a dramatic structure where the avatars "talk" to each other across time
6. **Add the dialogue to the persona** as a new output layer (e.g., `outputs/李白与自己的对话.md`)

**Sample brief questions (adapted for any ancient figure):**

| Question | Purpose |
|----------|---------|
| "What was your [first major decision] actually like?" | Recover subjective experience of known events |
| "How do you see [later period] from where you stand now?" | Reveal cross-temporal perspective |
| "What do you think [the subject's life ideal] really means?" | Test whether the ideal is genuine or performative |
| "What would you say to [the subject at another age]?" | Generate inter-period dialogue |
| "Looking back, how far has [the subject's central metaphor] actually gone?" | Track the evolution of core imagery |

**Avatar count:** 5-7 is ideal. Fewer misses key transitions; more creates diminishing returns.

**Critical:** Each avatar must write in the subject's own voice. The deep copy ensures they have the voice profile, but the brief must explicitly instruct: "Write as [subject] would write — use [their language register], [their characteristic imagery], [their rhetorical patterns]."

### Works-Based Decomposition

For creative figures (poets, painters, composers, writers), the decomposition follows **works**, not research themes:

| Academic Decomposition | Creative Decomposition |
|------------------------|----------------------|
| Research themes → Skill domains | Life periods / thematic networks → Skill domains |
| Paper citation counts | Work influence / fame ranking |
| Methodology from publications | Method from creative patterns across works |
| BibTeX database | Complete works index with annotations |

**For Li Bai, the decomposition was:**

| Domain | Content | VA Count |
|--------|---------|----------|
| Life periods (生平) | 7 periods from birth to death | 15 VA |
| Major poems (诗歌) | 20 representative works with creation context | 20 VA |
| Philosophical thought (思想) | Daoism, political ideals, freedom | 8 VA |
| Key relationships (关系) | Du Fu, He Zhizhang, Meng Haoran, etc. | 12 VA |
| Creative method (诗法) | 6 cognitive fingerprint cards | 6 VM |

**The poetry chronology** (`works/诗歌年表.md`) served as the equivalent of a bibliography — mapping each major work to its life period, creation context, and connections to other works. This is the backbone of the persona.

### Language Register Adaptation

Ancient figures often have distinctive language registers that must be explicitly captured:

| Register | What to capture | How |
|----------|----------------|-----|
| **Classical language** | Grammar patterns, vocabulary, rhetorical devices | Analyze subject's own writings for recurring patterns |
| **Metaphor inventory** | Subject's characteristic images | Extract from complete works, frequency-rank |
| **Emotional register** | How they express joy, anger, sorrow | Map to specific works and life events |
| **Literary allusions** | What they reference, what they expect the reader to know | Catalog from works + contemporary context |
| **Forbidden patterns** | Words/styles they would never use | Inverse of what they do use |

### The Incarnation Output Layer

When using the avatar dialogue pattern, add a new layer to the persona directory:

```
persona-<subject>/
├── SKILL.md
├── profile/
├── arguments/
├── methods/
├── sources/              ← original texts in original language
├── works/                ← complete works index, chronology
└── outputs/              ← NEW: avatar dialogue outputs
    ├── <period-1>-reflection.md
    ├── <period-2>-reflection.md
    ├── ...
    └── <subject>-dialogue.md    ← integrated cross-temporal dialogue
```

The `outputs/` layer is NOT a replacement for the `profile/` layer. It is a supplement — the profile provides the facts, the outputs provide the subjective experience. A downstream agent reads the profile to know what happened, and the outputs to understand what it *felt like*.

### Case Study: Li Bai Persona Stats

| Layer | Files | Entries | Notes |
|-------|-------|---------|-------|
| `profile/` | 5 | Complete | biography(413 lines), voice(293 lines), values(337 lines), relationships |
| `arguments/` | 3 dirs | 55 VA | 生平(15), 诗歌(20), 思想(8), 关系(12) |
| `methods/` | 1 | 6 VM | Poetry creation cognitive fingerprint |
| `sources/` | 5 | Full text | 旧唐书, 新唐书, 草堂集序, 新墓碑, 李翰林集序 |
| `works/` | 2 | ~1100 poems + chronology | Complete works + 7-period poetry chronology |
| `outputs/` | 8 | 7 reflections + 1 dialogue | 5 avatar periods × reflections + integrated dialogue |
| **Total** | **24+** | **~120K tokens** | Built over 3 sessions with 5 avatar spawns |

### Differences from Academic Pipeline Checklist

When adapting for ancient/historical figures, replace these checklist items:

| Academic Checklist Item | Ancient-Historical Replacement |
|------------------------|-------------------------------|
| "Every bib entry MUST be ADS-verified" | "Every source must be traceable to an original text" |
| "No fabricated papers" | "No fabricated poems/letters/works — verify against complete works" |
| "Voice from video transcripts" | "Voice from subject's own writings + contemporary descriptions" |
| "Method cards from papers" | "Method cards from creative/strategic patterns across works" |
| "Cross-validation via citekeys" | "Cross-validation via source index + work chronology" |
| "Token count measured by tiktoken" | Same — but expect higher counts due to original-language source texts |

---

## Appendix A: Avatar Management Patterns

### A.1 The Report-In Pattern

Shallow avatars, upon spawning, send a brief "reporting in" message. This is
informational only — do not reply. Replying wastes a turn and breaks the
parallel flow.

### A.2 Batch Overlap Strategy

Do NOT wait for Batch 1 to fully complete before spawning Batch 2. Avatars
have variable completion times (15-40 minutes). Optimal pattern:

```
T=0min:   Spawn Batch 1 (3 avatars)
T=5min:   Spawn Batch 2 (3 more avatars)
T=10min:  Begin quality-checking Batch 1 completions
T=20min:  Most of Batch 1 complete, collect files
T=30min:  Batch 2 complete, collect remaining files
```

**Key insight:** All 6 Velli avatars completed in ~25 minutes total because
they ran in parallel. Sequential would have taken 2+ hours.

### A.3 Quality Check Workflow

**Stage 1: Size Check (instant)**
```bash
wc -l .library/custom/<skill>/SKILL.md
```
- < 50 lines: incomplete
- 50-100: minimal but possibly acceptable
- 100-300: typical good range
- 300+: thorough (verify not padded)

**Stage 2: Structure Check (instant)**
```bash
grep '^## ' .library/custom/<skill>/SKILL.md
```
Verify headings map to the brief's requirements.

**Stage 3: Content Spot-Check**
Read opening + one substantive section. Check for specific citations,
correct facts, and a "How to Discuss" section.

### A.4 File Collection

```bash
cp -r /path/to/avatar/.library/custom/<skill>/ .library/custom/
```

### A.5 Timeout Handling

Before retrying a timed-out avatar:
1. Check: `ls -la .library/custom/<skill>/SKILL.md`
2. If exists and passes QA: avatar finished before reporting done
3. If not: re-dispatch with simplified brief

---

## Appendix B: Task Brief Template

```markdown
# Task Brief: <Skill Name>

## Research Direction Overview

<2-3 paragraphs describing the research area, why it matters, landscape>

Example:
"Alfvén waves are transverse magnetic oscillations discovered by Hannes
Alfvén in 1942. In the solar wind context, they form the backbone of
turbulence theories. Marco Velli has spent 30+ years building the theory..."

## Key Papers

| # | Title | Year | Citations | Role |
|---|-------|------|-----------|------|
| 1 | <Title> | <Year> | <Count> | <Role> |
| 2 | ... | | | |

<8-15 papers with real citation counts.>

## Core Theoretical Framework

<Key theories/models to cover in detail.>

## Required Knowledge Points

1. <Specific concept 1>
2. <Specific concept 2>
...
<Numbered — becomes the avatar's checklist.>

## Output Format

Write to: `.library/custom/<skill>/SKILL.md`

Structure:
```
---
name: <kebab-case>
description: <1-2 sentence>
version: 1.0
---

# <Title>

## 1. <First Section>
...
## N. How to Discuss <Topic> as <Subject>
## References
```

**Critical:** "How to Discuss" section is mandatory.

## Collaboration

When complete, notify the parent agent. Do NOT wait for acknowledgment.
```

### Brief Quality Checklist

- [ ] Research overview gives enough context (not just a sentence)
- [ ] Key papers list has 8+ entries with real citation counts
- [ ] Required knowledge points are specific (not "cover everything about X")
- [ ] Output format is explicit (YAML frontmatter + section structure)
- [ ] The brief is self-contained — avatar doesn't need your full memory

---

## Appendix C: Integration Review Template

```markdown
# Skill Integration Review Report

> Review date: <date>
> Review scope: <list all skills reviewed>

## I. Coverage Summary by Skill

### 1. <skill-name> (<Human-readable title>)
<1-2 sentences describing what this skill covers>

## II. Overlap Zones

### Overlap 1: <Topic> (<N> skills involved)

| Skill | Section | Focus |
|-------|---------|-------|
| <skill-a> | §X.Y | <angle> |

**Issue:** <problem>
**Resolution:** <which skill is authority, what to trim>

## III. Contradictions & Inconsistencies

### <Topic>
- **Skill A states:** "<claim>"
- **Skill B states:** "<different claim>"
- **Assessment:** <factual contradiction or perspective difference?>
- **Resolution:** <how to reconcile>

## IV. Boundary Recommendations

| Topic | Authority Skill | Other Skills' Role |
|-------|----------------|-------------------|

## V. Cross-Reference Suggestions

## VI. Knowledge Graph

## VII. Priority Actions
- [HIGH] <action 1>
- [MED] <action 2>
- [LOW] <action 3>
```

---

## Appendix D: Cross-Validation Reference

### Seven Types of Overlap

| # | Overlap Type | Example from Velli |
|---|-------------|-------------------|
| 1 | **Topic Overlap** | Switchbacks in 4/5 skills |
| 2 | **Observation Validation** | Kasper et al. 2021 in 3 skills |
| 3 | **Concept Mention** | Alfvén critical surface in 3 skills |
| 4 | **Paper Cross-Reference** | Verdini & Velli 2007 in 2 skills |
| 5 | **Role Description** | Velli's PSP role in 3 skills |
| 6 | **Mechanism Description** | Coronal heating in all 5 skills |
| 7 | **Narrative Overlap** | First Alfvén surface crossing |

### Boundary Management Principle

**Core rule:** Each topic has ONE authoritative source skill.

When a topic appears in multiple skills:
1. Designate the authority (where it's central, not tangential)
2. In non-authority skills: **2-3 sentence summary + cross-reference**
3. Cross-reference format: `For detailed analysis, see → **<skill>** §<section>`

---

## Appendix E: BibTeX Pruning

### Step 1: Extract Used Citekeys
```bash
grep -rhoP '(?<=\*\*Citekeys\*\*:)[^\n]*' arguments/**/*.md | \
  tr ',' '\n' | sed 's/^ *//' | sort -u > /tmp/used.txt
```

### Step 2: Extract All Bib Entries
```bash
grep '^\s*@' *.bib | grep -ohP '(?<={)[^,]*' | sort -u > /tmp/all.txt
```

### Step 3: Find Orphans and Unreferenced
```bash
comm -23 /tmp/used.txt /tmp/all.txt   # Citekeys not in bib
comm -13 /tmp/used.txt /tmp/all.txt   # Bib entries not cited
```

### Step 4: Produce Minimal Bib
Filter the bib file to only entries whose key appears in `/tmp/used.txt`.
Save full bib as `<subject>-bib-full.bib` for future use.

---

## Close-out Checklist

**Last section before declaring the persona complete.** Every item must be
checkable by a command (grep, wc, ls) or explicit inspection.

### 1. Structural Completeness

- [ ] Top-level `SKILL.md` exists with navigation and loading table
- [ ] `profile/` directory has 4 files: biography, voice, values,
      relationships (+ index SKILL.md)
- [ ] `arguments/SKILL.md` exists with search guide
- [ ] Arguments organized into domain directories (physics/,
      methodology/, culture/, pedagogy/)
- [ ] `methods/SKILL.md` exists with 10 method cards
- [ ] Subject's `.bib` file exists

### 2. VA Argument Completeness

- [ ] Every argument follows the 7-field VA schema
- [ ] Every VA has a unique ID (VA001, VA002, ...)
- [ ] Every VA has at least one citekey
- [ ] Every VA has `Context` and `Cross-refs` fields
- [ ] Total VA count verified: `grep -c '\*\*Claim ID\*\*' arguments/**/*.md`
- [ ] No VA has a placeholder citekey

### 3. Method Card Completeness

- [ ] 10 method cards exist (VM001–VM010)
- [ ] Each card has all 6 required sections (When, Procedure, Why,
      Observed, Failure, Transfer)
- [ ] Each card cites ≥3 VA instances
- [ ] Cards are induced from evidence, not from generic lists
- [ ] Verify: `grep -c 'Observed in' methods/SKILL.md` ≥ 10

### 4. Citation Integrity

- [ ] All citekeys in VA arguments exist in `.bib` file
- [ ] Run citekey verification script (see Appendix E)
- [ ] No orphan citekeys: `comm -23 /tmp/used.txt /tmp/all.txt` → empty
- [ ] All `[unverified]` tags are intentional and tracked
- [ ] "No fabricated anecdotes" footer in every profile file

### 5. Bib Pruning

- [ ] Shipped bib contains only actually referenced entries
- [ ] Unreferenced entries in separate `<subject>-bib-full.bib`
- [ ] Unreferenced count documented

### 6. Metadata Accuracy

- [ ] SKILL.md version matches the file content
- [ ] File count in SKILL.md matches actual: `find . -type f -name '*.md' | wc -l`
- [ ] Token estimate is measured, not guessed:
      ```
      find . -type f \( -name '*.md' -o -name '*.bib' \) | xargs wc -c | tail -1
      ```
- [ ] Loading table is current (no stale layer references)

### 7. Anti-Pattern Guard

- [ ] No metadata rot (all numbers verified by command)
- [ ] No token count inflation (numbers are measured, not guessed)
- [ ] No citation discipline failure (validator pass done, results clean)
- [ ] No bib bloat (minimal bib produced, full bib archived)
- [ ] No three-copy drift (single SKILL.md is canonical)
- [ ] No "dispatched = done" (all files verified by `ls` and `wc`)
- [ ] No premature export (pipeline: content → QA → metadata → export)

### 8. Final Verification Commands

Run and capture output:

```bash
# File tree
find . -type f | sort

# Total file count
find . -type f | wc -l

# Token estimate (bytes/4)
find . -type f \( -name '*.md' -o -name '*.bib' \) -exec wc -c {} + | tail -1

# VA count
grep -r '\*\*Claim ID\*\*' arguments/ | wc -l

# Method card count
grep -c '^## VM' methods/SKILL.md

# Bib entry count
grep -c '^\s*@' *.bib

# Used vs total citekey counts
wc -l /tmp/used.txt /tmp/all.txt
```
