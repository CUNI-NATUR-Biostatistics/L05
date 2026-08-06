# Stages 4–5 — Presentation storyboard, build, and review

## Metadata

- Week: L05
- Stage group: Stages 4–5
- Started: 2026-08-03
- Phase 5 redesign and instructor revision: 2026-08-04
- Additional instructor wording, layout, code-locality, and inference-sequence revision: 2026-08-05
- Instructor-requested section-divider and pacing pass: 2026-08-06
- Author: Ondřej Mottl with Codex
- Human reviewer: Ondřej Mottl — final review completed; presentation confirmed finished on 2026-08-05
- Independent reviewer: read-only internal `vision-corrector`

## Git checkpoint

- Branch: `lesson/l05-presentation`
- Exact base commit: `019f7b59e10ed50980ca9a2fc5841e08766dd186`
- Base subject: `Build L05 learning materials around effect-first hypothesis testing (#2)`
- Written-materials PR: #2, merged into `main` on 2026-08-03
- Branch created from updated `main`: yes
- Presentation PR: not opened
- Codex did not stage, commit, push, or publish changes. `Presentation/presentation.qmd` was already staged when the final manual-review pass began; the final corrections remain unstaged on top of that staged version.

## Scope and continuity

The approved `Learning_materials/skripta.qmd` remained unchanged. The presentation distils that lesson into a classroom narrative and deliberately omits several detailed derivations. It retains the L04 convention of title → immediate hook → learning outcomes, the L04 repeated-observation animation callback, and the familiar L03 `lm()`/`summary()` connection.

The first implementation followed the written lesson too literally. During Stage 5, the instructor requested a more visual and engaging story centred on the difference between reality and what a particular study observed. A detailed second review then supplied slide-level language, sequencing, visual, and technical-density changes. Those decisions and the resulting storyboard are recorded in `2026-08-04-stage-5-storyboard-review.md`.

The instructor's later manual wording and layout edits were treated as the new baseline and preserved. The 2026-08-05 pass focused on locality of hidden R preparation, stronger visual separation between repeated observations, clearer null-hypothesis and alpha scaffolding, the order of the tail-area sequence, and rendered full-canvas composition.

## Recorded redesign scope decisions

The Stage 5 redesign intentionally departs from parts of the original Stage 4 brief in response to instructor review:

- the 0.49 mm/° slope is not rescaled to 5° or the full sampled range because the instructor judged that calculation unimportant for the live deck;
- the full Sudoku/fixed-mean degrees-of-freedom scaffold is not restored; the deck keeps the concise regression rule `df = n - 2`, the crab calculation `13 - 2 = 11`, and the requested n/df comparison;
- the observed shaded-tail slide precedes the selected t-value and n comparisons, following the instructor's explicit ordering decision;
- the formal power block remains omitted from the live deck at the instructor's request; Type I/II errors remain, but the detailed 0.25 mm/° power simulation stays in the approved written lesson.

These are deliberate presentation-scope choices, not accidental omissions from the written lesson.

## Final draft narrative

The final 49-slide deck follows this arc, with four empty first-level-header dividers marking the main transitions:

1. cheese-Moon testability hook;
2. four visually supported claims that differ in testability;
3. real fiddler crab, 13 Atlantic-coast sites, response/predictor, and Bergmann prediction;
4. the observed site-level relationship, `lm()`, and a concise `summary()` callback;
5. observed relationship versus biological reality;
6. repeated studies, uncertainty, and the limits of the study window;
7. a world with zero systematic slope plus residual randomness;
8. repeated null-world observations, an accumulating slope histogram, and the observed slope placed against it;
9. concrete t construction, observed tail area, comparison of selected t values, and the effect of n/df;
10. conditional p-value interpretation;
11. an explicit return from the null world to the null hypothesis, alpha, statistical significance, and Type I/II errors;
12. confidence-interval comparison;
13. effect-first scientific conclusion, Moon callback, takeaways, and L06 bridge.

The dividers ask: “Co z reality skutečně pozorujeme?”, “Jak daleko jsme od nulového světa?”, “Kdy musíme udělat rozhodnutí?” and “Co tedy můžeme tvrdit?”. They follow the established L01 convention and provide visible orientation plus natural points for questions or a short break without adding technical content.

