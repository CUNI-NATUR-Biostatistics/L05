# Stages 4-5 - Slide Storyboard, Build, and Human Review

## Metadata

- Week: L05
- Date: 2026-08-03
- Author: Ondřej Mottl (with Codex)
- Reviewer: Independent internal `vision-corrector` completed; Ondřej Mottl pending human review

## Git checkpoint

- Stage group: Stages 4-5 presentation
- Branch: `lesson/l05-presentation`
- Base branch and commit: `main` at `019f7b59e10ed50980ca9a2fc5841e08766dd186` (`Build L05 learning materials around effect-first hypothesis testing (#2)`)
- Stages 2-3 PR merged: [x] PR #2, merged 2026-08-03 at 13:07:52 UTC
- Branch created from updated default branch: [x]
- `git status --short` reviewed before editing: [x] clean
- Presentation PR: Not opened; publishing is outside the current authorization

## Inspiration consulted

- Relevant source(s) from `_internal/obecne/nove/biostatistics_course_inspiration_hub.md`: ModernDive; Modern Statistics with R; genomicsclass / PH525x. The approved Stage 0 research dossier remains the source record for the wider philosophy-of-science, regression-testing, and decision-error references.
- Visual or data-storytelling pattern worth borrowing: Use one recurring biological question, construct the null reference world visually, move from concrete values to notation, and attach every test result to effect magnitude, uncertainty, and limitations.
- How the pattern is being adapted to this course's slide rules: The 13-site crab model remains the anchor; the deck alternates minimal questions, full-width evidence, split interpretation, short rules, and writing tasks. Statistical names arrive only after a concrete need has been created. Effect magnitude and biological importance recur before and after the p-value sequence.
- What from the source is intentionally not being reused: Tidyverse-first student code, a test-selection catalogue, a new two-group test, dense mathematical derivations, external worksheets, unverified third-party imagery, formal sample-size calculation, and a significance-first conclusion.
- Completed course examples consulted: L04 for title-hook-outcomes ordering, no-vote fallbacks, slide-local figure generation, evidence cards, fragment QA, and static fallbacks; L03 for the familiar `lm()` grammar, slope interpretation, residual-density and residuals-versus-fitted reading, and the reminder that a first model is the start rather than the end of an argument.

## Communication job

By the end, biology and ecology students should be able to construct and critique an effect-first hypothesis-test conclusion because they can connect the familiar regression slope and its uncertainty to a precisely defined zero-slope reference world, t statistic, degrees of freedom, p-value, decision rule, possible errors, and limitations.

## Storyboard by concept block

### Block 1 - What can science test?

- Prompt: Commit to how the claim “Měsíc je celý ze sýra” could be tested, then classify Moon, swan, passenger-pigeon, and beauty/value claims.
- Evidence reveal: Testability is separated from plausibility, and each empirical claim is paired with an observation that could change the conclusion.
- Interpretation: A statistical test evaluates data under one defined hypothetical world; it does not assign truth probabilities.
- Bridge/caveat: Move from a deliberately implausible claim to a real biological claim whose answer is not known in advance.

### Block 2 - The crab question and evidence unit

- Prompt: Identify whether the evidence unit for a north-south claim is one crab or one sampled marsh.
- Evidence reveal: Atlantic-coast map, 392 faint individual measurements, and 13 prominent site means.
- Interpretation: The main model uses one row per marsh because crabs sharing a site are not 392 independent answers to a latitude question.
- Bridge/caveat: Aggregation makes the evidence unit clear but does not create a full hierarchical or spatial model.

### Block 3 - Familiar model, effect, and diagnostics

- Prompt: Predict the site-mean scatter before the line appears; later judge biological importance before testing.
- Evidence reveal: Site-mean scatterplot, fitted line, transparent `lm()` call, focused coefficient/CI output, and the two familiar diagnostic views.
- Interpretation: The slope is approximately 0.490 mm per degree north, 2.45 mm per 5°, and 6.22 mm across the sampled latitude range.
- Bridge/caveat: A biologically interesting estimate still needs uncertainty and model/design limitations.

### Block 4 - Uncertainty

- Prompt: Read the estimate, SE, and 95% interval and identify which effect magnitudes remain compatible with the data and model.
- Evidence reveal: A short L04 callback and an interval graphic with estimate and precision kept visually distinct.
- Interpretation: The interval describes plausible effect magnitudes; it is not a p-value and does not make every magnitude equally important.
- Bridge/caveat: The narrower exact-zero question comes only after magnitude and uncertainty are visible.

