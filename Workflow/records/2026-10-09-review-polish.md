# L05 review polish (2026-10-09)

## Scope and approval

- Trigger: full review of `Learning_materials/skripta.qmd`, `Presentation/presentation.qmd`, and `Exercises/cviceni.R` against the canonical guidance and against L02–L04 (L09 for the exercise).
- Decision: Ondřej Mottl approved all review edits on 2026-10-09 ("I agree with the edits. Go and fix it.").
- Terminology decision by Ondřej Mottl on 2026-10-09: the Czech standard is **chyba I. typu / chyba II. typu**. This replaces the earlier presentation wording "chyba I./II. stupně" (recorded in `2026-08-03-stage-4-5-presentation.md`) and the learning-material wording "chyba I./II. druhu". Recorded as a course-wide term in `_internal/.ai/authoring/terminology.md`; the L06 retrieval quiz was updated on branch `polish/l05-error-terms`.
- Explicitly retained earlier decisions: the presentation still omits the Sudoku/fixed-mean df scaffold and the numerical power block (`2026-08-03-stage-4-5-presentation.md`, line 171). The 2026-10-08 publication exception covered the previously missing title illustration; a lesson-derived title composite is now integrated as documented below.

## Changes

### Shared across artifacts

- Error terms unified to "chyba I./II. typu".
- Semantic colours aligned with the brand and with L04: data grey, model purple, interpretive focus orange (learning-material scatter, residual plot, null-study figures; presentation repeated-observation figure).
- Czech decimal commas in the learning materials through `format_cz()`, `format_cz_math()`, and the hidden-chunk `OutDec` hook copied from L04; presentation display maths uses `format_cz_math()`.
- Hand-entered data-derived values replaced by computed objects (df table, figure alt text, simulation counts, illustrative scenario values, site counts).
- H0 wording on the presentation slide corrected: H0 states a zero systematic linear slope, not that sites do not differ; H_A added.

### Learning materials

- Opening and ending aligned with L02–L04: `Úvod` with a bridge from the previous lesson, `Výsledky učení` covering all five syllabus outcomes, `Co bude následovat dál`, `Shrnutí`, and `Závěrečná otázka` with a folded answer.
- New visible data check (`read.csv()`, `str()`, `summary()`, missing-value count, computed range prose) before the first model; the model chunk now reuses `data_lokality`.
- Folded answers added to six questions that previously had no self-study answer.
- Power section transitions merged; the simulation chunk now precedes its prose, uses the helper `R/Functions/simulovat_odhaleni_sklonu.R`, and `set.seed(900723)` with the same draws for both scenarios. The illustrative power changed from 81.5 % to 81.2 % with the new seed.
- "Statisticky významný" no longer appears before its definition; workflow-sequencing phrases removed; β0 replaced by an explicit zero null value with β̂ notation; `null value` translated; box titles use "Doplňující:"; alt text added to every figure; glossary TODO comments added for missing slugs (alternativní hypotéza, t-statistika, statisticky významný, síla testu).
- Visible code uses named arguments, vertical calls, and project-relative paths.

### Presentation

- Lesson-specific `l05_presentation.css`, all `.balance-*` and other one-off classes, raw `<div>` markup, and inline `style=` attributes removed; layouts rebuilt with brand components (`.slide-margin-top-15`, `.panel-*`, `.layout-grid-2`, `.layout-stack`). Non-existent classes replaced with existing ones. The claims grid uses a square crop of the Moon illustration generated on its slide.
- Opening order: hook → Moon question → claims → PollsLive retrieval → interval bridge → `Výsledky učení`.
- Formulaic "Když nehlasujeme" fallback replaced by a partner-convince prompt; sequencing words removed from visible copy.
- New `# Závěr` divider, `Co bude následovat dál`, `Shrnutí`, and a closing question matching the L02–L04 pattern.
- Speaker notes added to every content slide (previously none); alt text added to photos and error illustrations.
- Grammar fixes ("3 lokality", "krajních 5 %").

### Exercise

- Restructured to the L09 layout: separate setup sections, runnable worked examples (data load and inspection, scatter plot, `pt()`), numbered `Zadání` steps, separate `Očekávaný výsledek`, `Nápověda 1`, `Nápověda 2`, and `Interpretace` blocks, about 75-character comment lines.
- Setup now follows the real distribution route (download both files, then New Project > Existing Directory).
- Hints rewritten so that they no longer give the conceptual answer; new functions (`abline()`, `abs()`, `which.max()`, `unique()`, `!=`) are introduced before use; out-of-scope `weights` reference removed; lesson codes removed from prose.
- Task IDs U01–U08 and N01–N13 unchanged.

## Validation

