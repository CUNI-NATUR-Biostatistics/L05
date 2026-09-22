# L05 exercise blueprint

## Status and teaching boundary

- Date: 2026-09-22
- Branch: lesson/l05-exercises, created from clean main after the presentation and release work merged
- Source: approved L05 written lesson and presentation, _internal/osnova_lekci.md, and L04 practical
- Human exercise approval: pending
- Independent exercise review: full review and focused U01/U02 re-review found no findings

The 90-minute practical has a 68-minute direct-work core: 12 minutes for project and file preparation, then 56 minutes for U01–U08. This leaves about 22 minutes for discussion and slower groups. The script is a student worksheet for classroom and self-study use. Presentation-to-demo rhythm and teaching cues remain here.

## Outcomes, prerequisites, starting states, and timing

| Segment | Purpose and approved L05 outcome | Starting state and knowledge | Direct work |
| --- | --- | --- | ---: |
| Preparation | Create RStudio Project, obtain script and site-means CSV, use project-relative paths. | RStudio, browser, public release routes; L04 Project steps may be recalled. | 12 min |
| L05-U01 | Student loads site-means CSV, checks observational unit, variables and completeness, and evaluates a testable claim; outcome 1. | Open project; downloaded CSV and soubor_lokality preflight; L04 read.csv(), head(), nrow(), range(), is.na(). | 7 min |
| L05-U02 | Student fits familiar site-level model, graphs points and line, and interprets slope in mm/degree and across 5 degrees; outcome 2. | Student-created data_lokality from U01; generic commented lm() template; L03 lm(), plot(), abline(), coef(). | 9 min |
| L05-U03 | Residual versus fitted graph and histogram; model limitation; outcome 5. | Student-created mod_krabi from U02; L04 fitted(), resid(), hist(). | 6 min |
| L05-U04 | Student runs summary() and confint(), then interprets estimate, SE, CI and hypothetical substantive threshold; outcome 2. | Student-created mod_krabi; L04 summary(), confint(); threshold 2 mm over 5 degrees given in task. | 7 min |
| L05-U05 | H0/HA about population slope; t as distance in SE, residual df; outcomes 1 and 3. | U04 quantities; explanation of t and n-2 immediately before task. | 8 min |
| L05-U06 | Two-sided p, alpha decision, CI consistency and conditional interpretation; outcome 3. | U05 t and df; worked pt(q = -2, df = 11); alpha 0.05 stated before task. | 7 min |
| L05-U07 | Type I and II errors in crab question; outcome 4. | U05 hypotheses and U06 decision; definitions immediately before task. | 5 min |
| L05-U08 | Full question-to-conclusion workflow with limitations; outcome 5. | Results of U01–U07 and limitation paragraph immediately before task. | 7 min |

The L04 refresher is skippable when students already know lm(), slope, SE, confidence intervals, and residual plots. Project and file setup is permanent because the lesson needs a local CSV.

## Dataset, dependencies, and scientific boundaries

- Main input is data/pie_crab_site_means.csv from the approved CC0 teaching sample. Each of 13 rows is a salt-marsh site; response is mean male carapace width in mm, predictor is latitude in degrees. The model is the same unweighted simple regression as the approved lesson.
- data/pie_crab.csv contains 392 individual crabs and is needed only for optional N09. It demonstrates why 392 measurements do not become 392 independent site-level responses.
- The script uses base R only. It does not install or attach packages, alter the working directory, depend on hidden objects, or require the optional CSV for sourcing.
- Expected main values: slope 0.4895308 mm/degree; 5-degree difference 2.4476538 mm; SE 0.07947738; 95% CI [0.3146022, 0.6644593]; t 6.159372; df 11; two-sided p 0.00007112446. The 5-degree interval is approximately [1.573, 3.322] mm.
- The 2 mm over 5 degrees benchmark is explicitly hypothetical, not an established biological threshold. The interval spans it, so students cannot claim this dataset establishes that threshold.
- Limitations: observational design, possible spatial similarity of nearby sites, unequal precision of site means (25–37 crabs per site), and influence of individual sites. The script must not imply causality or treat residual inspection as proof of model assumptions.
- Outside scope: categorical predictors, two-group tests, ANOVA, formal power analysis, coefficient-SE derivation, Bayesian hypothesis probabilities, and individual-level inferential models.

## Optional practice