### Block 5 - A world with zero systematic trend

- Prompt: Predict fitted slopes across simulated datasets after the systematic population slope is set to zero but new residual randomness is retained.
- Evidence reveal: Twenty simulated studies followed by the distribution of 5,000 fitted null slopes and the observed crab slope.
- Interpretation: Sampling, measurement, omitted local conditions, and other biological differences can make individual fitted slopes nonzero even when the systematic slope is zero.
- Bridge/caveat: To compare the observed effect fairly with this reference world, measure its distance from zero relative to its uncertainty.

### Block 6 - Construct the t statistic

- Prompt: Calculate `(0.490 - 0) / 0.0795` from a concrete evidence table.
- Evidence reveal: Difference from the null, standard error, and the result `t ≈ 6.16`, followed only then by general notation.
- Interpretation: t is distance from one null value in standard-error units; it is neither effect size nor biological importance.
- Bridge/caveat: The same numerical t is not equally unusual with every amount of residual information.

### Block 7 - Degrees of freedom

- Prompt: Reason through a 3 × 3 Sudoku block and then the fixed-mean equations `7 + 12 + x + y = 40` and `7 + 12 + 9 + x = 40`.
- Evidence reveal: The final Sudoku value becomes forced; one fixed mean removes one independent choice; the simple regression estimates two coefficients from 13 sites.
- Interpretation: Residual df = observations minus estimated coefficients = `13 - 2 = 11`.
- Bridge/caveat: Sudoku visualizes remaining choice but does not derive regression df; t curves show why df affects how unusual a given t is.

### Block 8 - Area under the t curve and p-value

- Prompt: Compare t curves and interpret a clearly labelled illustrative `|t| ≥ 2` shaded area before seeing the crab tails.
- Evidence reveal: t curves for df 1, 11, and 10,000; an illustrative two-tail area; then the tiny crab tails at `|t| ≈ 6.16`.
- Interpretation: The two-sided p-value is the probability, under the zero-slope hypothesis and model assumptions, of a t statistic at least as far from zero; it ranges from 0 to 1.
- Bridge/caveat: Misconception diagnosis rejects truth probability, effect-size, chance-only, replication-probability, and assumption-check interpretations.

### Block 9 - Decisions, alpha, significance, and intervals

- Prompt: Decide what rule would be needed when a practical decision cannot be deferred.
- Evidence reveal: Alpha in words, the common 5% threshold, historical critical values, the `df = 11` boundary 2.201, and the exact locations of t, p, and residual df in R output.
- Interpretation: “Statisticky významný” and “statisticky signifikantní” name the decision-rule outcome; neither says the effect is large or biologically important.
- Bridge/caveat: At two-sided alpha 0.05, the 95% interval supplies the same exact-zero decision while also showing plausible effect magnitudes.

### Block 10 - Wrong decisions and power

- Prompt: Classify Type I and Type II errors using the pregnancy-test mnemonic and invasive-species surveillance.
- Evidence reveal: The two existing course-native illustrations, the consequential 2 × 2 surveillance table, the crab translation, and a numerical power comparison.
- Interpretation: Power is the ability of the study/procedure to detect a scientifically meaningful effect that exists. In the chosen 0.25 mm/degree scenario it is about 81.5%; for a slope the size observed in the crab data it is about 99.98%.
- Bridge/caveat: Simulated power is conditional on the chosen effect, residual variability, sites, alpha, and model; it is not a probability that the scientific conclusion is true.

### Block 11 - Scientific conclusion and return to the Moon

- Prompt: Critique “p < 0,05, proto je hypotéza pravdivá” and write an effect-first conclusion from a compact evidence card.
- Evidence reveal: A complete conclusion in the order magnitude and units, biological meaning, uncertainty, exact-zero compatibility and statistical significance, assumptions/limitations, and cautious substantive conclusion.
- Interpretation: Evidence supports a revisable claim about the sampled marshes; it does not prove causality or Bergmann's rule.
- Bridge/caveat: Return to the Moon, summarize the evidence hierarchy, and connect the same reasoning to categorical group comparisons in the following lesson.

## Interaction plan

