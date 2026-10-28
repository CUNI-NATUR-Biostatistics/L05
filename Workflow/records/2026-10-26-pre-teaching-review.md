# L05 pre-teaching review (2026-10-26)

## Scope and decisions

- Trigger: after teaching L04, Ondřej Mottl requested a full review of L05 (skripta, presentation, exercise script) against the canonical instructions.
- Review: four independent read-only subagent reviews of the complete artifacts with the canonical prompts — `vision-corrector.md` for `Learning_materials/skripta.qmd` and for `Presentation/presentation.qmd` (including all 57 static PDF pages), `exercise-reviewer.md` for `Exercises/cviceni.R` (clean R 4.5.1 run and a scratchpad reference harness for all 21 tasks), and `glossary-coverage-reviewer.md` for the skripta. Model selection per `behaviour.md`: Sonnet at high effort for the three complete-artifact reviews (statistical reasoning, code edge cases), Haiku at medium effort for the bounded glossary check.
- Result: no blockers; findings ranged from statistical wording (post-hoc power box) to rule violations (named β subscripts, hardcoded derived numbers, terms used before definition, missing AI disclosures) and polish.
- Decisions by Ondřej Mottl (2026-10-26):
  - D1: the presentation keeps omitting power; the TODO at the outcomes slide is removed. The skripta keeps its power section and outcome.
  - D2: the second power scenario (true slope equal to the observed estimate) is dropped from the skripta.
  - D3: presentation tail-area colours are aligned with the skripta (p-value area orange; illustrative df-scenario tails stay purple as in the skripta df figure).
  - D4: the s19 window illustration stays where it is.
  - Scope: implement everything (fix-first, should-fix, polish) except the hidden-chunk tidyverse restyle (`data.frame`, `paste0`, `$`, `merge`, `transmute`, `stats::` prefixes stay).
  - Provenance: the claim images (`tvrzeni_labute.png`, `tvrzeni_holub_stehovavy.png`, `tvrzeni_nejkrasnejsi_ptak.png`) and the pregnancy-test images are AI-generated; tool, prompt and date are not recorded.
- Branch: `fix/l05-pre-teaching-review`, created from clean `main` with the user's authorisation. No commits, pushes or PRs were made.

## Changes

### Learning materials

- Second power scenario box, its simulation and objects removed; the 0,25 scenario is unchanged (4 060 of 5 000, 81,2 %).
- Coefficient notation switched to `\beta_1` / `\hat{\beta}_1` with one sentence linking `\beta_1` to the R row `zemepisna_sirka` and `\beta_0` to `(Intercept)` (terminology rule of 2026-10-21); the number of coefficients is now `k`, so it no longer collides with the p-value.
- Derived numbers computed inline: column count, coefficient count, df formula and table, critical-value table row, α and its percentages, the leave-one-out sign claim. Repeated teaching inputs are named once (`pocet_ukazek`, `t_ilustracni`, `df_maly`, `df_velky`, `alfa_prisna`, `pocet_opakovani_ilustrace`).
- Decision rule worded as p ≤ α throughout; reporting examples use "p < 0,001".
- Narrative: the biological-importance verdict that preceded its own question is removed; a forward reference explains the interval–test equivalence; the `qt()` passage explains 0,975 and reads the printed output; the bridge to L06 now lists uncertainty before biological meaning, matching the conclusion section and the deck.
- Glossary: new first-occurrence wrappers (`testova-statistika`, `parametry-modelu`, `intercept`), two wrappers moved to new first occurrences.
- Code: named arguments in the optional data-preparation chunks; chunk options on `tabulka-pro-vypocet-t`; model, coefficient extraction and `pocet_lokalit` moved next to first use; `R/Functions/simulovat_odhaleni_sklonu.R` gained a header, roxygen, `cli` validation and `purrr::map_lgl()` with identical seeded output.
- Pregnancy-test figure caption carries "Ilustrace vytvořená pomocí AI."

### Presentation

