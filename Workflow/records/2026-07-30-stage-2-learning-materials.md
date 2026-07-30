# Stages 2-3 - Learning Materials and Human Review

## Metadata

- Week: L05
- Date: 2026-07-30
- Author: Ondřej Mottl (with Codex)
- Reviewer: Ondřej Mottl (pending)

## Git checkpoint

- Stage group: Stages 2-3 written materials
- Branch: `lesson/l05-skripta`
- Base branch and commit: `main` at `c6ddf7a2202324346d0088037d9c9177080c9b2b`
- Stages 0-1 PR merged: [x] PR #1
- Branch created from updated default branch: [x]
- `git status --short` reviewed before editing: [x] clean
- Written-materials PR: not opened

## Inspiration consulted

- Relevant source(s) from `_internal/obecne/nove/biostatistics_course_inspiration_hub.md`: ModernDive; Modern Statistics with R; genomicsclass / PH525x. The wider source review in `2026-07-30-stage-0-inspiration-research.md` also informed the philosophy-of-science opening, regression test construction, and error examples.
- Which structural or explanatory pattern is being borrowed: A visual null distribution, repeated interpretation checks, the coefficient test as distance from a precise null in standard-error units, and conditional rather than truth-claiming language.
- How that pattern is being adapted to Czech, beginner, model-first teaching: The familiar raw regression slope remains the main scientific quantity. Concrete crab values, words, and tables precede general notation. The p-value appears only after effect magnitude, biological importance, confidence-interval uncertainty, the null world, the t statistic, and residual degrees of freedom.
- What from the source is intentionally not being reused: Tidyverse-first student workflows, an isolated test-selection catalogue, a new two-group problem, simulation as a substitute for the familiar regression model, external worksheets or artwork, and advanced derivations or power calculations.

## Stage 2A - Structural draft

- Section order complete: [x]
- First visual/table included: [x]
- First interpretation prompt included: [x]
- Misconception checkpoint included: [x]
- Bridge to next concept included: [x]

### Structural draft notes

- Opening biological question: How can science decide whether evidence supports a claim without pretending that one statistical test establishes truth?
- First data moment: An official CC0 fiddler-crab teaching dataset is reduced transparently from 392 adult males to one row for each of 13 salt-marsh sites.
- Where the model-based framing first appears: The observational-unit comparison leads directly to an explicit base-R `lm(prumerna_sirka_mm ~ zemepisna_sirka)` model on site means.
- Structural decision: Preserve one continuous investigation from the Moon claim to a cautious crab conclusion. Old Faithful appears only as a short L04 uncertainty callback.
- Structural decision: Keep the recurring evidence order effect magnitude → biological importance → uncertainty → exact-null compatibility → assumptions and possible errors.

## Stage 2B - Development pass

- Major concept blocks have visual anchors: [x]
- Interpretation prompts expanded: [x]
- Explanatory payoff text improved: [x]
- Transitions revised for self-study readability: [x]
- Glossary markup checked where relevant: [x]

### Development pass notes

- Which concept block improved most: The sequence from the observed slope through the confidence interval, numerical t construction, residual degrees of freedom, and two-sided p-value now proceeds from biological units and actual numbers to general notation.
- Which visual or comparison became the main anchor: The effect-scaling figure links 1°, 5°, and the full sampled latitude range; the adjacent interval and null-reference visuals keep magnitude and uncertainty visible before testing.
- Where the lesson still feels thin: No core block remains structurally thin. Instructor judgment is still needed on the tone of the pregnancy-test mnemonic and on whether the biological-importance wording is appropriately cautious for the course.
- Development improvement: Added 17 distinct active-learning or microactivity blocks covering claim classification, observational units, effect scaling, interval reading, null predictions, t calculation, degrees of freedom, p-value tails and misconceptions, decision errors, and effect-first reporting.
- Development improvement: Added course-native visuals and tables for claims, site latitude, aggregation, effect scaling, confidence interval, null slopes, numerical t, Sudoku and fixed mean, t curves, p-value tails, decision errors, and the final evidence hierarchy.
- Development improvement: Added a reproducible source-preparation script, pinned source MD5, a Czech individual-level table, a Czech site-mean table, and a provenance README.

## Quality check notes

- What improved most: The lesson now explains the complete inferential chain without letting the p-value displace the regression coefficient or the biological question.
- What remains weak: The simple unweighted site-mean model necessarily leaves unequal site-mean precision, possible spatial dependence, influence of the two southern sites, and causal interpretation outside the fitted model.
- What needs reviewer focus: Narrative pace across 22 PDF pages; whether the Moon and pregnancy examples fit the instructor's voice; whether approximately 6.22 mm across the sampled range is described with the right degree of biological caution; and whether any limitation deserves more or less emphasis.
- Lesson-vision review: The written lesson follows the approved Stage 0-1 scope, remains model-first and effect-first, uses one main biological story, includes a visible L03-L04 bridge and L06 handoff, and defers the specified advanced topics.
- Glossary-coverage review: Completed section by section against `slovnik/pojmy.yaml`. Clear first-occurrence gaps were resolved without changing the canonical glossary.
- Source validation: The official `lterdatasampler::pie_crab` source, 392-row/13-site structure, and CC0 package license were verified. The raw `.rda` source is pinned by MD5 in `R/prepare_crab_data.R`.
- Link validation: The LTER vignette, raw source, EDI record, license record, and course glossary returned HTTP 200. The study DOI was independently confirmed but its Wiley landing page returned HTTP 403 to the automated request.
- Numerical validation: The rendered slope, standard error, confidence interval, t statistic, residual degrees of freedom, p-value, sampled-range contrast, and leave-one-site-out slope range correspond to computations from the generated site table.
- Render status: `Rscript R/render_skripta.R` completed for HTML and Typst/PDF on 2026-07-30. The only warnings were the existing non-blocking Google Fonts root-URL 404 messages and an `fs` package build-version notice.
- Visual review: All 22 PDF pages were rasterized and inspected. Opening, aggregation explanation, effect and interval figures, formula tables, Sudoku/fixed-mean sequence, t curves, both p-value tails, decision matrix, final conclusion, and glossary were legible without clipping or overlap.
- Remaining uncertainty: Human review has not yet decided whether the written-materials branch is approved for a PR or merge.

## Stage 3 - Human review gate

- Lesson-vision review completed: [x]
- Glossary-coverage review completed: [x]
- Human review completed: [ ]
- Credible findings resolved: [x]
- HTML/PDF rendered and checked: [x]
- Reviewer decision: Pending meaningful human review.

## Decision

- [x] Written materials are review-ready
- [x] Diff contains only Stages 2-3 sources, records, and corresponding outputs
- [ ] Written-materials PR ready to merge
- Notes: Stop at the Stage 3 human-review gate. Do not begin `Presentation/presentation.qmd` until the written-materials PR has been reviewed and merged.