1. Moon claim commitment and testability/plausibility vote, with a visible no-vote writing fallback.
2. Four-claim classification: empirical testability, plausibility, and a potentially conclusion-changing observation.
3. Observational-unit identification: 392 individual crabs or 13 marsh means.
4. Predict the site-mean scatter before the fitted line is shown.
5. Interpret 1°, 5°, and sampled-range effect scales and judge biological interest.
6. Read the confidence interval and name compatible small and large positive effects.
7. Predict fitted slopes in the zero-systematic-slope simulation.
8. Calculate the crab t statistic from the evidence table.
9. Solve the fixed-mean degrees-of-freedom example.
10. Compare t curves and shaded areas before naming the p-value.
11. Diagnose p-value misconceptions with commitment before reveal.
12. Classify Type I/II errors and write the final effect-first scientific conclusion.

Formal voting prompts use a visible `Když nehlasujeme` fallback. Other interactions use short individual commitment, whole-class interpretation, or paired explanation only where social reasoning adds value.

## Major visuals

- Course-native Atlantic-coast site map.
- 392 individual measurements with 13 site means emphasized.
- Recurring site-mean scatterplot with and without the fitted line.
- Focused coefficient/CI output and combined residual diagnostics.
- Effect-scaling graphic for 1°, 5°, and the sampled range.
- Estimate-and-95%-CI graphic.
- Twenty simulated zero-slope studies and a 5,000-slope reference histogram.
- Concrete t evidence table and calculation.
- Two-panel Sudoku graphic and fixed-mean equations.
- t-curve comparison, illustrative shaded probability area, and crab p-value tails.
- Critical-value comparison and CI-against-zero graphic.
- Existing course-native Type I/II pregnancy-test illustrations.
- Power comparison for the chosen 0.25 mm/degree scenario and the observed crab slope.
- Final evidence card and complete scientific conclusion.

## Visual workflow checks

- Text-light slides (no dense walls): [x] the final scientific conclusion is intentionally the only paragraph-style evidence card
- Staged reveal via fragments/incremental: [x] 10 progressive-disclosure slides checked in initial, intermediate where relevant, and final states
- Figures generated locally near slide blocks: [x]
- Immediate interpretation after key visuals: [x]
- Interaction cadence present: [x] 12 planned interactions distributed across the 11 concept blocks
- Questions remain visible before answers: [x] verified in the rendered HTML states
- Static fallbacks present for animations: [x] no animation used; the PDF supplies the complete final state for every slide

## Slide-role rhythm

- Main interaction slide forms used: Minimal centred questions, graph-plus-prompt, compact option panels, calculation table, and evidence-card writing.
- Main evidence reveal forms used: Full-width plots, same-data-one-new-layer repeats, focused code/output, and side-by-side visual comparisons.
- Main interpretation forms used: Graph-plus-short takeaway, result/question contrasts, and one durable rule at the end of a concept block.
- Where the bridge to the next concept happens: Every major block ends with an unresolved question that the next block answers; the closing bridge transfers effect-first reasoning from a numerical slope to a difference between groups.

## Risks and planned fixes

- Visual rhythm risk: Eleven concept blocks could become a long sequence of component boxes. Planned fix: enforce the three-of-five component rule, use plain full-width plots and minimal prompts, and reserve heavy rule/warning cards for durable definitions or genuine errors.
- Content pacing risk: Degrees of freedom, critical values, and power could turn the deck into a compressed written lesson. Planned fix: keep concrete values and one visual comparison in the deck; leave full derivations and preparation code in `skripta.qmd`.
- Statistical-priority risk: The very small crab p-value could become the climax. Planned fix: show effect scales before testing, repeat them in the final evidence card, and never let p-value be the final sentence of an interpretation.
- Evidence-unit risk: Faint individual-crab points could invite a 392-observation inference. Planned fix: ask for the observational unit before revealing the 13-site emphasis and state the aggregation limitation directly.
- Null-simulation risk: Students may think zero slope means identical sites or that `lm()` itself adds randomness. Planned fix: explain systematic zero plus new residuals before prediction, explicitly name what varies and what stays fixed, and use deterministic seeded simulation.
- Analogy risk: Students may equate Sudoku cells with df. Planned fix: state the analogy boundary on the same sequence and use the fixed-mean equation plus regression coefficient count as the actual explanation.

## Technical validation and visual review

