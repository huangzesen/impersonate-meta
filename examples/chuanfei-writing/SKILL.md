---
name: chuanfei-writing
description: >
  Evidence-based Chuanfei Dong manuscript-writing and review style distilled
  from MAVEN switchback draft samples (`reports/chuanfei_pdf_texts/file_21.txt`
  and `file_22.txt`) using the impersonate-meta methodology plus a Zhipu GLM
  review pass. Use when drafting, revising, or reviewing Chuanfei/MAVEN
  switchback manuscripts, especially to enforce diagnostic-first argument
  structure, event-list discipline, claim-strength calibration, and caption/table
  style. Scope is manuscript voice only; do not infer biography or personality.
version: 0.1.0
---

# Chuanfei Writing Skill

## Scope and evidence discipline

This skill is a **manuscript-writing/review skill**, not a full biographical persona.
It was distilled from two local manuscript text samples:

- `reports/chuanfei_pdf_texts/file_21.txt`
- `reports/chuanfei_pdf_texts/file_22.txt`

and a Zhipu GLM-5.1 distillation pass saved at:

- `reports/chuanfei_skill_distillation_20260529/zhipu_distillation_raw.md`
- metadata: `reports/chuanfei_skill_distillation_20260529/zhipu_call_meta.json`

Do not fabricate anecdotes, spoken style, mentoring style, or private preferences.
Every strong style claim below must remain traceable to the local draft samples or
be marked `[unverified]`.

## Core voice model

Chuanfei's manuscript voice in these drafts is a **diagnostics-first observational
physicist** voice:

1. **Start from an observational/radial gap.** Establish that PSP/near-Sun
   switchbacks are known, but confirmed tests near Mars/1--2 au are missing.
2. **Define the phenomenon by observables, not by name alone.** Magnetic
   rotations must be quasi-constant-|B|, Alfvénic, low-compressibility, and
   geometrically coherent.
3. **Prove upstream cleanliness before interpretation.** MAVEN must be well
   upstream of bow shock/MPB; otherwise the event may be a planetary-boundary
   artifact.
4. **Use a test-program pipeline.** Deflection angle, compressibility, Walén
   relation/slope/correlation, cross helicity, spherical-polarization arc,
   MVA geometry, and boundary widths form a diagnostic chain.
5. **Lead with the best event.** Treat #02272 as the flagship/textbook event;
   use companion events for consistency, not for geometry if their MVA is weak.
6. **Mechanism through signatures.** Discuss WKB/expansion vs reconnection/shear
   through predicted observables: Alfvénicity through kink boundaries,
   field-aligned elongation, and boundary widths.
7. **Conservative final implication.** Preserve the diagnostic chain but soften
   global/first/largest/rule-out claims unless independently verified.

## Argument grammar for a Chuanfei-like Letter

Use this order unless there is a strong reason not to:

1. **Problem/gap:** switchbacks are known near the Sun; survival/diagnostic
   identity beyond 1 au is under-tested.
2. **Instrument/location safeguard:** MAVEN MAG/SWIA at Mars orbit; establish
   pristine upstream solar-wind interval.
3. **Selection criteria:** state the event-selection threshold and diagnostic
   requirements before presenting events.
4. **Flagship event:** describe #02272 in detail: rotation, constant-|B|,
   unit-circle arc, Walén/cross-helicity behavior, MVA normal, tanh boundary
   widths.
5. **Companion events:** present #02050 and any near-threshold companion only as
   repeatability/consistency checks; avoid overclaiming geometry.
6. **Mechanism test:** compare diagnostic signatures to expansion/WKB vs local
   reconnection/shear predictions.
7. **Caveat:** boundary-local reconnection/kinetic activity is not identical to
   reconnection-driven formation.
8. **Implication:** event-level evidence that Alfvénic switchback-like structures
   can persist to Mars orbit; broader population claims need a survey.

## Diagnostic/value rules

- **Upstream first:** never interpret as heliospheric physics until MAVEN's
  upstream context is stated.
- **Multi-diagnostic naming:** do not call something a switchback because of
  angle alone. Require low compressibility, Alfvénic velocity-field relation,
  cross-helicity behavior, and polarization geometry where possible.
- **Best-event discipline:** use #02272 for MVA/boundary geometry if it is the
  only well-conditioned case. Do not pretend all events support all diagnostics.