The bank is deliberately broader than one practical. Students may select independent tasks after the core. N09 alone needs the optional individual-crab CSV.

| Task | Purpose and exact starting state | Estimated work |
| --- | --- | ---: |
| L05-N01 | Separate testability, plausibility and value judgement; uses only the three supplied claims. | 5 min |
| L05-N02 | Convert site-model slope and 95% CI to 10 degrees and compare with the stated hypothetical 3 mm threshold; mod_krabi. | 6 min |
| L05-N03 | Distinguish intercept from slope and avoid extrapolating to 0 degrees; mod_krabi and data_lokality. | 5 min |
| L05-N04 | Apply n-2 to 8 and 20 independent sites; formula and sample sizes in task. | 4 min |
| L05-N05 | Compare two-sided t-tail areas at fixed illustrative absolute t = 2 for df 11 and 30; pt() example in core. | 7 min |
| L05-N06 | Compare the same crab p-value to alpha 0.01 and 0.00001; U06 result. | 4 min |
| L05-N07 | Compare 90%, 95% and 99% slope intervals; mod_krabi and U04 result. | 6 min |
| L05-N08 | Apply Type I/II distinctions to monitoring consequences; U07 definitions. | 6 min |
| L05-N09 | Load optional individual CSV, count 392 crabs and 13 sites, distinguish analysis units; data_lokality and downloaded CSV. | 7 min |
| L05-N10 | Compare 25–37 observations per site and unweighted-model limitation; data_lokality. | 5 min |
| L05-N11 | Find the largest absolute residual (VCR, about +1.87 mm); mod_krabi and data_lokality. | 7 min |
| L05-N12 | Omit southern site GTM, refit and compare slopes without causal claims; data_lokality and mod_krabi. | 9 min |
| L05-N13 | Correct three p-value, importance and causality misconceptions; U04, U06 and U08. | 6 min |

Estimated optional bank: about 77 minutes. It is not a completion target for the 90-minute practical.

## Facilitation and validation gates

Teachers may connect the L04 refresher to U04, ask students to predict the direction of the line before U02, contrast the 2 mm substantive benchmark with the exact-zero H0 before U05, and ask for a plain-language p-value statement before U06. These cues remain outside the public script.

Before human review: parse and check UTF-8 without BOM; run the unfilled script from a clean session in a temporary project; solve all 21 tasks in an untracked reference harness; verify expected numbers, plots, labels, and the missing-file message; audit first use of technical and GUI terms; check task IDs, progressive hints, prohibited patterns, provenance and public content; rehearse download-to-first-task steps and assess timing. Assign the complete worksheet and blueprint to a separate read-only reviewer using _internal/.ai/agents/exercise-reviewer.md, resolve findings, then obtain explicit human approval. The release manifest must distribute both the completed script and site-means CSV before the stable links in the worksheet will work. Publishing remains a separate workflow.

## Validation and independent review

- The revised unfilled worksheet parsed and sourced from a clean R session in a temporary project with the site-means CSV under data; it did not create data_lokality or mod_krabi. Without the CSV, the preflight stopped with the intended Czech recovery message. Windows R required an available Czech UTF-8 locale in the validation harness; no locale workaround appears in student code.
- The untracked reference harness loaded the CSV and fitted the model as student solutions for U01/U02, then checked answers for all 8 core and 13 optional tasks. It confirmed the 13-site slope, SE, t, df, p, 95%/90%/99% intervals, 392 individuals in 13 sites, VCR residual, and the positive slope after omitting GTM. The illustrative two-sided tail area at |t| = 2 and df = 11 was corrected to 0.0708 during validation.
- The script is UTF-8 without BOM or replacement characters. All 21 task IDs and required task fields are present. A focused search found no automatic installation, package attachment, working-directory change, required View(), or graphical-state change in the student file.
- Three reference plots were saved and visually inspected. Czech axis labels and units rendered correctly.
- The release YAML parsed under the available Czech UTF-8 locale and its exercise, site-means, and individual-data paths exist locally. Stable download links require a later public release; a live beginner RStudio pacing trial has not been performed. The 68-minute core is an author estimate.
- A separate read-only exercise reviewer read the complete worksheet and blueprint against the canonical rules, L05 approved materials and outcomes, and the L04 practical. Result: No findings. A focused re-review of student-created data_lokality and mod_krabi, downstream prerequisites, unfilled sourcing, and timing also found no findings.
- Human exercise approval and public release remain pending.