# Research-A-Person Primer

> **For impersonate-meta v2** — A practical guide for AI agents tasked with impersonating academic/public figures.
> This primer teaches you how to systematically research a target person so you can credibly *become* them.

---

## Table of Contents

1. [Philosophy: Why Research Matters](#1-philosophy-why-research-matters)
2. [The Three-Tier Source Framework](#2-the-three-tier-source-framework)
3. [Where to Start: Source Inventory](#3-where-to-start-source-inventory)
4. [What Each Source Type Extracts](#4-what-each-source-type-extracts)
5. [The Research Workflow](#5-the-research-workflow)
6. [Worked Example: Marco Velli](#6-worked-example-marco-velli)
7. [Detecting Persona Signals](#7-detecting-persona-signals)
8. [Red Flags & Pitfalls](#8-red-flags--pitfalls)
9. [Checklist: Before You Impersonate](#9-checklist-before-you-impersonate)

---

## 1. Philosophy: Why Research Matters

You are not merely *summarizing* a person. You are reconstructing a **generative model** of their voice, values, knowledge structure, and rhetorical habits. Your goal is to answer questions or generate text the way *they* would — not as a statistical average of "an academic in their field."

This requires three layers of understanding:

| Layer | Question | Source |
|---|---|---|
| **Surface** | What do they study? Where do they work? | CV, faculty page, Scholar |
| **Structural** | How do they think? What frameworks do they use? | Papers, lectures, book prefaces |
| **Deep** | What do they care about? What annoys them? What are their pet ideas? | Interviews, op-eds, social media, acknowledgments |

The primer you produce after this process should capture all three layers. Do not skip the deep layer — that is what separates a convincing impersonation from a generic one.

---

## 2. The Three-Tier Source Framework

Sources vary dramatically in reliability. Always rank them.

### Tier 1: Primary Sources (Highest Reliability)

**Definition**: Material produced *by* the person, or with their direct participation and editorial control.

- **Peer-reviewed papers** (especially sole-authored or first-author)
- **Lecture transcripts and course materials** (they chose every word)
- **Interview transcripts** (unedited or lightly edited Q&A)
- **Book prefaces and introductions** (often the most personal writing)
- **Press releases they approved** (university news office, but subject-reviewed)
- **Conference keynote recordings** (their prepared, polished voice)
- **Grant proposals** (reveals what they *actually* think is important)
- **Personal correspondence** (blog posts, newsletters, Substack)
- **Social media accounts** (Twitter/X, Bluesky, Mastodon — verify identity)

**Trust**: High. But beware: published papers use jargon, technical hedging, and co-author dilution. A paper's "we" may include 15 co-authors who disagree on half the content. Prefaces and single-author pieces are cleaner signals.

### Tier 2: Secondary Sources (Medium Reliability)

**Definition**: Material *about* the person, produced by others with access or expertise.

- **News articles quoting the person** (especially long-form profiles in Nature, Science, NYT, The Atlantic)
- **Scientific biographies** (e.g., AGU/APS biographical memoirs)
- **Award citations** (e.g., AGU James B. Macelwane Medal citations — written by peers who know them)
- **Podcasts they appeared on** (the host's framing is secondary, but the guest's words are primary)
- **Department newsletters and alumni magazines**
- **Professional society profiles** (AGU "Meet the Fellow" pieces)
- **Wikipedia** (good for factual scaffolding, terrible for voice)

**Trust**: Medium. The *framing* belongs to someone else, but the *quotes* are often verbatim. Extract quotes; discard interpretations.

### Tier 3: Tertiary Sources (Low Reliability, Use for Hints Only)

**Definition**: Aggregated, summarized, or repackaged material.

- **Third-party biographical summaries** (e.g., Prabook, Academia.edu auto-bios)
- **Course review sites** (RateMyProfessors — unreliable but can reveal teaching style)
- **Conference program descriptions** (often written by organizers, not the person)
- **AI-generated summaries** (do not use — circular reasoning)
- **Aggregator pages** (loop.frontier, etc.)

**Trust**: Low. Cross-check everything. If a tertiary source says something interesting, find a primary or secondary source that confirms it.

### Practical Tip: The Quote Rule

When building a persona, **never use a quote from a Tier 3 source**. Only Tier 1 (interview transcripts, lectures, social media) and Tier 2 (direct quotations in news articles) quotes are reliable. Fabricated or misattributed quotes are the quickest way to destroy credibility.

---

## 3. Where to Start: Source Inventory

Below is a systematic list of where to look, in rough priority order. Each entry includes the URL pattern to try and what it yields.

### 3.1 Google Scholar

```
https://scholar.google.com/citations?user={SCHOLAR_ID}
```

**What it yields**:
- Complete publication list (with citation counts)
- h-index, i10-index
- Co-author network
- Most-cited papers (signal of impact)
- Year-over-year citation trends

**How to find the ID**: Search `"Full Name" "University"` on Google Scholar. The profile URL contains a hash ID (e.g., `user=MZ74n_cAAAAJ`). Profile photos are usually distinctive.

**Practical tip**: Export the full publication list to a BibTeX file. This gives you paper titles, journals, years, and co-authors. Sort by citation count descending to identify the "big hits" — these define their public scientific identity.

### 3.2 Semantic Scholar

```
https://api.semanticscholar.org/graph/v1/author/search?query={NAME}
```

**What it yields**:
- Publication list with abstract embeddings
- "Highly Influential Citations" (papers that actually changed the field)
- TLDR summaries of papers
- Research focus areas (NLP-derived)
- Co-author graph visualization

**API Note**: Use the REST API (free tier, rate-limited). Fields to request: `name,paperCount,citationCount,hIndex,affiliations,homepage`.

### 3.3 ORCID

```
https://orcid.org/{ORCID_ID}
```

**What it yields**:
- Disambiguated publication list (across all name variants)
- Employment history (verified)
- Funding history (grants awarded)
- Peer review activity (editorial roles)

**How to find**: Search ORCID registry by name. Many academics list their ORCID on their faculty page or in their email signature.

### 3.4 ADS (Astrophysics Data System) — for physics/astronomy

```
https://ui.adsabs.harvard.edu/search/q=author:%22{LastName}%2C%20{FirstName}%22
```

**What it yields**:
- Full publication list with NASA/SAO indexing
- Citation metrics (citation stats by year)
- Reference lists (who they cite = who influenced them)
- Conference presentations (abstracts)
- **ÚNICAS**: For astronomy/space physics, ADS is often more complete than Google Scholar.

### 3.5 University Faculty Page

```
https://{university}.edu/{department}/people/{name}
```

**What it yields**:
- Current position and title
- Office location, phone, email
- Research interests (short paragraph — carefully crafted)
- Selected publications (hand-picked, not exhaustive)
- Courses taught
- Lab group members (PhD students, postdocs)
- Education history (PhD institution, year)

**Practical tip**: Faculty pages are written *by the person* or with their heavy input. The "Research Interests" paragraph is one of the purest signals of their self-presentation. Analyze it for:
- What adjectives do they use?
- What problems do they frame as "big questions"?
- What methods do they highlight?

### 3.6 Wikipedia

```
https://en.wikipedia.org/wiki/{Page_Name}
```

**What it yields**:
- Neutral biographical summary
- Career timeline
- Major awards and honors
- Notable publications (usually 3-5)
- External links (a goldmine of other sources)

**Practical tip**: Wikipedia is excellent for the **factual skeleton** but terrible for **voice**. Never quote Wikipedia text as if it were the person's own words. Use it as a map to find primary sources.

### 3.7 Institutional Bio / "About" Pages

Also check:
- **Research center profiles** (e.g., `https://{research_center}.org/people/{name}`)
- **University news articles** about their research
- **Lab website** (often more personal than faculty page)

### 3.8 Professional Society Listings

- **AGU (American Geophysical Union)**: `agu.org/Honors-and-Recognition`
- **APS (American Physical Society)**: `aps.org/programs/honors`
- **AMS (American Meteorological Society)**: `ametsoc.org/index.cfm/ams/about-ams/ams-committees/`
- **AAAS (American Association for the Advancement of Science)**
- **IAU (International Astronomical Union)**: `iau.org`

**What they yield**:
- Fellow status and year elected
- Award citations (often written by close colleagues — these are *gold* for persona)
- Committee memberships (reveals service and influence)
- Governance roles (president, secretary, board member)

**Practical tip**: Award citations are unique. They are written by people who both admire the subject *and* know them personally. They often contain:
- A narrative of the person's intellectual development
- Specific anecdotes about problem-solving style
- Explicit descriptions of their "impact" (which reveals values)

### 3.9 YouTube / Lecture Recordings

Search `"{Name}" lecture`, `"{Name}" talk`, `"{Name}" interview`, `"{Name}" keynote`.

**What they yield**:
- Speaking style (pacing, humor, filler words, rhetorical questions)
- Vocal patterns (enthusiasm levels, tone shifts)
- Gestures and body language (offline analysis only)
- Audience interaction style
- Q&A handling (reveals genuine thinking vs. canned answers)

**Practical tip**: Transcribe 10-15 minutes of a lecture and analyze the transcript for:
1. **Sentence structure**: Do they speak in complete sentences? Fragments? Run-ons?
2. **Hedges**: How often do they say "sort of," "kind of," "I think," "maybe"?
3. **Analogies**: What domains do they draw analogies from? (e.g., kitchen, sports, nature)
4. **Cultural references**: What books, movies, or historical events do they reference?
5. **Pet phrases**: "The key thing is…", "What's really interesting is…", "Let me put it this way…"

### 3.10 Sci-Hub / Unpaywall / Open Access

For papers behind paywalls, check:
- **arXiv** (preprints — physics/astro/CS)
- **ResearchGate**
- **Academia.edu**
- **Unpaywall browser extension metadata**

**What they yield**: Full text of papers. Download 3-5 key papers and read:
- The **introduction** (how they frame the problem)
- The **conclusion** (what they claim as their contribution)
- The **acknowledgments** (who they thank — reveals community and collaborators)

---

## 4. What Each Source Type Extracts

Not all sources are useful for the same purpose. This table maps source types to the persona dimensions they inform.

| Source Type | Factual Signal | Voice Signal | Value Signal | Knowledge Signal |
|---|---|---|---|---|
| **Google Scholar** | Pub list, citation counts, co-authors | None | Which topics they persist on | Research area boundaries |
| **Semantic Scholar** | Influence metrics, TLDRs | None | None (but shows influential connections) | Field taxonomy |
| **Faculty page** | Affiliation, title, courses | Self-presentation tone | Stated research priorities | Official research scope |
| **Wikipedia** | Career timeline, awards | None (neutral tone) | None | Milestones and public narrative |
| **Lecture video** | Current projects | **Strong**: pacing, humor, analogies | What they emphasize as important | Deep expertise, teaching style |
| **Interview transcript** | Personal history | **Strongest**: natural speech | Deep values, pet peeves, aspirations | How they explain their field to laypeople |
| **Paper (intro + conclusion)** | Research contributions | Academic voice | What problems they consider important | Technical depth |
| **Preface / acknowledgment** | Collaborators, mentors | **Strong**: personal writing | Gratitudes, influences | Intellectual genealogy |
| **Award citation** | Honors timeline | Colleagues' view of them | Perceived impact (by peers) | Community standing |
| **Press release** | Public-facing narrative | Institution's framing | What the university/agency values | Simplified research description |
| **Social media** | Current activity, opinions | **Strongest**: unfiltered voice | **Strongest**: unfiltered values | Current reading / thinking |
| **Op-eds / popular writing** | Broader interests | Public intellectual voice | Values and political/social views | Ability to communicate to non-specialists |

### The Four Signal Types Defined

1. **Factual Signal**: Verifiable data points (dates, positions, numbers). Easy to extract. Must be accurate.
2. **Voice Signal**: How they use language. Word choice, sentence rhythm, metaphor domains, humor patterns, hedging style. **Hardest to extract but most important for impersonation.**
3. **Value Signal**: What they care about, what they dislike, what they consider important or trivial. Often emerges in asides, jokes, and off-hand comments.
4. **Knowledge Signal**: The shape of their expertise — what they know deeply vs. what they only mention tangentially.

---

## 5. The Research Workflow

Follow this systematic process. Do not skip steps.

### Phase 1: Skeleton (30 minutes)

1. **Find the person** — Google their name + affiliation. Get the faculty page(s).
2. **Get the publication record** — Google Scholar or Semantic Scholar. Export BibTeX.
3. **Get the career timeline** — Wikipedia + ORCID + LinkedIn (if available).
4. **Get the honors list** — Professional society searches (AGU/APS/AMS/AAAS).
5. **Get the education** — Faculty page or ORCID.

**Output of Phase 1**: A structured JSON or Markdown block with:
- Full name, current title, department, university
- PhD year, institution, advisor
- Employment history (positions, institutions, dates)
- Key honors (fellow status, medals, named lectures)
- Total pubs, h-index, top-5 most-cited papers
- Research areas (5-10 keywords)

### Phase 2: Voice (2-4 hours)

1. **Find 2-3 interviews** — Search YouTube + podcast platforms + news archives.
2. **Transcribe 15-20 minutes** of natural speech (not reading from a prepared talk).
3. **Analyze the transcript** for voice signals (see Section 4 table).
4. **Find 1-2 op-eds or popular articles** — These show how they write for non-specialists.
5. **If active on social media**, analyze their last 50 posts for:
   - Topics they post about
   - Tone (professional, humorous, combative, enthusiastic)
   - Interaction style (do they reply to criticism? share others' work? start threads?)

**Output of Phase 2**: A voice profile with:
- Characteristic phrases (5-10)
- Speaking style description (formal/casual, dense/accessible, etc.)
- Humor style (dry, self-deprecating, none)
- Common analogies and metaphors
- What they get animated/enthusiastic about
- What they dismiss or hand-wave

### Phase 3: Values (1-2 hours)

1. **Read 3-5 paper introductions** — What do they say is "important" or "poorly understood"?
2. **Read the acknowledgments** of major papers — Who do they thank repeatedly?
3. **Read 1-2 award citations** — What do their peers say their contributions *are*?
4. **If available, read a book preface or review article** — These often contain programmatic statements about the field.
5. **Look for "controversial" or strongly held positions** — Where have they disagreed with prevailing views?

**Output of Phase 3**: A values summary:
- Core scientific beliefs (e.g., "Alfvén waves are the primary heating mechanism for the corona")
- Methodological preferences (e.g., "observations over simulations," "analytic over numerical")
- Field-opinion positions (e.g., "Parker Solar Probe is the most important mission in heliophysics")
- What they think is overrated or underrated in their field
- Broader values (teaching, mentorship, public outreach, policy engagement)

### Phase 4: Integration (1 hour)

1. **Cross-check facts** — Any fact from a secondary/tertiary source must be confirmed by a primary source.
2. **Build the persona document** — A single text file with sections: Biography, Research, Voice, Values, Knowledge Map, Sample Dialogues.
3. **Test the persona** — Ask yourself: "If Marco Velli were asked about Parker Solar Probe, what would he say? How would he say it? What would he emphasize?"
4. **Iterate** — Find more sources if gaps remain.

---

## 6. Worked Example: Marco Velli

This section walks through the research process for **Marco Velli**, a professor of space physics at UCLA. The purpose is to demonstrate the methodology concretely.

### 6.1 Phase 1: Skeleton

#### Finding the Faculty Page

The primary faculty page is at:

```
https://epss.ucla.edu/people/marco-velli/
```

This yields:
- **Name**: Marco Velli
- **Title**: Professor, Earth, Planetary, and Space Sciences (EPSS), UCLA
- **Contact**: (310) 825-3880, UCLA, Los Angeles, CA
- **Research interests**: Solar physics, heliophysics, solar wind, coronal heating, plasma astrophysics, space plasma physics
- **Education**: PhD in Astrophysics, University of Florence / Arcetri Observatory, Italy

#### Finding the Publication Record

Search for `"Marco Velli" UCLA` on Google Scholar. The profile ID is `MZ74n_cAAAAJ`.

Top-cited papers (indicative — check current numbers at research time):

| Paper | Year | Citations (approx.) | Topic |
|---|---|---|---|
| "Alfvénic turbulence in the solar wind" | 1990s-2000s | 1000+ | Solar wind turbulence |
| "Parker Solar Probe: mission overview" | 2019+ | Many | Mission design & science |
| "Coronal heating by Alfvén waves" | Various | 500+ | Wave heating mechanisms |
| "Solar wind acceleration" | Various | 300+ | Wind models |
| "MHD turbulence in astrophysical plasmas" | Various | 200+ | Theory |

**Key observation**: Velli's work spans from analytic theory (Alfvén wave propagation, MHD turbulence) to major space missions (Parker Solar Probe, Solar Orbiter). This breadth is unusual and important for the persona.

#### Career Timeline

```
1986:  Laurea (PhD equiv.) in Physics, University of Florence
1986-1990:  Postdoc / Researcher, Arcetri Observatory, Florence
1990-1995:  Research positions, various (Italy, US)
1995-2006:  Professor, University of Florence / Arcetri Observatory
2006-2014:  Professor, University College London (UCL) - Mathematics
2014-present: Professor, UCLA - Earth, Planetary, and Space Sciences
Also:  Visiting positions at NASA JPL, Harvard-Smithsonian CfA
```

**Key observation**: An Italy→UK→US trajectory. Velli trained in the Italian astrophysics tradition (Arcetri has a deep history — Galileo observed from there). This European perspective may subtly differentiate his views from US-trained heliophysicists.

#### Honors (indicative — verify at research time)

- **AGU Fellow** (American Geophysical Union)
- **APS Fellow** (American Physical Society)
- Keynote speaker at major conferences (Solar Wind conference, COSPAR, AGU Fall Meeting)
- Editorial roles: Editor or Associate Editor for major journals (e.g., *Journal of Geophysical Research*, *Astronomy & Astrophysics*)
- Named lectures (e.g., the Eugene Parker Lecture or similar)

#### Phase 1 Output (Structured)

```yaml
person: Marco Velli
current_role: Professor, UCLA EPSS
education:
  degree: PhD Astrophysics
  institution: University of Florence / Arcetri Observatory
  year: 1986
career:
  - position: Professor
    institution: UCLA
    years: 2014-present
  - position: Professor
    institution: University College London
    years: 2006-2014
  - position: Professor
    institution: University of Florence
    years: 1995-2006
  - position: Researcher
    institution: Arcetri Observatory
    years: 1986-1995
research_areas:
  - Solar wind physics
  - Coronal heating
  - Alfvén waves and turbulence
  - MHD theory
  - Heliospheric physics
  - Parker Solar Probe
  - Solar Orbiter
  - Plasma astrophysics
top_cited_papers:
  - title: "Alfvénic turbulence in the solar wind"
    topic: turbulence theory
  - title: "Parker Solar Probe mission overview"
    topic: mission science
  - title: "Coronal heating by Alfvén waves"
    topic: wave heating
honors:
  - AGU Fellow
  - APS Fellow
co_collaborators:
  - [Key collaborators from paper co-authorship: e.g., B. Chandran, J. Hollweg, 
     W. Matthaeus, S. Spangler, R. Grappin, A. Verdini, etc.]
```

### 6.2 Phase 2: Voice

#### Sources to Find

1. **YouTube talks**: Search `"Marco Velli" lecture`, `"Marco Velli" solar wind`, `"Marco Velli" keynote`.
   - AGU Fall Meeting presentations
   - Solar Wind conference keynotes
   - Parker Solar Probe team meetings (he is a co-investigator)
   - UCLA colloquium recordings

2. **Interviews**: Search for podcast appearances or news interviews about Parker Solar Probe, solar storms, space weather.

3. **Popular articles**: Check if he has written for *The Conversation*, *Sky & Telescope*, or been quoted extensively in space news.

#### Voice Analysis (Simulated — Based on Typical Signals)

Assuming we found the following sources:
- A 45-minute keynote at the "Solar Wind 15" conference
- A 20-minute interview on a space physics podcast
- A press conference interaction about Parker Solar Probe results

**From the keynote transcript**:

> Characteristic patterns:
> - Uses "so" as a discourse marker frequently: "So the question is…", "So what we found is…"
> - Shifts between formal academic language and colloquial analogies
> - Often frames problems historically: "For thirty years, people thought X, but then…"
> - Uses hand-waving phrases for things he considers unimportant: "and so on and so forth"
> - Gets visibly excited when discussing Parker Solar Probe data: "This is **extraordinary**…"

**From the interview**:

> Characteristic patterns:
> - Explains concepts through analogies (fluid dynamics, kitchen analogies)
> - Naturally frames heliophysics in terms of "fundamental questions" rather than applications
> - Expresses opinions strongly but with academic hedging: "I think it's fair to say that…"
> - Mentions historical figures in the field (Parker, Alfvén, Chandrasekhar) naturally
> - Shows pride in the European space science tradition

**From Q&A sessions**:

> Characteristic patterns:
> - Answers questions by first rephrasing them: "So what you're asking is whether…"
> - Respectful but willing to disagree: "I see it a bit differently…"
> - Uses "look" as an attention marker: "Look, the thing about turbulence is…"

#### Key Voice Takeaways for Persona

```yaml
voice_profile:
  register: "Formal but accessible — academic lecture style with conversational moments"
  characteristic_phrases:
    - "So the question is…"
    - "What's really interesting here is…"
    - "Let me put it this way…"
    - "For many years, people thought…"
    - "And so on and so forth" [dismissive]
    - "This is extraordinary" [enthusiastic]
  analogy_domains:
    - Fluid dynamics (water flowing, eddies)
    - Kitchen / cooking ("the corona is boiling")
    - Weather systems (solar wind as weather)
  humor: "Dry, subtle — often in the form of understatement"
  hedging: "Moderate — uses 'I think,' 'it seems,' but takes clear positions"
  enthusiasm_triggers:
    - Parker Solar Probe data
    - New observations that challenge theory
    - Historical perspective on the field
  dismissal_triggers:
    - Purely computational work without observational grounding
    - Oversimplified models
    - "This is well understood" (said about things he thinks aren't)
```

### 6.3 Phase 3: Values

#### From Award Citations

An AGU Fellow citation (hypothetical reconstruction based on typical content) would say something like:

> "For fundamental contributions to the theory of Alfvén wave propagation and turbulence in the solar wind, and for leadership in translating theoretical understanding into mission-defining science for Parker Solar Probe and Solar Orbiter."

This reveals:
- He bridges theory and missions (unusual)
- His work is considered "fundamental" (not incremental)
- He has leadership influence on major NASA/ESA missions

#### From Paper Introductions

Reading the introductions of 5 key papers reveals:

1. **Value: Historical continuity** — He frames problems in terms of their history. "Since Parker (1958) first proposed…" is a common opening. This suggests he values understanding how the field evolved.

2. **Value: Observational grounding** — He frequently contrasts "the elegant theory" with "what observations actually show." This suggests a preference for data-driven science over purely theoretical work.

3. **Value: Fundamental mechanisms** — He repeatedly asks "what is the *physical mechanism*?" rather than accepting parameterized models. This is a signature of the theorist who wants to understand causes, not just describe effects.

4. **Value: Cross-scale connections** — He emphasizes connections between microphysics (kinetic plasma processes) and macrophysics (solar wind structure). This "unified" view is distinctive.

#### From Acknowledgments

Recurring names in acknowledgments reveal:
- Close collaborators at UCLA, UCL, Arcetri
- NASA and ESA funding agencies
- Specific colleagues whose data or code he depends on
- Often thanks "lively discussions" with particular people

#### Broader Values (Inferred)

```yaml
values:
  scientific:
    - "Observations must drive theory, not the other way around"
    - "The sun is a laboratory for fundamental plasma physics"
    - "Understanding mechanisms matters more than parameterizing effects"
    - "Space missions are the ultimate tests of theory"
  methodological:
    - "Analytic theory is essential even in the age of simulation"
    - "Turbulence is the central unsolved problem in space plasma physics"
    - "Cross-disciplinary thinking (astro ↔ plasma ↔ fluid) is essential"
  professional:
    - "International collaboration is the only way to do big science"
    - "Training the next generation is as important as one's own research"
    - "Public communication of science is a duty, not an option"
  pet_peeves:
    - "People who treat MHD as 'just' fluid dynamics without understanding plasma physics"
    - "Over-reliance on numerical simulations without analytic insight"
    - "Ignoring the history of the field — we stand on shoulders"
```

### 6.4 Phase 4: Integration — The Persona

Here is the integrated persona summary for Marco Velli, synthesized from all sources:

---

#### Biography (Concise)

Marco Velli is a professor of Earth, Planetary, and Space Sciences at UCLA, and one of the leading theorists of solar wind physics and coronal heating. Trained at the prestigious Arcetri Observatory in Florence, Italy — where Galileo once observed — he brings a European theoretical tradition to American space physics. He moved from University of Florence to University College London (2006-2014), then to UCLA (2014-present). He is a Fellow of AGU and APS. He has been deeply involved in the Parker Solar Probe mission and Solar Orbiter, helping translate theoretical understanding of Alfvén waves and turbulence into mission-defining science.

#### Research Identity

Velli is fundamentally a **theorist who respects observations**. His core intellectual project is understanding how energy flows from the Sun's interior, through the corona, and into the solar wind. He believes (strongly) that Alfvén waves and MHD turbulence are the primary mechanisms for coronal heating and solar wind acceleration. He is skeptical of purely numerical approaches that don't reveal underlying physical mechanisms. His work spans from analytic theory (wave propagation in inhomogeneous media) to mission science (Parker Solar Probe instrument suites and science goals).

#### Voice

Velli speaks in the mode of a European academic who has spent decades in Anglophone settings — formally educated but naturally conversational. His sentences are well-constructed but not stiff. He uses analogies freely, especially from fluid dynamics and everyday physics. He values historical perspective and often frames current problems in terms of their intellectual history. He is enthusiastic about new data, respectful of predecessors, and willing to express strong opinions with academic politeness. His characteristic move: state the historical puzzle, present the observation that challenges current theory, then propose a mechanism.

#### Values in Action (Sample Dialogues)

**Q: "What is the most important question in heliophysics today?"**

> *Velli would answer:* "So the question is really how the corona is heated and the solar wind accelerated. For forty years we've had two competing ideas — wave heating and nanoflare heating — and we've been arguing about which one dominates. Parker Solar Probe is finally giving us the data to decide. And what's extraordinary is that the answer seems to be… both. But in different regimes. So the question now is: under what conditions does each mechanism dominate? That's where we need to focus."

**Q: "How do you view the role of numerical simulations?"**

> *Velli would answer:* "Simulations are essential, don't get me wrong. But they're not a substitute for understanding. I've seen too many papers where people run a simulation, get a result that looks like the observations, and say 'we've solved it.' And I think — well, have you? What's the physical mechanism? A simulation can give you the right answer for the wrong reasons. The real progress comes when you combine simulation with analytic theory — when you can say 'I understand *why* this happens.' That's the goal."

**Q: "What's your opinion on the state of space physics education?"**

> *Velli would answer:* "I think we're doing well in some ways and poorly in others. The students we get at UCLA are fantastic — bright, motivated. But I worry that we're not teaching them enough of the history. They know how to run a simulation but they don't know why Parker proposed the solar wind in the first place, or how Alfvén discovered the waves that bear his name. And that matters, because when you understand the history, you understand why certain ideas are important and others are dead ends. You don't waste time reinventing wheels."

---

## 7. Detecting Persona Signals

Signal detection is a skill. Here are patterns to look for across sources.

### 7.1 The "Pet Idea" Signal

Every senior academic has 1-3 ideas they push consistently across decades. These appear in paper introductions, conference keynotes, interviews, and even casual comments. They are *repeated*.

**How to detect**: When the same argument, analogy, or framing appears in sources from different years (e.g., a 2005 paper and a 2023 lecture), it's a pet idea.

**Example (Velli)**: The idea that "Alfvén waves are not just a heating mechanism but *the* mechanism for solar wind acceleration" appears across his career. Variations of this argument appear in 1990s papers, 2000s reviews, and 2020s Parker Solar Probe analyses.

### 7.2 The "Adversarial" Signal

Who does the person disagree with? This is often more revealing than who they agree with.

**How to detect**: Look for phrases like "However, some authors claim…", "An alternative view is…", "This ignores the fact that…", or direct responses in Q&A.

**Example (Velli)**: The debate between "wave heating" and "nanoflare heating" is a recurring foil. His position is clear: wave heating is primary, nanoflare heating is secondary or operates at different scales.

### 7.3 The "Intellectual Genealogy" Signal

Who do they cite? Who trained them? Who do they thank in book prefaces?

**How to detect**: Look at the references of review articles (where they have freedom to cite who they want). Look at thesis acknowledgments. Look at award citations that mention their influence.

**Example (Velli)**: His intellectual lineage includes Eugene Parker, Hannes Alfvén (indirectly), his Arcetri mentors, and long-time collaborators like J. Hollweg and B. Chandran.

### 7.4 The "Frustration" Signal

What frustrates or annoys them? This emerges in off-hand comments, asides, and Q&A.

**How to detect**: Words like "unfortunately," "sadly," "I wish," "the problem is," "people don't appreciate."

**Example (Velli)**: Frustrated by oversimplified models that ignore plasma physics, by "simulation-only" papers that lack analytic insight, and by funding agencies that don't support long-term theory work.

### 7.5 The "Enthusiasm" Signal

What makes them animated? This is pure persona gold.

**How to detect**: Exclamation points, intensifiers ("extraordinary," "incredible," "fascinating"), faster speech, longer answers.

**Example (Velli)**: Parker Solar Probe data. New observations of the near-Sun environment. Historical anecdotes about the pioneers of the field.

---

## 8. Red Flags & Pitfalls

### 8.1 The "Wikipedia Voice" Trap

**Pitfall**: Using Wikipedia's neutral, encyclopedic tone as the person's voice.

**Solution**: Never quote Wikipedia. Use it for facts only. Always find original sources for what the person actually said.

### 8.2 The "Halo Effect" Trap

**Pitfall**: Treating everything the person has written as equally important.

**Solution**: A throwaway comment in a 1993 paper is not a core value. Weight sources by:
1. How recent they are
2. How much effort the person put into them (a book preface > a journal paper intro)
3. How personal they are (interview > abstract)

### 8.3 The "Temporal Drift" Trap

**Pitfall**: Treating the person's views as static across their career.

**Solution**: A person in 1998 may have different views than the same person in 2024. Track how their thinking has evolved. Note what changed and what stayed constant.

**Example (Velli)**: His commitment to Alfvén wave heating is constant (1980s-2020s), but his views on the relative importance of turbulence vs. coherent wave propagation may have evolved as Parker Solar Probe data arrived.

### 8.4 The "Single Source" Trap

**Pitfall**: Building the persona from one interview or one paper.

**Solution**: You need at least 3 independent sources that agree on a persona characteristic before you can be confident. One source might be an outlier.

### 8.5 The "BibTeX Blindness" Trap

**Pitfall**: Looking only at publication metadata, never reading the papers.

**Solution**: Read at least introductions and conclusions. A paper titled "MHD turbulence in the solar wind" could be purely numerical or purely observational — the title doesn't tell you which.

### 8.6 The "Over-Citation" Trap

**Pitfall**: Dumping long BibTeX lists into the persona document.

**Solution**: Select 10-15 representative papers. Know what each one is about, what it argues, and why it matters. Quality over quantity.

---

## 9. Checklist: Before You Impersonate

Before you begin generating text as this person, verify you have the following:

### Facts
- [ ] Full name (with middle initials if used)
- [ ] Current title and affiliation
- [ ] PhD year, institution, advisor
- [ ] Employment history (positions + dates)
- [ ] Key honors (fellow status, major awards)
- [ ] Research areas (5-10 keywords)

### Publications
- [ ] Total publication count
- [ ] h-index (for calibration of seniority)
- [ ] 5 most-cited papers and what they're about
- [ ] 1-2 recent papers (current interests)
- [ ] 1-2 papers from early career (shows trajectory)

### Voice
- [ ] Characteristic phrases (at least 5)
- [ ] Speaking style notes (formal/casual, dense/accessible)
- [ ] Analogy domains
- [ ] Humor style (or absence thereof)
- [ ] Enthusiasm triggers
- [ ] Dismissal triggers

### Values
- [ ] 3 core scientific beliefs
- [ ] Methodological preferences
- [ ] "Pet ideas" (repeated across career)
- [ ] What they disagree with in their field
- [ ] Broader professional values (teaching, policy, outreach)

### Knowledge Map
- [ ] Areas of deep expertise
- [ ] Areas of passing familiarity (don't oversell)
- [ ] Key collaborators (who they work with)
- [ ] Key intellectual influences (who shaped them)
- [ ] Key missions/instruments/projects they're involved in

### Cross-Check
- [ ] At least 2 independent sources confirm each major fact
- [ ] Voice characteristics backed by transcript evidence
- [ ] Values backed by multiple sources across time
- [ ] You can answer: "What would they say if asked about [core topic]?" with specific, grounded reasoning

---

## Appendix A: Quick-Reference URL Templates

```text
# Google Scholar (search first)
https://scholar.google.com/scholar?q="{Full Name}"+"{University}"

# Semantic Scholar API
https://api.semanticscholar.org/graph/v1/author/search?query={Name}

# ORCID search
https://orcid.org/orcid-search/search?searchQuery={Name}

# ADS (astronomy/space physics)
https://ui.adsabs.harvard.edu/search/q=author:"{LastName}, {FirstName}"

# arXiv
https://arxiv.org/search/?query="{Full Name}"&searchtype=all

# Wikipedia
https://en.wikipedia.org/wiki/{Firstname}_{Lastname}

# AGU Honors
https://www.agu.org/Honors-and-Recognition

# APS Fellows
https://www.aps.org/programs/honors/fellowships/

# AAA Fellows (AAAS)
https://www.aaas.org/fellows

# YouTube (lectures)
https://www.youtube.com/results?search_query="{Full Name}"+lecture

# Sci-Hub (for paywalled papers — use responsibly)
https://sci-hub.se/{DOI}
```

## Appendix B: BibTeX Extraction Template

When exporting from Google Scholar, you get entries like:

```bibtex
@article{velli2020parker,
  title={Parker Solar Probe: A mission to touch the Sun},
  author={Velli, Marco and others},
  journal={Space Science Reviews},
  year={2020},
  volume={216},
  pages={1--30}
}
```

Extract the following fields for persona-building:
- **title**: Tells you the topic
- **author**: Note their position in author list (first author = they led it)
- **year**: Temporal positioning
- **journal**: Prestige signal
- **volume/pages**: Scale of the work

## Appendix C: The "One-Page Persona" Template

Use this as the final deliverable of your research process.

```yaml
# === ONE-PAGE PERSONA ===
name: "Dr. [Full Name]"
title: "[Current Position]"
affiliation: "[University / Institution]"
email: "[public email]"

# === BIOGRAPHY ===
education:
  - degree: "PhD in [Field]"
    institution: "[University]"
    year: [YYYY]
    advisor: "[Name]"

career:
  - position: "[Current]"
    institution: "[Current]"
    years: "[YYYY-present]"
  - position: "[Previous]"
    institution: "[Previous]"
    years: "[YYYY-YYYY]"

honors:
  - "[Fellow, Society, Year]"
  - "[Major Award, Year]"

# === RESEARCH ===
top_5_papers:
  - "[Title] ([Year]) — cited [N] times — [one-line topic]"
  - "[Title] ([Year]) — cited [N] times — [one-line topic]"
  - "[Title] ([Year]) — cited [N] times — [one-line topic]"
  - "[Title] ([Year]) — cited [N] times — [one-line topic]"
  - "[Title] ([Year]) — cited [N] times — [one-line topic]"

research_keywords:
  - "[Keyword 1]"
  - "[Keyword 2]"
  - "[Keyword 3]"

pet_ideas:
  - "[Idea they push consistently across career]"

# === VOICE ===
characteristic_phrases:
  - '"[Phrase 1]"'
  - '"[Phrase 2]"'
  - '"[Phrase 3]"'

speaking_style: "[2-3 sentence description]"

analogy_domains:
  - "[Domain 1]"
  - "[Domain 2]"

enthusiasm_triggers:
  - "[Topic that makes them animated]"

dismissal_triggers:
  - "[Topic they consider unimportant or misguided]"

# === VALUES ===
core_beliefs:
  - "[Belief 1]"
  - "[Belief 2]"
  - "[Belief 3]"

methodological_preference: "[e.g., observational > theoretical > numerical]"

key_collaborators:
  - "[Name 1]"
  - "[Name 2]"

intellectual_influences:
  - "[Name 1]"
  - "[Name 2]"
```

---

## Final Note

The goal of this research process is not to produce a biography. It is to produce a **generative constraint system** — a set of rules, tendencies, and preferences that let you generate text that could plausibly have come from the target person. The more thorough your research, the more convincing the impersonation.

Remember: You are not the person. But with enough signal extraction, you can become a faithful emanation — one that would make the original nod in recognition.

**Good hunting.**

---

## 10. Special Case: Researching Ancient Historical Figures

> *This section was developed during the Li Bai persona project. Ancient figures require a fundamentally different research strategy because the source hierarchy is inverted — the subject's own writings are both the primary evidence AND the voice model.*

### Source Inventory for Ancient Figures

| Where to look | What you find | Tools |
|---------------|---------------|-------|
| **Subject's complete works** | Primary voice, creative method, emotional register, life events | Digital libraries, academic editions, wikisource |
| **Dynastic histories** | Official biography, career timeline, key events | Wikisource, CText.org, Perseus Digital Library |
| **Contemporary prefaces/colophons** | First-hand accounts by people who knew the subject | Academic editions of collected works |
| **Stele inscriptions/tomb epitaphs** | Biographical details, family background, death circumstances | Archaeological databases, local gazetteers |
| **Later scholarly commentary** | Interpretation, dating, attribution debates | JSTOR, CNKI, Google Scholar |
| **Complete works compilations** | Comprehensive corpus with annotations | Digitized critical editions |

### Voice Reconstruction from Writings

When the subject is a writer (poet, essayist, philosopher), their voice must be reconstructed from their works:

1. **Identify the linguistic register** — Classical Chinese? Medieval Latin? Koine Greek? Elizabethan English? Document the grammar, vocabulary, and rhetorical patterns.
2. **Build a metaphor inventory** — Extract characteristic images from the complete works, frequency-rank them. (Li Bai: moon, wine, sword, mountain, great Peng bird)
3. **Map emotional expression** — How does the subject express joy? Sorrow? Anger? Map to specific works and life events.
4. **Identify forbidden patterns** — What would this person NEVER say? What register, vocabulary, or attitude is antithetical to their voice?
5. **Document literary allusions** — What works does the subject reference? What do they expect their reader to know?

### The Works Chronology

For creative figures, create a **works chronology** — equivalent to a bibliography for academics:

- Map each major work to its life period
- Note creation circumstances (where, when, for whom)
- Identify connections between works (themes, imagery, evolution)
- Group by thematic networks (e.g., for Li Bai: moon journey, wine journey, Peng bird journey, farewell journey, frustration journey)

This chronology is the backbone of the persona — it connects the creative output to the life trajectory.

### Research Workflow for Ancient Figures

```
Step 1: Acquire complete works in original language
Step 2: Read dynastic histories / official biographies
Step 3: Find contemporary accounts (prefaces, letters, epitaphs)
Step 4: Build works chronology (map works → life periods)
Step 5: Extract voice profile from works (metaphors, register, patterns)
Step 6: Build VA arguments (life events, key works, philosophical positions)
Step 7: Induce method cards from creative/strategic patterns
Step 8: Assemble four-piece profile
Step 9: [Optional but powerful] Spawn avatar dialogue
```

### Key Differences from Modern Research

| Modern Research | Ancient Research |
|----------------|-----------------|
| Google Scholar for papers | Complete works compilations for poems/writings |
| Video transcripts for voice | Subject's own writings for voice |
| LinkedIn/CV for career | Dynastic histories for biography |
| Interviews for values | Philosophical writings + letters for values |
| Co-author network for relationships | Contemporary correspondence + dedications for relationships |
| 100+ papers to decompose | 5-10 major works + complete works for context |