- TODO about a power slide removed (D1).
- First use: visible explanation of `|t|`, "chvosty rozdělení" (s34) and "stupně volnosti (df)" (s36); s42 glosses the false alarm instead of using "chyba I. typu" before s45.
- s18 table uses `t value` / `Pr(>|t|)`, highlights the slope's t and p cells, and s33/s34 refer back to them.
- α assigned once as `alfa` on s42 and used inline everywhere.
- Colour roles: s22 panels match the figure; simulated estimates indigo, orange reserved for the observed slope; dashed reference graphite throughout; visible line key on s21/s28; p-value area orange (D3).
- Composition fixes on s17, s26, s34, s41, s42, s44, s46, s52; s51 and s37 changed silhouette, s23 gained a visible prompt; slide count unchanged (57 static).
- Wording: "při stejném |t|" (s36), "p < 0,001" (s50/s51), one conclusion order on s48, s51 and s56.
- Decimal commas on plot axes via the hidden-chunk `OutDec` hook; MCQ option lengths balanced on s26 and s37 (keys unchanged); Czech `fig-alt` for every figure chunk; "(pokud je vložena)" removed from notes.
- AI disclosures on s2 (standard wording), s4 and s45; `Presentation/Materials/GENERATED_IMAGES.md` records the claim montage and updates the pregnancy-test entry.
- Deleted unreferenced images: `sila_testu.png`, `okno_studie.png`, `dvacet_nulovych_studii.png`, `nulove_sklony.png`, `nulove_sklony_bez_pozorovani.png`, `stejna_realita_jina_pozorovani.png` (`krabi_titulni_ilustrace.png` kept as the documented alternative).
- The story-map headings are unchanged; the s43 heading is now inline R that renders the same text.

### Exercise

- See the revision section in `2026-09-22-exercise-blueprint.md`: assumptions and independence before U03, observational study before U08, site as observational unit before U05, project reopen line and preflight hint, new `Nápověda 1` for U05 and U08, U08 asks for 6–8 sentences, N11/N12 notes moved above their headings, long lines re-wrapped.

### Generated and synced files

- The project render route synced `theme/` from `_brand`: `theme/presentation_components.scss` gained `.quiz-question > h2` sizing (which also fixes the s6–s8 answer box colliding with the slide number) and `theme/brand_manifest.json` records the new fingerprints; `theme/semantic-boxes.lua`, `R/Functions/render_glossary_term.R` and `R/Functions/render_presentation_outputs.R` differ only in line endings.
- `Learning_materials/skripta.{html,pdf}`, `Presentation/presentation.{html,pdf}`, regenerated figures in `Presentation/Materials/` and `docs/index.html` are render outputs.

## Validation

- Skripta: project render passes (41-page PDF); slope 0,490, SE 0,0795, t ≈ 6,16, df = 11, p = 0,000071, critical value 2,201 and 81,2 % unchanged; changed pages inspected as images; optional data-preparation code reproduces `data/pie_crab_site_means.csv` exactly; UTF-8, CRLF.
- Presentation: project render passes in PollsLive offline mode (57 static pages); all pages inspected as contact sheets and changed slides at full size; fragment states of changed fragment slides inspected from a DeckTape fragment print; displayed numbers unchanged apart from the intended "p < 0,001" and inline 5 %; `pollslive/quiz.json` checksum unchanged; UTF-8, CRLF.
- Exercise: parse OK, UTF-8 without BOM, CRLF, only the URL line exceeds 80 characters; the unfilled script sources cleanly in a mirrored `L05_praktikum` folder under R 4.5.1; the missing-file message is correct; task code and expected results unchanged.
- Independent verification: the same reviewers re-checked the corrections. Exercise: all six findings resolved, ready for human review. Skripta: all findings resolved, no new problems. Glossary: no new findings, all 100 wrappers have valid slugs. Presentation: every finding resolved, partly resolved with a LOW remainder, or settled by the decisions; 57 static slides with unchanged headings and dividers; offline quiz fallback slides correct; no new statistical, first-use, colour, alt-text or disclosure defects; verdict "ready to teach". LOW remainders: empty lower areas on s17, s18, s42, s44 and s46; s34 strip taller than its card; s52 image close to the card above; s4 blank right strip; the s34 p-value area is orange while the s35/s36 df-scenario tails stay purple (consequence of D3); mixed minus signs in the s43 mirror label.

## Open items

