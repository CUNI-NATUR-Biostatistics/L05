# Stage 6 — Critical-value visualization release fix

## Metadata

- Week: L05
- Stage: Stage 6 release validation
- Date: 2026-08-07
- Status: in review
- Author: Ondřej Mottl with Codex
- Human reviewer: Ondřej Mottl
- Independent reviewers: read-only internal vision and glossary reviews

## Git checkpoint

- Branch: `fix/l05-critical-value-visualization`
- Exact base commit: `cbeeaf7dc8be995ba8f8feb1f21cc0cf95439c03`
- Base subject: `Build L05 presentation around reality, observation, and hypothesis testing (#3)`
- Branch created from clean `main`: yes
- Pull request: not opened
- Codex did not stage, commit, push, or publish changes.

## Reason for the release fix

While aligning L06 with the hypothesis-testing material, the instructor requested that L05 also show the critical value directly in the t-distribution. The existing L05 material explained alpha, the observed t-statistic, the two-sided p-value, and the critical-value table, but it did not place all four ideas in one visual reference.

This is a focused post-approval correction. The approved L05 story, examples, terminology, and slide order remain unchanged apart from the inserted visual bridge.

## Implemented change

### Written materials

The `Kritické hodnoty` subsection now contains a t-distribution figure for the crab model with `df = 11`:

- purple shaded tails and dashed critical boundaries at approximately `-2.201` and `+2.201`;
- the observed `t = +6.159` as a solid orange boundary;
- the mirrored `t = -6.159` as a dashed orange boundary for the two-sided p-value;
- direct labels, a caption, Czech alternative text, and prose linking `|t| > t_crit` to `p <= alpha`.

Only the positive orange value is described as observed. The negative orange value is explicitly identified as its mirrored comparison boundary.

### Presentation

A new slide, `Kde začínají krajní 5 % nulového světa?`, now sits between the alpha slide and the decision rule. It uses the same colour and line semantics as the written figure and explicitly states that the critical limits `±2.20` apply for `df = 11`.

The source-generated figure is saved as `Presentation/Materials/kriticke_hodnoty_t.png`. The display chunk contains Czech alternative text.

## Validation

- `Rscript R/render_skripta.R`: successful.
- `Learning_materials/skripta.pdf`: 38 pages.
- `Rscript R/render_presentation.R`: successful; 50 slides printed.
- `Presentation/presentation.pdf`: 50 pages.
- `Presentation/presentation.html` and `docs/index.html`: byte-identical SHA-256 `9595CDE6E134D003D5426585762EF0F1B721953F7F10BA9B7D2D0F3D42DC7D85`.
- Complete contact-sheet inspection: all 38 written pages and all 50 slides checked for clipping, overlap, and unintended pagination changes.
- Targeted full-size inspection: written pages 28–30 and presentation slides 37–39 checked; the final revised slide 38 was inspected again after adding `df = 11`.
- Focused `git diff --check`: passed.
- Both QMD sources remain UTF-8 without BOM or replacement characters.
- Renderer-only changes to `Learning_materials/skripta_theme.typ` and `theme/brand_manifest.json` were restored to the branch baseline.

The render wrapper still reports the pre-existing `renv` status in which several installed and recorded packages are unused. No used dependency is missing, `renv.lock` is unchanged, and no snapshot was taken as part of this focused fix.

## Independent review

The complete current written materials and presentation were assigned read-only to separate internal reviewers.

The vision reviewer verified the numerical values and semantic mapping, then requested two localized changes: state that the slide's `±2.20` boundary is for `df = 11`, and add Czech figure alternative text to both artifacts. Both changes were applied, rerendered, visually checked, and independently rechecked. The final verdict is pass with no remaining findings.

The glossary reviewer found no new glossary regression in the critical-value prose or caption and confirmed that all existing glossary slugs are valid. Its strict complete-artifact audit also identified pre-existing lesson-wide wrapper debt: six heading-first occurrences, four duplicate wrappers, and two likely omissions in the concluding section. Those findings are outside this focused release fix and remain recorded for a separate glossary-cleanup decision rather than being mixed into the statistical visual change.

## Decision

- [x] Focused critical-value correction implemented in both artifacts
- [x] HTML and PDF outputs regenerated
- [x] Complete visual QA completed
- [x] Independent vision-review findings resolved and rechecked
- [x] New prose checked for glossary regression
- [ ] Human review completed
- [ ] Release-fix pull request ready