- Learning materials: rendered HTML and PDF with `R/render_skripta.R`; no errors. Spot-checked rendered numbers and the data-check, power, and closing pages.
- Presentation at the initial review: a synchronized render was not run because it requires pushed PollsLive inputs and dispatches the trusted workflow; offline mode was unavailable without a cached client. A validation render through `prepare_presentation_variant()` with the static quiz include and a temporary output name completed without errors; a DeckTape PDF of all 57 slides was inspected visually and the problem slides re-checked after fixes. The tracked presentation outputs were subsequently regenerated in offline mode during image integration, as documented below.
- Exercise: sourced from a clean `--vanilla` R session in a temporary project folder; every expected result checked in an untracked reference harness.
- L06: `node pollslive/validate.mjs` passed.
- The render also refreshed the lesson theme cache from the clean, pushed `_brand` main (`028b292`).

## Independent review (2026-10-09)

Three separate read-only reviewer subagents ran after the polish: `vision-corrector.md` (learning materials, plus the glossary-coverage pass), `vision-corrector.md` (presentation, with full-canvas inspection of a DeckTape export of the final fragment states), and `exercise-reviewer.md` (exercise, including a clean-session run and a reference harness in a scratch folder). None of the three marked its artifact review-ready. The following credible findings were resolved:

- Learning materials:
  - the remaining hardcoded site counts ("třináct") were removed;
  - the t, df, p and effect-scaling objects were moved next to their first use, with the rescaling difference named `rozdil_stupnu`;
  - colour roles were made consistent: α region purple, p-value area orange, zero reference graphite dashed;
  - `format_cz()` and `format_cz_math()` now keep the requested decimals, and t uses one precision;
  - the duplicated sentences were removed; "reziduální" is now spelled consistently; the subscript $\beta_{\text{zem. šířka}}$ is unambiguous;
  - the broken sentence, the "škrtněte" wording and "p-výsledku" were fixed; the leave-one-out claim is now computed;
  - visible objects are prefixed and chunk options made explicit;
  - missed glossary first occurrences were added and redundant repeat wrappers removed.
- Presentation:
  - each object is now assigned on the slide that first uses it (s32–s34), and the unused object was removed;
  - the s37 distractor no longer names the null hypothesis before it is introduced;
  - colour roles were unified across s29–s36, together with the outcome and summary highlights;
  - s34 now names the t distribution, states its total area, shows the crab p-value and reveals the definition as a fragment;
  - the df caption on s35 was replaced;
  - the animation-frame label collisions (s29/s30) came from a showtext DPI mismatch and are fixed;
  - s49 label placement and vertical balance on s17 and s20 were fixed;
  - the MCQ annotations now sit on the option text;
  - a biological-meaning line was added on s51 and a severity line on s46;
  - the outcomes are cut to five;
  - speaker-note accuracy and wording polish were fixed.
- Exercise:
  - e-notation of small p-values is explained;
  - the reference-distribution wording was corrected;
  - the U08 expected result now matches its required order;
  - hints that gave complete calls were reduced, and `level` is introduced in the N07 task;
  - N12 names its new model, and optional tasks warn against overwriting main objects;
  - the N10 duplicate was reworked;
  - "hladina významnosti" is now used, named arguments are used in code references, the reassurance line was removed, and the download-move instruction was added.

Decisions by Ondřej Mottl on 2026-10-09:

- Exercise U01: students again load the CSV themselves in U01, which preserves the condition of the 2026-09-22 exercise approval. The preparation block only checks that the file exists. Because of this, the U02 plot example became commented code, and the L09 instruction for uncommenting was added.
- Power box: reframed as a second pre-chosen scenario, with an explicit caveat that it is not the power of the completed study.
- Story maps: Ondřej Mottl explicitly approved the learning-materials and presentation amendments and their knowledge-state ledgers on 2026-10-09, with no requested revisions; approval evidence and chronology are recorded separately for each artifact in `2026-10-09-story-map-amendment.md`.

## Course-owner feedback on the rendered deck (2026-10-09)

- Slide 31: the observed slope is orange in both panels, as requested. The reviewer had suggested purple; the course owner decided on orange.
- Learning materials: a new optional box, "Doplňující: proč se mluví o t-testu", follows the `summary()` readout. It says that the slope test is a t-test and that the two-group t-test may come later in the course.
- Lesson illustration series: L05 initially lacked the in-deck AI series used in L04. Proposed placements (slides 19, 32, 39, 41, optional 52), prompts using the brand palette, and the title-image brief were recorded in `Presentation/Materials/GENERATED_IMAGES.md`; the images are now generated and integrated as documented below. The series is now a canonical requirement and a review check (`_internal/.ai/authoring/presentation.md`, `review-checklist.md`, `vision-corrector.md`, `lesson-workflow.md` item 46).
- Reserved illustration slots: slides 19, 32, 39, 41 and 52 now call `include_optional_figure()` (`R/Functions/include_optional_figure.R`, with the disclosure helper `R/Functions/ai_disclosure.R`) with the file names from `GENERATED_IMAGES.md`. An image appears automatically once its file is saved in `Presentation/Materials/`. Until then, slides 19 and 39 show their previous figure and the others leave the space empty. Ondřej Mottl decided on 2026-10-09 that the record plus reserved slots satisfy the requirement, and that reviews must list images not yet generated as open items; the canonical guidance was updated accordingly.