- Render command: `Rscript R/render_presentation.R`
- Code execution: [x] all 75 Quarto execution steps completed
- `Presentation/presentation.html`: [x] rendered after independent-review resolutions, 8,952,896 bytes; document language verified as Czech (`lang="cs"`)
- `Presentation/presentation.pdf`: [x] rendered after independent-review resolutions, 54 pages, 4,167,580 bytes
- `docs/index.html`: [x] rendered after independent-review resolutions, 8,952,896 bytes
- HTML/docs SHA-256 correspondence: [x] both `6F8A8886727D450B44672CAB08B6705326B056E34EC4B9C059A6032939E66C89`
- UTF-8 without BOM/U+FFFD: [x] presentation source and workflow records have no BOM or replacement characters; rendered HTML has no replacement characters
- Formula, link, citation, image-path, and caption checks: [x] formulas visually render; local figure paths exist; LTER and DOI citations resolve to the intended sources; Moodle resolves to the course login
- Numerical correspondence: [x] independent base-R check reproduced `n = 13`, slope `0.489530761`, SE `0.079477381`, `t = 6.159372085`, `df = 11`, `p = 0.000071124456`, CI `[0.314602225, 0.664459297]`, 5-degree effect `2.447653805`, range effect `6.217040664`, critical t `2.200985160`, and simulated power `4077/5000` and `4999/5000`
- Fragment-state inspection: [x] all 10 slides containing fragments or incremental elements inspected in a headless browser; prompts remain visible, answers remain hidden before reveal, and prior content remains after reveal
- Complete PDF page-by-page visual inspection: [x] all 54 pages inspected; targeted fixes resolved plot-label clipping, map whitespace, diagnostic labels, null-histogram annotations, Sudoku title/facets, t-curve labels, p-tail labels, alpha rendering in box headings, the R-output title, illustration footer length, and power-label precision
- Source/scope checks: [x] focused `git diff --check` clean; tracked diff is restricted to presentation source/output and workflow records; `Learning_materials/skripta.qmd` has no diff; staged diff is empty
- Known warnings: `renv` reports the project out of sync; Sass reports course-theme variables used before declaration; `fs` was built under R 4.5.2. These warnings did not stop rendering or change the synchronized brand fingerprint (`7062b131da5a0570ccafea28bc90f0d0`). The wrapper rewrites several canonical infrastructure files byte-identically, so `git status` can temporarily report them as modified although `git diff` and blob hashes show no content change.

## Independent internal review

- Canonical reviewer prompt: `.ai/agents/vision-corrector.md`
- Complete `Presentation/presentation.qmd` reviewed: [x]
- Approved sibling `Learning_materials/skripta.qmd` inspected by reviewer: [x]
- Complete rendered deck and provided fragment states inspected by reviewer: [x]
- Credible findings resolved: [x]
- Affected slides rerendered and rechecked: [x] slides 5, 7, 45, 46, 49, and 53; changed fragment states on slides 5, 45, and 53
- Findings and resolutions:
  - Closed the claim-classification activity by explaining that “nejkrásnější” is a value judgement without a prespecified measurable criterion.
  - Renamed “nezávislá odpověď” to “jednotka pozorování” so the deck does not assert independence before naming it as an assumption and later limitation.
  - Placed the power-direction question before the incremental answers and changed the following graph prompt from a repeated prediction to interpretation of 81.5%, 99.98%, and their conditioning assumptions.
  - Removed the late, otherwise unintroduced “Bergmannovo pravidlo” label from the final conclusion and used the already prepared claim about generalisation beyond sampled marshes.
  - Reduced `Co si odnést` from seven bullets to five memorable evidence-order statements.
- Reviewer verdict: the deck follows the intended L05 vision; after these targeted resolutions it is suitable for instructor review. Residual instructor-judgement points are the strength of “biologicky zajímavá” for 6.22 mm and the classroom value of the two generated pregnancy-test mnemonics.

## Stage 5 - Human review gate

- Lesson-vision review completed: [x]
- Human review completed: [ ]
- Credible findings resolved: [x]
- Presentation rendered and checked: [x]
- Reviewer decision: Pending instructor review; the deck must not be called approved before explicit human acceptance.

## Decision

- [x] Slides ready for meaningful instructor review
- [x] Diff contains only Stages 4-5 sources, records, and corresponding outputs
- [ ] Presentation PR ready to merge
- Notes: Work is intentionally limited to the local Stage 4-5 branch. No files have been staged, committed, pushed, or published.
