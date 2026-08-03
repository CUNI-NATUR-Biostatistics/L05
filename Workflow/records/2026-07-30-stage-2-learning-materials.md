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
- What from the source is intentionally not being reused: Tidyverse-first student workflows, an isolated test-selection catalogue, a new two-group problem, simulation as a substitute for the familiar regression model, external worksheets or artwork, advanced derivations, and formal power or sample-size calculations.

## Stage 2A - Structural draft

- Section order complete: [x]
- First visual/table included: [x]
- First interpretation prompt included: [x]
- Misconception checkpoint included: [x]
- Bridge to next concept included: [x]

### Structural draft notes

- Opening biological question: How can science decide whether evidence supports a claim without pretending that one statistical test establishes truth?
- First data moment: Students receive the 13 site means as the main dataset and predict the north-south pattern before seeing the fitted model.
- Where the model-based framing first appears: The observational-unit comparison leads directly to an explicit base-R `lm(prumerna_sirka_mm ~ zemepisna_sirka)` model on site means.
- Structural decision: Preserve one continuous investigation from the Moon claim to a cautious crab conclusion. Old Faithful appears only as a short L04 uncertainty callback.
- Structural decision: Keep the recurring evidence order effect magnitude → biological importance → uncertainty → exact-null compatibility → assumptions and possible errors.
- Structural decision after human feedback: The main lesson starts from the 13 site averages. Four optional grey “Doplňující” boxes show how `lterdatasampler::pie_crab` is loaded, renamed, aggregated, and saved, and how all 392 individuals look before aggregation. The core lesson postpones hierarchical data structures to a later lesson.

## Stage 2B - Development pass

- Major concept blocks have visual anchors: [x]
- Interpretation prompts expanded: [x]
- Explanatory payoff text improved: [x]
- Transitions revised for self-study readability: [x]
- Glossary markup checked where relevant: [x]

### Development pass notes