## Generated illustrations and layout validation (2026-10-09)

- Ondřej Mottl requested generation from `Presentation/Materials/GENERATED_IMAGES.md`, a title composite using the new illustrations and lesson figures, and correction of the image placement on "Je naměřený vztah realita?".
- Five in-deck illustrations are integrated on slides 19, 32, 39, 41 and 52. `krabi_titulni_kompozice.png` is the selected title image; `krabi_titulni_ilustrace.png` is retained as a documented alternative. Exact prompts, reference assets, reuse terms, AI disclosure, alt text and SHA-256 hashes are in `GENERATED_IMAGES.md`.
- Slide 19 now uses a 36% image column with the image at full column width, a 60% question column centred vertically, and a caption directly below the image. The slide 39 illustration is reduced to 80% width; the trap illustration on slide 41 occupies the middle column of a 31/36/31 layout.
- The canonical presentation wrapper completed an offline HTML and static PDF render using `BIOSTAT_POLLSLIVE_CLIENT_SOURCE` pointed at local `_internal` revision `1057461322ef702c5866800893ea235ed49a8cc6`. This was an explicit local development override, not a synchronized render using the pinned client `8f85e9f9e31dc1b0f05912d5605e4c9cc557e8e6`.
- The render retained the existing canonical theme cache, regenerated the presentation figures, and updated `Presentation/presentation.html`, `Presentation/presentation.pdf` and `docs/index.html`. The two HTML files are byte-identical; the PDF has 57 pages.
- All seven new AI PNGs were opened and their hashes checked against the provenance record. The affected slides (1, 19, 32, 39, 41 and 52) were inspected in HTML and PDF. Slide 19 was additionally checked at 1600×900 and 1280×720 without overlaps or content extending outside the slide. Focused source checks passed for UTF-8, unique chunk labels and whitespace. QA evidence remains in ignored `Temp/image-qa/`.
- Both story-map amendments and knowledge-state ledgers now have explicit human approval. This approval does not replace final artifact review or release validation; the earlier independent reviews and subsequent fixes remain recorded above.

## Synchronized presentation render (2026-10-09)

- After the five polish commits, the first synchronized-render attempt stopped at the missing-upstream guard without replacing final outputs. Ondřej Mottl then pushed `polish/l05-review-fixes`; the retry used the configured upstream `origin/polish/l05-review-fixes` and pinned client `8f85e9f9e31dc1b0f05912d5605e4c9cc557e8e6`, without a local client override.
- Trusted synchronization workflow run `37918659121` succeeded for request `611b471a-8e16-4f9d-9a8f-3c5a543840af` and immutable L05 source revision `511c60f3129bbbde053f3d3e0f6c945b32a004ff`. The receipt records input checksum `e1ff9daee3a3a40294876c9e802c5e343b1ff61ca0c0f64a803271df1fc9d97d`, definition checksum `656e7f8ab845b497ea15c9aff3aba1b5a1660243d4ff2a240671e0379a0fd8d8`, and remote-content checksum `23a4886b0a8e591cc409d39ed08cbed6d71d786ea1ff2be674761e0d1709d908`.
- The canonical presentation wrapper completed both HTML variants and the DeckTape PDF export. The synchronized live HTML has 58 slides; the static PDF has 57 pages. `Presentation/presentation.html` and `docs/index.html` are byte-identical, and the PDF contains no PollsLive URL.
- The title composite and the reality-slide layout were visually checked in the final HTML and PDF. All six illustrated PDF slides retain an image and visible AI disclosure. QA reports, screenshots and the render log are in ignored `Temp/image-qa/` (`sync-html-report.json`, `sync-pdf-report.json`, `sync-html-*.png`, `sync-pdf-*.png`, `render-sync-after-push.log`).
- The synchronized receipt confirms the poll is published, voting is closed, and public results are hidden. No response was submitted. This render does not constitute a stable release or final artifact-review approval.

## Remaining gates

- L06 quiz re-approval and re-synchronization for the changed answer labels remain outside this L05 render task.
- Glossary slugs for the TODO terms do not yet exist in `slovnik`.