The power section was removed from the live deck at the instructor's request.

## Active-learning plan

Approximately 11 interactions are distributed through the story:

- observation that could challenge the Moon claim;
- four-claim classification;
- response-versus-predictor identification;
- Bergmann-direction prediction;
- scatterplot interpretation before the line;
- reality-versus-observation commitment;
- null-world slope prediction;
- numerical t calculation;
- observed tail-area reading followed by t = 1/1.5/3 and n = 3/13/100 comparisons;
- p-value misconception diagnosis and Type I/II classification;
- final scientific-sentence writing.

Questions precede evidence. Formal voting prompts include a visible no-vote fallback. Correct misconception answers are delayed and emphasized with rough notation only after commitment.

## Major visuals

- generated photorealistic Moon made of cheese;
- four-column claim montage with generated swan, passenger-pigeon, and subjective-bird images;
- real *Minuca pugnax* photograph with attribution;
- Atlantic-coast map and 13 site means;
- 13-site scatterplots and fitted regression line;
- study-window and reality/observation metaphors;
- three progressively revealed observations selected from low, median, and high fitted slopes in one assumed reality;
- enlarged confidence interval and routine residual diagnostics;
- coloured zero-slope model equation and residual illustration;
- repeated null-world datasets and fitted slopes;
- 500 simulated null-world studies shown through 125 selected visual states, encoded as a 149-frame GIF, with an immediate static fallback;
- observed study beside the null-slope histogram;
- matched t, df, and shaded-tail figures;
- Type I/II mnemonic illustrations and invasive-species decision example.

## Render and technical validation

- Command: `Rscript R/render_presentation.R`
- Result: successful.
- Rendered slide count: 45 PDF pages.
- `Presentation/presentation.html`: rendered successfully after the lesson-specific stylesheet migration.
- `Presentation/presentation.pdf`: rendered successfully, 45 pages.
- `docs/index.html`: regenerated from the rendered presentation by the project wrapper.
- Final HTML/docs SHA-256: `44D2EC1858B1D89B6F25C82C5DED82FB127A7C9ADB612C17B7A0F8C2A30B4D28` for both files.
- GIF: 500 simulated slopes; 125 selected visual states encoded as 149 frames, visually checked at beginning, middle, and end.
- Source: valid UTF-8 without BOM; no replacement character found.
- Image references: 30 checked, none missing.
- `Presentation/presentation.knit.md`: absent after the successful render.
- `git diff --check`: passed.
- Git state: the instructor-staged presentation source is preserved; final Codex corrections and regenerated outputs are unstaged.
- `Learning_materials/skripta.qmd`: unchanged.
- `renv::status()` reports only packages that are installed and recorded but unused; no used dependency is missing.
- Shared theme components were synchronized from the current `_brand` source: `R/Functions/Theme_generation/generate_presentation_components.R`, `theme/presentation_components.scss`, and `theme/brand_manifest.json` now match `_L-template` byte for byte. The generated component sheet includes the shared `.layout-grid-2`, `.layout-stack`, and `.layout-center-y` composition helpers used by this deck; the remaining inline CSS is lesson-specific.
- The lesson-specific layout rules were subsequently moved out of `Presentation/presentation.qmd` into `Presentation/l05_presentation.css`, referenced through the RevealJS YAML. The QMD now contains no inline `<style>` block, while shared helpers remain owned by the generated theme component sheet.
- Representative PDF pages that exercise the migrated rules were visually inspected. Two pre-existing title overflows found on the variable-role and invasive-species slides were corrected with the existing safe-title treatment and verified in a second successful render.

## Complete visual and fragment review

All 45 PDF pages were inspected individually, supplemented by contact sheets and a rendered-page occupancy audit. The review explicitly considered full-canvas composition rather than only clipping and overflow: vertical balance, top clustering, title-to-content distance, whitespace around neighbouring elements, edge crowding, hierarchy, and intentional versus accidental empty space. Occupancy flags were treated as prompts for visual inspection, not automatic failures, so deliberate whitespace on commitment slides was retained.

Targeted composition changes included the opening question/outcomes, the four-column claim activity, model-output callback, reality/observation cards, uncertainty evidence, null-world sequence, t/df plots, p-value activity, and final Moon/takeaway slides. The final t/df figures use restrained plot typography and clear separation from explanatory cards.