- Which concept block improved most: A full prose rewrite replaced instruction-like headings and premature terminology with a conversational investigation. A skeptical question now motivates “no north-south trend,” then a zero slope, and only afterward the hypotheses and notation.
- Which visual or comparison became the main anchor: The effect-scaling figure links 1°, 5°, and the full sampled latitude range. A new Atlantic-coast map, 20 simulated null studies, the Sudoku pair, the df comparison, and the CI-against-zero plot provide concrete anchors for later concepts.
- Where the lesson still feels thin: The rewritten voice and pacing require renewed instructor judgment. The pregnancy-test mnemonic and the strength of the biological-importance wording remain deliberate review points.
- Development improvement: Integrated active-learning prompts throughout the story, covering claim classification, aggregation, effect scaling, interval reading, null predictions, t calculation, degrees of freedom, p-value tails and misconceptions, decision errors, and effect-first reporting.
- Development improvement: Added course-native visuals and tables for claims, the Atlantic-coast locations, aggregation, effect scaling, confidence intervals, 20 null datasets, null slopes, numerical t, Sudoku and fixed mean, t curves, p-value tails, Type I/II errors, and the final evidence hierarchy.
- Development improvement: The visible source workflow now uses the approved package dataset rather than a raw GitHub download, comments each multi-step transformation, constructs both teaching tables, and saves both CSV files.
- Development improvement: The familiar model is printed with complete `summary(mod_krabi)` and `confint(mod_krabi)` output before the new `t value` and `Pr(>|t|)` columns are interpreted.
- Development improvement after human feedback: After the first full draft was rejected for unnatural, instruction-driven prose, the lesson was rewritten section by section. Two independent Czech-prose/lesson reviewers checked successive versions. Their credible findings about premature concepts, null simulation wording, conditional p-value language, glossary coverage, calculation locality, decision thresholds, limitations, and the L06 bridge were resolved.
- Development improvement after the 2026-08-03 PDF review: The zero-slope simulation now separates a zero systematic trend from random variation due to sampling, measurement, omitted local conditions, and other biological differences. This distinction explains why fitted slopes from individual simulated datasets are not all zero.
- Development improvement after the 2026-08-03 PDF review: The numerical t table now includes the familiar English/R-output names; the fixed-mean exercise uses explicit equations; and the regression rule states residual df as observations (sites here) minus estimated coefficients.
- Development improvement after the 2026-08-03 PDF review: A three-panel shaded-area figure teaches how to read probability area before the tiny crab tails. The dedicated p-value section states what the quantity is before crossing out misconceptions. Type I/II errors now motivate the later introduction of alpha and the explicit terms “statisticky významný” and “statisticky signifikantní.”
- Development improvement after the 2026-08-03 PDF review: Density and residuals-versus-fitted plots restore the L04 diagnostic routine and make model checking visible whenever `lm()` is used.
- Development improvement after the final 2026-08-03 feedback pass: Model diagnostics now follow `summary()` and `confint()` immediately as routine good practice. The fixed-mean sequence contrasts one unknown with the unsolved equation $7+12+x+y=40$. The shaded $|t|=2$ areas are labelled explicitly as an illustration unrelated to the crab result. The confidence-interval comparison follows the introduction of $\alpha$, and the final result uses “statisticky významný” without confusing significance with biological importance.
- Development improvement after the final 2026-08-03 visual pass: The Atlantic-coast map was simplified to large site markers without overlapping location labels.
- Development improvement after the subsequent 2026-08-03 instructor notes: State polygons on the site map were initially changed to the course parchment/beige fill. The zero-slope simulation explicitly generates new residuals with variability estimated from the previously inspected model residuals. Labels for the illustrative t-tail areas were moved close to the x-axis.
- Development improvement after the subsequent 2026-08-03 instructor notes: A new bridge explains printed t critical-value tables and their modern `qt()`/`pt()` equivalents. Students select the t distribution, two-sided $\alpha=0.05$, and $df=11$, obtain the critical boundary 2.201, and compare it with the observed $|t|=6.159$. The cumulative-probability input to `qt()` is named explicitly so it cannot be mistaken for the model p-value.
- Development improvement after the subsequent 2026-08-03 instructor notes: The historical bridge is now titled “Kritické hodnoty” and explains that printed tables supplied precomputed boundaries when areas and quantiles of the t distribution were impractical to calculate by hand. It then connects the table lookup to modern `qt()` and `pt()` calculations.
- Development improvement after the subsequent 2026-08-03 instructor notes: Power is introduced intuitively with Type II error, then revisited only after $\alpha$ and the decision rule are available. The numerical illustration simulates 5,000 studies with the same 13 latitudes, a chosen true slope of 0.25 mm per degree, and residual variability estimated from the crab model; 4,077 studies reject the zero slope, giving illustrative power of 81.5%. The prose states explicitly that this is conditional on the chosen scenario and is not the probability that the conclusion is true. Formal power and sample-size planning remain deferred.
- Development improvement after the final 2026-08-03 instructor feedback: Every callout now has a descriptive title. The null-world simulation is explained before students predict its results, the p-value section states explicitly that the quantity ranges from 0 to 1, and the critical-value bridge returns to `summary(mod_krabi)` so students can locate `t value`, `Pr(>|t|)`, and residual df in familiar output. The power section ends by applying the same scenario to the observed crab slope: 4,999 of 5,000 simulated studies reject the zero slope, an illustrative estimate of 99.98%.
- Development improvement after renewed independent review: The scatterplot prediction now immediately precedes its reveal; the fixed-mean sequence states the relationship in words and a text-only equation before inserting computed numbers; the illustrative t-area comparison no longer names the p-value prematurely; and the prose distinguishes the slope's distance in standard-error units from the resulting t-statistic. Newly identified first-use glossary links were added for observational unit, fitted value, distribution, confidence interval, sample, and estimate.
- Theme integration follow-up on 2026-08-03: L05 was migrated to the current shared pipeline used by L01-L04 and `_L-template`. Standalone render scripts now synchronize `_brand` before rendering, prefer the local sibling `_brand` repository in the development workspace, refresh shared generators and render helpers, regenerate HTML/Typst/R theme outputs, and write `theme/brand_manifest.json` with fingerprints of all theme inputs and generated outputs.
- Development improvement after the final 2026-08-03 ordering and colour review: “Když musíme udělat rozhodnutí” now precedes “Dva způsoby, jak se splést,” so students first choose and apply the decision rule and only then classify possible wrong decisions. The transition introduces the false-rejection risk in words before the label “chyba I. druhu”; the error section ties that label back to $\alpha$, and the numerical power example follows the Type II error explanation.
- Development improvement after the final 2026-08-03 branding review: Learning materials now use the same semantic source classes as presentations: orange `.box-question`, indigo `.box-result`, grey `.box-data`, amethyst `.box-rule`, and red `.box-warning`. A shared Lua filter converts them to accessible native Quarto callouts in HTML and Typst/PDF. Every box retains a descriptive Czech title; the Atlantic-coast state polygons use a very soft amethyst fill while the orange site markers remain dominant.

## Quality check notes