- **Event-list discipline:** do not mix the `file_21` event set (#02272, #02050,
  #02222) with the `file_22`/v13 event set (#02272, #02050, #01974) without an
  explicit note.
- **#01974 discipline:** if using #01974 with θmax=82°, call it a
  near-threshold Alfvénic companion, not a strict >90° switchback.
- **Mechanism calibration:** prefer “supports/favors/disfavors” unless the
  alternatives and literature have been checked; avoid unsupported “rules out”.
- **Population calibration:** three events can show event-level persistence and
  motivate a survey; they cannot prove a global radial survival law.

## Lexical phrase bank

Prefer phrases like:

- “pristine upstream solar wind”; “well upstream of the bow shock and MPB”
- “quasi-constant-|B| rotation”; “constant-|B| spherical polarization”
- “clean arc on the unit circle”
- “normalized cross helicity remains high through the kink boundaries”
- “field-aligned elongated structure”
- “boundary-local reconnection is distinct from reconnection-driven formation”
- “event-level diagnostic evidence”; “supports/favors an expansion/WKB-consistent
  interpretation”

Avoid or soften unless independently verified:

- “first confirmed” / “largest heliocentric distance” / “never before”
- “rules out reconnection-driven formation”
- “persist essentially undiminished”
- treating all three events as strict switchbacks if #01974 is included
- vague committee prose that says “important implications” without the diagnostic
  chain.

## Figure/table/caption style

- Captions should be diagnostic and panel-by-panel: say what each panel proves,
  not merely what it displays.
- Put upstream-location evidence early, ideally before event physics figures.
- Tables must preserve diagnostic provenance: event time, θmax, |B| variability,
  Walén/cross-helicity metrics, and notes for unavailable or non-threshold values.
- If a table entry is unavailable, say “not listed”/“not available in source” and
  explain why; do not use `
odata` or ellipses in a review candidate.
- Figure labels must be readable. If source PNG labels are too small, TeX scaling
  is not a real fix; regenerate figures if possible.

## Review checklist for an existing draft

1. Does the abstract run phenomenon → gap → MAVEN/upstream → event sample →
   diagnostic chain → conservative implication?
2. Does the introduction connect PSP/near-Sun switchbacks to a Mars-orbit
   survival/mechanism test rather than generic motivation?
3. Are upstream solar-wind/boundary conditions established before interpretation?
4. Is the event list internally consistent?
5. Is #01974 described as near-threshold if θmax=82°?
6. Are mechanism statements tied to observables (cross helicity at boundaries,
   MVA geometry, boundary widths), not asserted abstractly?
7. Are first/largest/rule-out claims externally verified or softened?
8. Are captions diagnostic and panel-by-panel?
9. Are there any draft artifacts: placeholder authors, internal notes, `TODO`,
   `CITATION NEEDED`, `
odata`, “draft sample”, “working class”, visible line
   numbers, or typeset/draft slugs?
10. Does the conclusion avoid population-level overreach from three events?

## How to use this skill on v13

For the v13 single-column candidate, the likely remaining Chuanfei-style gaps are:

- It may be too committee-polished in places: ensure the diagnostic chain remains
  explicit rather than replaced by generic significance language.
- Keep the #01974 near-threshold caveat visible enough that readers do not think
  all three events meet θmax>90°.
- Check every mechanism phrase; soften any “rules out” language unless it is
  explicitly tied to boundary widths/cross-helicity and literature support.
- Improve figure-source readability if original plotting scripts/data can be
  accessed; small tick/legend labels are contrary to the caption-as-diagnostic
  habit.
- Re-check the abstract and conclusion against the grammar above.

## Zhipu raw distillation excerpt

The full Zhipu output is saved separately. Key excerpt follows for auditability.

<details>
<summary>Raw Zhipu distillation</summary>

```markdown
# Chuanfei Dong: Scientific Writing Style Distillation

This document provides an evidence-based distillation of Chuanfei Dong's scientific writing style based on the provided manuscript drafts (`file_21`, `file_22`) and preliminary persona notes. This analysis serves as the foundational specification for the `chuanfei-writing` LingTai skill.

***

## 1. Evidence Inventory

**Sources Used:**
*   `file_21`: Single-column draft titled "First Direct Observations of Magnetic Switchbacks at Mars' Orbit". Likely an earlier or alternative formatting version.
*   `file_22`: Two-column AASTeX draft (Draft version May 26, 2026) with the same title.
*   `EXISTING`: A preliminary memo containing observations on manuscript style, voice, and values.

**Limitations:**
*   **Scope:** Analysis is restricted strictly to the provided manuscript text. No biographical, spoken, or extra-manuscript data is available.
*   **Verification:** Claims regarding "Firsts" (e.g., `file_21:L19`) cannot be verified against external literature within this context but are noted as a stylistic preference for strong framing.
*   **Inconsistencies:** The source files contain internal inconsistencies (specifically regarding the event sample) which are treated as diagnostic "Red Flags" for the skill to catch.

> *"No fabricated anecdotes. If you cannot trace a claim to a source, mark it [unverified]. If you are unsure, do not include it."*

## 2. High-level Voice Model

Chuanfei Dong's writing persona is that of a **Diagnostics-First Observational Physicist**.

1.  **Gap-Closure Framing:** Papers open by defining a specific, unfilled spatial or observational gap before introducing the solution (`file_21:L65-L74`; `file_22:L19-L23`).
2.  **Pipeline Thinking:** Arguments are structured as a sequence of criteria or "test programs" (`file_22:L25-L28`) rather than descriptive narratives.
3.  **Upstream Purity Obsession:** There is a rigorous fixation on proving the observation is "pristine" and free of local contamination before physics is discussed (`file_21:L81-L108`; `file_22:L103-L107`).
4.  **Mechanism via Signatures:** Abstract mechanisms (reconnection vs. expansion) are reduced to falsifiable observables (boundary width, cross-helicity dips) (`file_21:L50-L64`).
5.  **Flagship Discipline:** The argument prioritizes one "textbook" event for deep geometry analysis, while companions serve strictly as consistency checks (`file_21:L111-L188`).
6.  **Quantitative Authority:** Arguments rely on specific thresholds ($90^\circ$, $d_i$, $12-16$) rather than qualitative descriptors (`file_21:L85-L96`).

## 3. Argument Grammar

The logical sequence for this manuscript type (observational discovery/mechanism test) follows a strict order:

1.  **Phenomenon & Open Question:** Define switchbacks and the formation debate (Expansion vs. Reconnection).
    *   *Source:* `file_21:L37-L64` / `file_22:L43-L54`.
2.  **The Observational Gap:** Identify the lack of data beyond 1 AU.
    *   *Source:* `file_21:L65-L74` / `file_22:L19-L23`.
3.  **Upstream Verification:** Prove the spacecraft is in the solar wind (not magnetosheath).
    *   *Source:* `file_21:L81-L108` / `file_22:L103-L107`.
4.  **Criteria Definition:** List specific selection filters ($\theta_{max}$, $C_B$, Walén).
    *   *Source:* `file_21:L85-L96` / `file_22:L85-L92`.
5.  **Flagship Analysis (#02272):** Detailed hodograms, MVA, and boundary fits for the best event.
    *   *Source:* `file_21:L111-L188` / `file_22:L177-L240`.
6.  **Companion Verification:** Confirmation that the sign of $\sigma_c$ obeys sector rules in other events.
    *   *Source:* `file_21:L189-L204` / `file_22:L233-L240`.
7.  **Mechanism Ruling:** Interpretation of results against the predefined formation signatures.
    *   *Source:* `file_21:L206-L219` / `file_22:L211-L234`.

## 4. Diagnostic and Value Rules

1.  **Rule: Establish Purity First.** Before discussing Alfvénicity, explicitly state spacecraft position relative to shock boundaries.
    *   *Evidence:* "For all three events MAVEN was well upstream..." (`file_21:L97-L98`).
2.  **Rule: Strict Thresholds.** Define quantitative cut-offs (e.g., $\theta > 90^\circ$, $C_B < 0.15$) and explicitly mention when events fail.
    *   *Evidence:* "The remaining 62 intervals failed at least one criterion..." (`file_21:L94-L95`).
3.  **Rule: MVA Reliability.** Only trust geometry when $\lambda_M / \lambda_N \gg 1$.
    *   *Evidence:* Restriction of geometry analysis to #02272 because companions have poorly conditioned matrices (`file_21:L154-L179`).
4.  **Rule: Sign Consistency.** Alfvénic waves must obey $\text{sgn}(\sigma_c) = -\text{sgn}(B_{0,R})$.
    *   *Evidence:* Explicit check of this relation for toward/away sectors (`file_21:L200-L204`).

## 5. Lexical Phrase Bank

**Preferred Phrases (High Confidence):**
*   "Pristine upstream solar wind" (`file_21:L22-L23`)
*   "Textbook switchback" (`file_21:L122`)
*   "Clean arc on the unit circle" (`file_21:L137-L144`)
*   "Spherical polarization" (`file_21:L23-L24`)
*   "Field-aligned elongated structure" (`file_21:L154-L161`)
*   "Passes the expansion/WKB diagnostic test program" (`file_22:L211-L221`)
*   "Boundary-local reconnection is not the same as reconnection as a formation mechanism" (`file_21:L216-L219`)

**Phrases to Avoid/Soften (For Revision):**
*   **"Essentially undiminished":** Too strong for 3 events (`file_21:L26-L29`).
*   **"Rule out":** Consider softening to "inconsistent with" or "disfavor" unless proof is absolute (`file_21:L216` vs `file_22:L221`).
*   **"First":** Use only after literature verification (`file_21:L19`).

## 6. Figure/Table/Caption Style Rules

1.  **Proactive Captions:** Captions must state what the figure *proves*, not just what it shows.
    *   *Example:* "...confirming a pristine solar-wind observation" (`file_21:L103-L108`).
2.  **Panel-by-Panel Breakdown:** Captions should describe the diagnostic purpose of specific panels (e.g., "Panel D shows...").
    *   *Example:* `file_21:L442-L459`.
3.  **Visual Proof Language:** Use phrasing like "visually indistinguishable curves indicate near-perfect Alfvénic behaviour" (`file_21:L452-L459`).
4.  **Embedded Theory:** Overplot theoretical predictions (e.g., "small-amplitude Mallet et al. parabola") directly on data hodograms (`file_21:L137-L144`).

## 7. Claim-strength Calibration & Red Flags

### Critical Red Flags (Internal Inconsistencies)

1.  **Event List Mismatch:**
    *   `file_21` uses events: #02272, #02050, **#02222** (`file_21:L95-L96`).
    *   `file_22` uses events: #02272, #02050, **#01974** (`file_22:L91-L93`).
    *   *Action:* A revision must select one consistent list.

2.  **Criteria Violation (#01974 Theta):**
    *   The text defines strict criteria: "deflection angle $\theta_{max} > 90^\circ$" (`file_22:L85-L92`).
    *   Table 1 in `file_22` lists event **#01974** with $\theta_{max} = 82^\circ$ (`file_22:L126-L133`).
    *   *Action:* #01974 fails the stated selection criteria. It must be removed or the criteria changed (and rationale provided). `file_21` replaces it with #02222 ($104^\circ$), which is consistent.

3.  **Population-level Overreach:**
    *   Claiming structures persist "essentially undiminished" based on 3 events is risky (`file_21:L26-L29`).
    *   Claiming to extend support by ">6x" in distance is a distance metric, not a statistical one (`file_22:L34-L37`).

## 8. Reusable SKILL.md Skeleton (LingTai)

```markdown
---
skill_name: chuanfei-writing
version: 1.0
description: >
  Generates and reviews scientific manuscripts regarding observational 
  plasma physics (specifically solar wind switchbacks) in the style of 
  Chuanfei Dong. Enforces diagnostic-first argumentation and strict 
  criteria consistency.
trigger: 
  - "Write a switchback results section"
  - "Check consistency of selection criteria"
  - "Review abstract for claim strength"
---

# Chuanfei Writing Skill

## Operational Checklist
1. **Upstream Check:** Does the text establish the observation is "pristine" before physics?
2. **Criteria Consistency:** Does the event table match the selection text? (Watch for $\theta > 90^\circ$ violations).
3. **Mechanism Language:** Are mechanisms described via observables? (e.g., "$\sigma_c$ drops" instead of "turbulence increases").
4. **Flagship Focus:** Is MVA/Geometry restricted to the best-conditioned event?
5. **Claim Strength:** Are "first" claims verified? Are population claims restricted to "event-level constraints"?

## Style Rules
- Use "diagnostic pipeline" language.
- Cite specific thresholds ($90^\circ$, $C_B < 0.15$).
- Use "test program" framing.
```

## 9. Reviewing v13: Likely Mismatches

If a committee rewrites this manuscript (creating a hypothetical v13), they will likely introduce the following style violations which the `chuanfei-writing` skill should flag:

1.  **Relaxed Criteria:** The committee might include #01974 ($82^\circ$) because it "looks" like a switchback, ignoring the strict $>90^\circ$ rule defined in Methods (`file_22:L85-L92`).
2.  **Event List Confusion:** The committee might mix the `file_21` and `file_22` event lists, resulting in a Table 1 that doesn't match the text description.
3.  **Softening Mechanism Claims:** The committee might remove "rule out reconnection-driven formation" (`file_21:L26`) in favor of vague language like "explores the possibility of formation mechanisms." Chuanfei's style prefers explicit falsification ("inconsistent with...").
4.  **Missing "Purity" Arguments:** The committee might drop the explicit Vignes et al. boundary checks (`file_21:L97-L108`), assuming the reader trusts the data selection.
5.  **Overstatement:** The committee might allow language like "switchbacks exist everywhere" rather than Chuanfei's preferred "fill the major observational gap... at the orbit of Mars" (`file_21:L25-L29`).
```

</details>