The 2026-08-05 visual pass also found and fixed raw fenced-div markup on the Bergmann slide, bottom clipping in the `summary()` side column, tight spacing below the observed-tail plot, and top-heavy placement on the null-hypothesis and worked-conclusion slides. The final A/B/C study views use sorted simulated slopes 5/100/195 of 200 so their fitted lines are visibly distinct at classroom scale.

Relevant HTML fragment states were captured and inspected:

- repeated-study sequence: three progressive states;
- null-world prediction: initial commitment through highlighted answer;
- t construction: concrete values before general notation;
- p-value misconception: initial commitment through rough-notation reveal;
- Moon return: question before conclusion.

The inspection confirmed that questions are visible before answers, hidden results are initially hidden, earlier content does not disappear accidentally, fallbacks are visible without voting, and the animation has a usable static successor.

## Independent internal review

The complete current `Presentation/presentation.qmd`, approved sibling `Learning_materials/skripta.qmd`, rendered PDF, and representative fragment screenshots were assigned read-only to a separate internal reviewer using `.ai/agents/vision-corrector.md`.

Credible findings and resolutions:

- clipped or crowded PDF headings on the data, null-world, tail-area, and closing slides: applied a scoped safe-title treatment, shortened two headings, and verified the Czech diacritics in the final PDF;
- a plotted crab scenario rounded the p-value to the false label `p = 0,000`: changed the formatter to `p < 0,001` for very small values;
- diagnostic plots were compressed below the confidence interval: retained the interval as the dominant slide and moved diagnostics to a separate, full-size callback slide;
- the t sequence began with numeric substitution: changed it to meaning in words → crab values → general t notation;
- initial repeated-study fragments left most of the canvas empty: added stable placeholder frames in the unrevealed columns;
- the example scientific conclusion was a dense paragraph: rebuilt it as five short effect-first evidence lines;
- the Moon question was top-clustered: vertically centred the complete prompt–fallback–Moon group;
- rough-notation circles did not survive static PDF export: added a brand-consistent static highlight inside the delayed answer fragments.

All affected slides were rerendered and checked in the final PDF. The initial, intermediate, and final HTML states of the repeated-study, t-construction, p-value misconception, and null-vote sequences were recaptured and inspected.

The author rerendered and rechecked those corrected PDF pages and fragment states. No separate targeted reviewer verdict was obtained in that earlier pass.

### Fresh independent review after the 2026-08-05 instructor pass

The complete 45-slide source, approved sibling lesson, PDF, HTML, fragments, and animation were reviewed again read-only with the canonical `vision-corrector` prompt. The reviewer confirmed the core implementation was numerically correct, the hidden preparation was generally local, A/B/C were visibly distinct, orange line semantics were correct, the 500-study animation and fallback worked, H0 and alpha preceded decisions, and the PDF had no substantive clipping.

Credible findings and resolutions from this fresh pass:

- the visible `lm()` example used an unexplained object name: changed it to the already introduced `data_lokality`;
- standard-error units were mislabeled as SD: changed the title, rule, and t denominator to standard error / SE;
- residual df and the R/critical-value bridge were too implicit: added `df = 13 - 2 = 11` beside `summary()`, repeated it on the t slide, stated `df = n - 2` on the n comparison, and added a concise historical-table footer to the decision slide;
- terminology and grammar varied: changed the response term to `odezva`, corrected `invazního druhu`, and standardized the instructor-requested `chyba I./II. stupně` wording;
- the initial state of the reality-versus-observation summary showed an empty result shell: kept the first stable result visible and revealed only the additional evidence.

The reviewer also requested restoring effect rescaling, the full Sudoku/fixed-mean df scaffold, the original illustrative-area order, and the formal power block. Those changes were not applied because they conflict with explicit instructor redesign decisions; the departures are documented above under “Recorded redesign scope decisions.” This is a disposition of the findings rather than an accidental omission.

All affected slides were rerendered and visually rechecked in PDF and relevant initial/final HTML fragment states. The review browser could not load MathJax from jsDelivr while network-restricted; formulas rendered correctly in the generated PDF, so offline HTML math remains an infrastructure limitation rather than a source defect.

### Final confirmation pass after the instructor's manual edits