- `Presentation/presentation.html` and `docs/index.html` currently contain the offline PollsLive variant (no live QR), because sync mode needs a git upstream for the branch. A sync render after push is required before release.
- The live `/L05/current/` release predates the 2026-10-21 and 2026-10-26 changes; a new release is needed before teaching.
- Human approval of the revised exercise wording is required before release (`exercises.md`).
- Outside this repository: the stray ": " after "SPRÁVNÁ ODPOVĚĎ" on the PollsLive fallback slides comes from the shared `_pollslive`/`_brand` layout; `_internal/osnova_lekci.md` still says "chyba I. a II. druhu".
- Every R run warns that the project `renv` library is out of sync; this predates the review.
- Not verified: the live HTML QR and results slides, GIF motion beyond its first and last frames, the exercise in the RStudio GUI with beginners.

## Revision 2026-10-27 (instructor comments on the skripta)

### Decisions by Ondřej Mottl (2026-10-27)

- "Síla testu" is removed from L05 completely (supersedes D1/D2): learning outcome, the two power sections, the summary bullet and `R/Functions/simulovat_odhaleni_sklonu.R` are gone. The key idea that not rejecting H0 does not prove a zero effect stays in the Type II error paragraph.
- L05 keeps the $a$/$b$ notation of L03 instead of $\beta$; the population slope is written in words. Recorded in `_internal/.ai/authoring/terminology.md`.
- `qt()`/`pt()` are not needed by students; the calculation moved into a collapsed "Doplňující" box and the main route reads `summary()`.

### Changes (2026-10-27)

- Intro: the lesson announces its more philosophical framing; **statistický test** is introduced before use; the null-world section links back to it.
- Data-preparation code merged into one optional box (four optional boxes became two).
- Standing practices from earlier lessons now applied: 95% confidence band around the line (L04) with optional `predict()` code, residual histogram instead of a density (L03), Q–Q plot (L03), Cook's distance with 4/n and `dfbeta()` leave-one-out comparison (L03/L04) in a new subsection "Nestojí přímka na jedné lokalitě?".
- Null world: skeptic's objection in a box, longer intro to imagining and simulating a zero-slope world, systematic vs random part, simulated residuals explained as standing for natural processes, residual standard deviation re-explained, "možnost" → "scénář", bold **je**/**není**.
- Degrees of freedom defined in bold (with df) before the Sudoku; the t-distribution section starts with a recap of the observed t and links the simulated histogram to the t-curve; "referenční rozdělení" defined; facet labels and caption name each df.
- Every question box now has an answer box (the framing "Hlavní biologická otázka" excepted, as in L04); the "Spočítejte t" task, which repeated the worked example, became a what-if task.
- p-value figure and text state that the tail area is tiny and practically invisible; line roles aligned across the three t-figures (curve graphite; illustrative/critical tails and boundaries amethyst dashed; observed t orange solid, mirror orange dashed).
- Newly defined terms are bold at their defining sentence; Anna/Boris/Cyril quotes in a box; critical-value row "11 (krabí model)"; `qt()` comment explains `1 - 0.05 / 2`; summary() stars, R² and F-statistic explicitly set aside.

### Validation (2026-10-27)

- Project render passes (HTML and a 49-page PDF, no fenced-div warnings); all pages inspected as contact sheets, changed pages at higher resolution; UTF-8, CRLF.
- Independent read-only reviews: `vision-corrector.md` brief focused on knowledge and instruction leakage (Sonnet, high effort) and `glossary-coverage-reviewer.md` (Haiku, medium effort). Instruction leakage: none found in visible text. Knowledge-leakage and glossary findings were applied (wrong "minulá lekce" reference for the histogram, unexplained `dfbeta()`, answer shown before its task, undefined "referenční rozdělení", summary() leftovers, untaught terms in the conclusion table, missing first-use wrappers). Not applied: page-break protection for five box titles stranded at page bottoms (cosmetic, positions change with every edit).
- `_internal/R/check_prior_practices.R L05` (new) reports the skripta clean; remaining `missing` rows concern the presentation and the exercise (see open items).
- An edit script briefly removed all blank lines from `skripta.qmd`; the file was restored from a complete pre-damage snapshot and checked line by line before further edits.