- What improved most: The main analysis starts directly from averaged site data, prints the familiar complete model summary and confidence intervals, and lets each new inferential question arise from the crab story. The revised null simulation now makes the distinction between systematic signal and random variation explicit before any reference distribution is interpreted.
- What remains weak: The simple unweighted site-mean model necessarily leaves unequal site-mean precision, possible spatial dependence, influence of the two southern sites, and causal interpretation outside the fitted model.
- What needs reviewer focus: Whether the rewritten conversational voice now fits the instructor; whether the Moon and pregnancy examples earn their space; whether approximately 6.22 mm across the sampled range is described with the right degree of biological caution; and whether the optional aggregation box is appropriately scoped.
- Lesson-vision review: The written lesson follows the approved Stage 0-1 scope, remains model-first and effect-first, uses one main biological story, includes a visible L03-L04 bridge and L06 handoff, and defers the specified advanced topics.
- Glossary-coverage review: The final independent read-only review applied the canonical first-occurrence-per-`##`-section rule to the complete source. All credible gaps were linked to existing slugs, including inflected Czech forms in prose, prompts, and the final summary. Glossary calls were deliberately kept out of headings because they corrupt Quarto heading IDs; each was moved to the first safe prose occurrence below. “Reziduální standardní chyba” was reconciled with the preferred glossary term `reziduální směrodatná odchylka`. The focused recheck returned no findings. Missing canonical entries for t-statistic, statistical significance, and power remain glossary-backlog items, with clear inline definitions in L05.
- Source validation: The official `lterdatasampler::pie_crab` source, 392-row/13-site structure, and CC0 package license were verified. Student-visible preparation uses the package dataset; the map coordinates come from table 1 of the associated study.
- Link validation: The LTER vignette, raw source, EDI record, license record, and course glossary returned HTTP 200. The study DOI was independently confirmed but its Wiley landing page returned HTTP 403 to the automated request.
- Numerical validation: The rendered slope, standard error, confidence interval, t statistic, residual degrees of freedom, p-value, sampled-range contrast, and leave-one-site-out slope range correspond to computations from the generated site table. A separate check reproduced the two-sided 5% critical value 2.200985 for 11 df and the p-value 0.000071124 from `pt()`.
- Render status: `Rscript R/render_skripta.R` completed for HTML and Typst/PDF on 2026-08-03 through the updated render-time theme synchronization after the semantic-box migration. The PDF contains 37 pages, all 67 execution steps completed, and both outputs were produced; the only warning was the local `fs` build-version notice.
- Visual review: All 37 final PDF pages were rerasterized and inspected in contact sheets, with full-size checks of orange questions, indigo results, grey data boxes, amethyst rules, red warnings, the decision section, confidence-interval bridge, and Type I/II transition. Typography, captions, page breaks, and all five box roles remain legible without clipping or overlap. A headless-browser inspection of the HTML opening additionally confirmed the same semantic hierarchy, shared parchment page background, table styling, sidebar, and section order.
- Brand/template boundary: `_brand` now owns the semantic-box filter and HTML/Typst colour mapping, while `_L-template` supplies the filter in new written-material YAML. The synchronized L05 manifest records fingerprint `7062b131da5a0570ccafea28bc90f0d0`. The migration did not edit `Presentation/presentation.qmd`.
- Independent internal review: Separate read-only lesson-vision and glossary reviewers inspected the complete source again after the final ordering and callout pass. The renewed vision review of the semantic-box migration found two role mismatches: the opening Moon claim was context rather than a rule, while the closing scientific principle was a rule rather than an empirical result. Both classes were corrected before the final render; all other semantic boxes matched their intended teaching roles. The glossary reviewer identified missed first-safe-prose links in the edited sections; these were added, while glossary calls remain deliberately excluded from headings to preserve Quarto IDs. Its focused recheck returned no findings. Earlier complete reviews had already resolved prediction-to-reveal distance, fixed-mean equation ordering, premature p-value terminology, slope-versus-t wording, df, critical values, power, chunk labels, paths, and terminology.
- Remaining uncertainty: The instructor approved the written learning materials as good enough on 2026-08-03. A written-materials PR has not yet been opened or reviewed. Future `_brand` changes will now be pulled automatically at render time and may legitimately regenerate the tracked theme outputs and manifest.

## Stage 3 - Human review gate

- Lesson-vision review completed: [x]
- Glossary-coverage review completed: [x]
- Human review completed: [x]
- Credible findings resolved: [x]
- HTML/PDF rendered and checked: [x]
- Reviewer decision: Approved by the instructor on 2026-08-03; the written learning materials are considered complete for this stage.

## Decision

- [x] Written materials are review-ready
- [x] Written-material content and canonical theme integration remain within the L05 Stages 2-3 scope
- [ ] Written-materials PR ready to merge
- Notes: Stage 3 human review is complete. The written-materials PR still needs to be opened, reviewed, and merged before work begins on `Presentation/presentation.qmd`.