The instructor's final manual edits were treated as the baseline. A complete author review of the then-current 45 freshly rendered PDF pages found two defects: slide 26 had reintroduced `SD` where the quantity was a standard error, and the animated/static null-slope panels had a y-axis-title collision. The notation was corrected to `SE`; the redundant colliding y-axis title was removed while a wider left margin retained the complete tick labels. Slides 22, 23, and 26 were rerendered and visually verified.

A fresh read-only `vision-corrector` review then inspected the complete source, approved sibling lesson, final PDF, and relevant HTML states. It found two localized regressions: residual `df = 11` was computed but no longer visible on the `summary()` slide, and the invasive-species activity asked which error could be more serious without resolving that question. Slide 12 now states that R reports residual `df = 11` from 13 sites minus two estimated coefficients; slide 37 now states that relative severity depends on biological and practical consequences. Both slides were rerendered and visually checked with no clipping or crowding.

Validation after those resolutions:

- `Rscript R/render_presentation.R` completed all 105 execution steps and exported 45 slides;
- `Presentation/presentation.html` and `docs/index.html` were byte-identical by SHA-256 (`44D2EC1858B1D89B6F25C82C5DED82FB127A7C9ADB612C17B7A0F8C2A30B4D28`);
- the 45-page PDF was 18,915,663 bytes and all pages were visually inspected at full size;
- headless-browser checks covered initial, intermediate, and final states on 10 fragment-heavy slides; prompts remain visible through answer reveals and deliberately unrevealed areas retain usable composition;
- the 149-frame animation was inspected at frames 1, 75, and 149; its orange fitted line, progressive histogram, full tick labels, and static fallback are usable;
- an independent base-R calculation reproduced `n = 13`, slope `0.489530761`, SE `0.079477381`, `t = 6.159372085`, residual `df = 11`, `p = 0.000071124456`, and 95% CI `[0.314602225, 0.664459297]`;
- all 30 local figure references resolve, the source is UTF-8 without BOM or replacement characters, and focused staged and unstaged `git diff --check` checks pass;
- the approved `Learning_materials/skripta.qmd` remains unchanged.

### Final section-divider pass

On 2026-08-06 the instructor requested L01-style section dividers to improve orientation and create natural stopping points for questions or a break. Four bare first-level headings remain at the transitions from claims to the crab study and observation problem, from the study window to the null world, from p-value interpretation to decisions, and from error classification to scientific conclusion.

The first implementation of this pass also placed “Co může věda testovat?” between the outcomes and claim-classification activity. A fresh complete read-only `vision-corrector` review found that it created a one-slide section immediately followed by another divider, producing stop-start pacing rather than a genuine transition. That divider was removed. The same review found that the current source no longer displayed residual `df = 11` beside `summary()` and did not resolve the question of which error type may be more serious. The summary callback now states that R reports residual `df = 11` from 13 sites minus two coefficients, and the Type I/II reveal states that severity depends on biological and practical consequences.

The complete deck was rerendered successfully after those resolutions. The resulting PDF has 49 pages and is 18,934,102 bytes. All 49 pages were inspected using contact sheets; the four divider pages, their neighbouring transitions, and the two repaired teaching slides were also inspected at full size. The dividers have deliberate breathing space, no clipping, and clear visual continuity with the following section. `Presentation/presentation.html` and `docs/index.html` are byte-identical by SHA-256 (`9FB6B6CC627D8AA25062C56A476C2C06704942C56B69B9DA416A859D8959A50C`). No credible finding from the final independent review remains unresolved.

## Remaining uncertainty and human-review gate

- The instructor completed the manual wording, layout, pacing, and tone review and requested the final confirmation pass.
- No content or rendering blocker remains for Stage 5.
- The HTML presentation still relies on the external MathJax CDN; fully offline classroom use would require a separate shared-infrastructure decision and is not a lesson-source defect.
- Release work has not begun.

## Decision

- [x] Complete revised draft available for meaningful instructor review
- [x] HTML, PDF, and docs outputs rendered and checked
- [x] Complete PDF and relevant fragment states visually inspected
- [x] Current independent-review findings resolved
- [x] Human review completed
- [x] Presentation approved and Stage 5 finished
- [ ] Presentation PR ready