### Open items (2026-10-27)

- Exercise U06 (and N05) still teaches `pt()`; with `qt()`/`pt()` now optional in the skripta, decide whether U06 should read `Pr(>|t|)` from `summary()` instead.
- Presentation and exercise do not yet show the confidence band or Cook's distance (prior-practice check); the deck also lacks the residual histogram and Q–Q plot.
- Moodle bank (`_internal/moodle`): family `sila` (2 variants) and the `L05.sila-*` knowledge concepts must be removed; family `kriticka-hodnota` asks students to read `qt(p = 0.975, …)` output and the drag-drop item mentions `qt()`; knowledge notation uses $\beta$.
- L06 skripta ("V lekcích o nejistotě a testování hypotéz jsme … používali β") and L10 skripta ("jsme v lekci o testování nazvali síla testu") now refer back to things L05 no longer does; both repositories have unrelated uncommitted changes, so they were not edited.

## Revision 2026-10-28 (decisions on the open items)

### Decisions by Ondřej Mottl (2026-10-28)

- D1: exercise U06 reads the p-value from `summary()` (`Pr(>|t|)`) instead of computing it with `pt()`.
- D2: add the confidence band, Cook's distance, residual histogram and Q–Q plot to the presentation and the exercise.
- D3: update the Moodle bank (remove power, remove `qt()` from what students must read, a/b notation).
- D4: fix the L06 and L10 back-references on new branches, without rendering.

### Changes (2026-10-28)

- Exercise: U03 adds a Q–Q plot and Cook's distance with 4/n (logical indexing, `type = "h"` and Plots-panel navigation explained before the task); a worked example before U04 draws the confidence band and U04 step 4 uses it; U06 reads `Pr(>|t|)`; `pt()` now has its own worked example before optional N05; U08 and N12 use the U03 influence result. Reviewer findings 2–8 applied.
- Presentation: model figure with the 95% band; residual panel shows histogram, Q–Q plot and residuals vs fitted; new slide "Nestojí přímka na jedné lokalitě?" (Cook's distance, 4/n, leave-one-out slopes 0,43–0,56 mm/°); slope panel states the effect in words.
- Skripta: one clause links $b$ to the $\hat{\beta}_1$ used in the L04 formulas.
- Moodle (`_internal/moodle`): family `sila` removed; `qt()`/`pt()` output replaced by critical-value tables in `t-graf`, `kriticka-hodnota` and `t-rozdeleni-df`; β replaced by $b$ and "sklon v populaci"; knowledge file rebuilt from the working tree (qt/pt as extension, Q–Q and Cook's distance promoted to core); 73 questions (U1 20, U2 45, U3 8).
- L06 (`fix/l06-coefficient-notation-reference`) and L10 (`fix/l10-define-test-power`): one-line back-reference fixes.

### Validation (2026-10-28)

- Exercise sourced from a clean R session in a temporary project; reference solutions for U01–U06, N05 and N12 reproduce every expected value. Independent review with `exercise-reviewer.md` (Sonnet, medium effort): no factual errors; findings 2–8 applied; finding 1 (timing) open.
- Presentation rendered in PollsLive offline mode (the branch has no upstream, so sync mode fails); changed slides inspected.
- Skripta re-rendered (49 pages).
- `check_prior_practices.R L05`: only `show_groups_in_plot` for the exercise remains, a false positive (the data have no groups).
- Moodle: `check_knowledge_file.R L05` OK; `build_moodle_xml.R L05` writes 73 questions; locked-selection warnings remain for eight families.

### Open items (2026-10-28)

- Core exercise timing is now estimated at 95–110 min against the 85–95 min budget (U03 +8–12 min, U04 +5 min); decide whether to shorten the core or accept and record a new budget.
- Moodle: re-review `t-graf`, `kriticka-hodnota`, `t-rozdeleni-df` and `h0-zapis` (changed in substance; locked selections kept); L06 `ci-rozdilu` still uses `L05.qt-pt`; L06 knowledge duplicates the Q–Q promotions now made in L05.
- Glossary `sila-testu` defines power as "1 − β", which students meet in L10 without β as a type II error rate.
- Presentation needs a synchronized PollsLive render once the branch is pushed.
