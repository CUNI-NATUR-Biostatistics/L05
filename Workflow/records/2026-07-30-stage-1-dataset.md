# Stage 1 - Dataset Research and Decision

## Metadata

- Week: L05
- Date: 2026-07-30
- Author: Ondřej Mottl (with Codex)
- Reviewer: Ondřej Mottl (approved)

## Git checkpoint

- Stage group: Stages 0-1 planning
- Branch: `lesson/l05-scope-data`
- Base branch and commit: `main` at `3b5d84e` (`Initial commit`)
- `git status --short` reviewed: [x]
- Stage 0 record is on this branch: [x]
- Planning PR: not opened

## Inspiration consulted

- Relevant source(s) from `_internal/obecne/nove/biostatistics_course_inspiration_hub.md`: ModernDive; Modern Statistics with R; genomicsclass / PH525x.
- Dataset-selection pattern worth borrowing: Retain one familiar simple-regression coefficient, but interpret its magnitude and uncertainty before constructing the null test. Prefer a data story in which the raw coefficient has meaningful units and the observation count makes residual degrees of freedom visible.
- What to avoid from those sources: A simulation-only story; switching to a two-group test before L06; using a dataset merely because an inference tutorial already packages it; or selecting a relationship whose grouping, repeated measurements, time structure, or nonlinearity requires a later-course model to make the main analysis credible.

## Dataset needs derived from the weekly outcomes

- Two quantitative variables that support a familiar simple linear model with an interpretable raw slope.
- One clearly defined observational unit and a defensible population or process to which the question refers.
- Preferably 12-120 independent units: enough information for a regression, but not so many that `df = n - 2` feels irrelevant.
- A scale on which students can discuss the difference between “different from zero” and “large enough to matter.”
- A result that supports the complete chain: estimate and units -> confidence interval -> `t` statistic -> t reference distribution and df -> p-value -> error consequences.
- A real biological, ecological, environmental, or strongly practical story that can carry the lecture and practical.
- No categorical predictor in the main model, no required transformation, and no dependence or hidden grouping that silently invalidates the simple analysis.

## Broad discovery gate

- Independent sources consulted: LTER Network / Environmental Data Initiative; Dryad and the associated Biology Letters study; ModernDive and GeyserTimes; Palmer Station LTER; R `datasets` documentation and original study citations; MASS documentation and Fisher's original cat study; OpenIntro biostatistics and regression materials.
- Credible dataset or teaching examples reviewed: 10.
- Established course/tutorial examples included: [x]
- Primary dataset documentation or domain repositories included: [x]
- Minimum-count exception required: no

The screen result is specific to L05. A rejection does not imply that the dataset
is poor for another lesson.

| Source/tutorial | Dataset or example | Exact variables/model | Observational unit and population/sampling story | Provenance and reuse | Useful pattern | Main complication | Screen result |
|---|---|---|---|---|---|---|---|
| [LTER `pie_crab` vignette](https://lter.github.io/lterdatasampler/articles/pie_crab_vignette.html) and [Johnson et al. 2019](https://doi.org/10.1002/ece3.5883) | Atlantic marsh fiddler-crab size across latitude | Proposed lesson model: site mean carapace width (mm) ~ latitude (degrees north) | One unit is one of 13 Atlantic-coast salt marshes; 25-37 adult male crabs were measured at each site in summer 2016 | Teaching sample is CC0 in `lterdatasampler`; original data have an [EDI DOI](https://doi.org/10.6073/pasta/4c27d2e778d3325d3830a5142e3839bb) | Bergmann's rule gives a real biological claim, a raw effect in mm per degree, and a small, visible df | Individual crabs are nested within sites. The lesson must aggregate to 13 site means and state that spatial independence is an approximation | **Finalist 1** |
| [Dryad: High-Arctic butterflies](https://doi.org/10.5061/dryad.43gt3) and [Bowden et al. 2015](https://doi.org/10.1098/rsbl.2015.0574) | Female butterfly wing length and summer temperature | BioCEED-style simplification: annual mean female wing length (mm) ~ mean May-June temperature (°C) for one species | One unit is one year from 1996-2013 after sex/species filtering and annual aggregation | Raw workbook and metadata are permanently archived on Dryad under CC0 | Effect in mm per °C is biologically meaningful; a wide CI and non-small p-value prevent a significance-only story | Only 17 complete annual summaries; time dependence and aggregation matter; the published analysis is richer than the teaching model | **Finalist 3** |
| [ModernDive regression inference](https://moderndive.com/v2/inference-for-regression.html), [GeyserTimes archive](https://geysertimes.org/archive/geysers/Old_Faithful_eruptions.tsv.gz), and L04 | Old Faithful eruption duration and subsequent waiting time | Waiting time (min) ~ eruption duration (min) | One unit is one observed eruption and the wait to the next; L04 uses 117 volunteer observations from June-August 2024 | Stable official archive plus the already prepared, attributed L04 teaching copy; any reused image still needs item-level checking | Maximum continuity with L04; estimate, SE, CI, and model output are already familiar | Not biological; `n = 117` makes df less tangible; serial dependence and volunteer observation limit population language; very small p-value may dominate attention | **Finalist 2** |
| [Palmer Penguins](https://allisonhorst.github.io/palmerpenguins/) | Body mass and flipper length | Body mass (g) ~ flipper length (mm), either pooled or after subgroup filtering | One unit is an adult foraging penguin measured near Palmer Station; 344 rows across three species, islands, years, and sexes | Data are CC0 with source and citation metadata from Palmer Station LTER | Engaging organism, clear measurement diagram, and an easy raw coefficient | Species, sex, island, and year all structure the relationship; a filtered subgroup is less transparent and still does not remove all grouping | Reject as main story; possible practical transfer |
| [LTER `hbr_maples` vignette](https://lter.github.io/lterdatasampler/articles/hbr_maples_vignette.html) | Sugar-maple seedling height and stem dry mass | Stem dry mass (g) ~ stem length (mm) | One unit is one seedling sampled within transects, elevations, watersheds, and years | CC0 teaching sample with cited Hubbard Brook source data | Strong biological units and an explicit effect-size-first teaching precedent | Allometry, heteroscedasticity, and watershed/year/transect structure compete with the simple slope test; the prominent treatment question belongs to L06 | Reject |
| [LTER North Temperate Lakes vignette](https://lter.github.io/lterdatasampler/articles/ntl_icecover_vignette.html) | Cold-season temperature and lake ice duration | Annual mean ice duration (days) ~ November-April mean temperature (°C) | One unit is a year after joining and averaging long-term records from Madison-area lakes | CC0 teaching sample; source series have stable EDI DOIs and detailed metadata | Climate consequence makes an effect in days per °C immediately important | Joining, seasonal aggregation, multiple lakes, temporal autocorrelation, and historical measurement changes take over the lesson | Reject |
| [R documentation: `ChickWeight`](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/ChickWeight.html) | Chick mass during early growth | Weight (g) ~ age (days) | One row is one repeated weighing; 50 chicks were measured across time and four diets | Included with R and linked to the original repeated-measures sources | Familiar growth units and many observations | The 578 rows are not independent chicks; growth is nonlinear and diet matters, so the correct story requires longitudinal models | Reject |
| [R documentation: `CO2`](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/CO2.html) | CO2 uptake by grass plants | CO2 uptake ~ ambient concentration | One row is a repeated measurement on one of 12 plants across seven concentrations, two origins, and two treatments | Included with R and linked to the original experiment | Experimental dose-response with meaningful units | Repeated plants, curvature, origin, and chilling treatment make a one-line model scientifically misleading | Reject |
| [R documentation: `ToothGrowth`](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/ToothGrowth.html) | Guinea-pig odontoblast length and vitamin C dose | Tooth length ~ dose | One unit is one guinea pig assigned to one of three doses and two delivery methods | Included with R and linked to the original experiment | Dose and response are easy to understand; consequences can be discussed | Only three predictor values and a delivery-method group make this primarily a categorical/dose-response comparison that anticipates L06 | Reject |
| [MASS `cats` documentation](https://rdrr.io/cran/MASS/man/cats.html) and Fisher 1947 | Adult-cat heart and body weights | Heart weight (g) ~ body weight (kg) | One unit is one adult cat used in digitalis experiments; both female and male cats are included | Distributed with MASS with the original Biometrics source identified | Raw slope has concrete anatomical units | Sex is a visible omitted group, the historical animal experiment needs care, and biological importance is harder to benchmark | Reject |

## Finalist comparison

| Finalist | Learning-outcome fit | Student relevance | Interpretability | Stepwise buildability | Practical feasibility | Main risks | Rank |
|---|---|---|---|---|---|---|---|
| Fiddler-crab site means | Excellent: effect, CI, `t`, `df = 11`, p-value, and errors all support one claim | Excellent climate-ecology and biogeography story | Excellent after expressing the effect per 5° as well as per 1° latitude | Excellent: map/story -> 13 points -> slope -> uncertainty -> exact-zero null -> t curve | Good: 13 complete site summaries; official CC0 teaching source | Aggregation must be explicit; two low-latitude sites are influential; sites are only approximately independent | **1** |
| Old Faithful 2024 | Excellent technical continuity with L04 | Moderate: memorable natural process but not biology | Excellent units and practical waiting-time consequence | Excellent because all prerequisite outputs already exist | Excellent: prepared 117-row course dataset, no missing model values | Very small p-value and large n weaken the anti-monolith message; temporal process and volunteer sampling | **2** |
| High-Arctic butterfly annual means | High: small df and imprecise estimate make effect-versus-evidence distinction unavoidable | Excellent climate-biology story | Excellent units, but annual aggregation needs explanation | Moderate: the simplified line is readable, yet it diverges from the published analysis | Good: stable CC0 workbook; preparation required; 17 complete annual summaries | Temporal dependence, small sample, and mismatch between simple and published models may distract | **3** |

## Numerical and practical feasibility probes

These are internal feasibility checks. They are not proposed student-facing
outputs, and no finalist dataset has been copied into L05.

### Fiddler-crab site means

- Provenance, reuse conditions, and stable access: The `lterdatasampler` teaching sample is CC0; the source data have a stable EDI DOI and an associated peer-reviewed Ecology and Evolution article.
- Observational unit, intended population, and sampling story: The raw teaching sample contains 392 adult male crabs from 13 salt-marsh sites. To avoid treating crabs from the same latitude as independent evidence about latitude, the proposed lesson table has one mean carapace width per site (`n = 13`, no missing site summaries).
- Numerical probe: The official CC0 `pie_crab.rda` file was downloaded to a temporary file and aggregated with one mean per site. For `mean_size_mm ~ latitude`, the slope is `0.490` mm per degree north; SE `0.0795`; `t = 6.159`; residual `df = 11`; two-sided `p = 0.0000711`; 95% CI `[0.315, 0.664]` mm per degree; R² `0.775`.
- Effect scale: A 5° latitude contrast corresponds to an estimated `2.45` mm difference in mean carapace width. Across the observed 12.7° range, the fitted difference is `6.22` mm, large relative to site means of roughly 10-19 mm.
- Influence and structure: Maximum Cook's distance is `0.496` at the southernmost GTM site; SI is `0.431`. Leaving out one site at a time gives slopes from `0.429` to `0.559` mm per degree, so the direction and substantive scale are stable while individual sites remain worth discussing.
- Teaching opportunities and complications: The 13 visible points make `13 - 2 = 11` residual degrees of freedom concrete. The lesson must say that site means deliberately change the unit of analysis and that a straight-line, independent-site model is a useful first approximation rather than a complete spatial ecological model.

### Old Faithful 2024

- Provenance, reuse conditions, and stable access: The exact 117-row course table is already documented and reproducibly linked to the official GeyserTimes archive in L04.
- Observational unit, intended population, and sampling story: One observed eruption plus waiting time to the next eruption; 39 observations from each of June, July, and August 2024; no missing model variables.
- Numerical probe: `cekani_min ~ delka_erupce_min`; slope `13.335` minutes of extra waiting per additional minute of eruption; SE `0.657`; `t = 20.283`; residual `df = 115`; `p = 8.67e-40`; 95% CI `[12.033, 14.637]`; R² `0.782`; maximum Cook's distance `0.059`.
- Structure check: Monthly slopes are similar: June `12.915`, July `13.987`, and August `12.884` minutes per minute. The sequence is nevertheless temporal, and the volunteer archive is not a simple random sample of all eruptions.
- Teaching opportunities and complications: Reuse minimizes data-story overhead and creates a direct L04 -> L05 callback. However, the nearly inevitable “significant” result and large df make it harder to show why biological/practical importance and uncertainty precede p.

### High-Arctic butterfly annual means

- Provenance, reuse conditions, and stable access: The source workbook and metadata are permanently archived on Dryad under CC0 with a dataset DOI and linked peer-reviewed paper.
- Observational unit, intended population, and sampling story: The simplified teaching analysis filters to females of one species and aggregates nearly 4,500 raw individual records to 17 complete annual means.
- Numerical probe: Annual mean wing length ~ May-June temperature; slope `-0.105` mm per °C; SE `0.0945`; `t = -1.111`; residual `df = 15`; `p = 0.284`; 95% CI `[-0.306, 0.096]`; R² `0.077`.
- Teaching opportunities and complications: The estimate has a direction and biological consequence, but the interval spans effects in both directions. This is excellent for showing why “not significant” does not prove no effect. It is also risky because time dependence, aggregation, and the richer published analysis make the simple model a less honest primary analysis than the crab site summaries.

## Selected dataset

- Name/source: Site-level Atlantic marsh fiddler-crab data derived from the CC0 `lterdatasampler::pie_crab` teaching sample, with original data archived by the Environmental Data Initiative.
- Response variable: Mean male carapace width at each marsh, in millimetres.
- Key predictor: Site latitude, in degrees north.
- Why this one is best for this week: It is a real, published ecological claim; the effect has understandable units and a large observed-range contrast; 13 sites make degrees of freedom visible; and the distinction between 392 measured crabs and 13 independent site-level units creates a valuable but manageable scientific-design discussion.
- Role of the alternatives: Old Faithful remains a brief L04 callback, not the main L05 dataset. The Arctic-butterfly result remains an optional transfer question about an uncertain effect and a non-small p-value.
- Status: Approved and locked by the instructor on 2026-07-30.

## Minimal data story if the recommendation is approved

- Biological question in one sentence: How much larger are Atlantic marsh fiddler crabs, on average, at more northern sites, and how strongly do 13 sampled marshes challenge the claim of no latitudinal relationship?
- First figure idea: A simple Atlantic-coast strip or latitude axis with 13 marshes, followed by a scatterplot of site mean carapace width against latitude; individual crabs appear faintly only to explain why the site, not the crab, is the inferential unit.
- Effect-first interpretation: State the slope per 1° and per 5°, compare the fitted Florida-Massachusetts contrast with typical crab size, then show the confidence interval before introducing `H0: beta_latitude = 0`.
- Bridge to next lesson: L06 can contrast this numeric-predictor slope with a categorical comparison, but no site groups are added to the L05 model.

## Why the recommended dataset matches the project filter

- Supports model-first teaching: Yes. It uses the same `lm(y ~ x)` and coefficient logic as L03-L04.
- Understandable for biology beginners: Yes. Body size, latitude, and Bergmann's rule can be introduced visually without technical prerequisites.
- Uses real data appropriately: Yes, provided the lesson works with 13 site means and states the sampling and spatial limitations.
- Avoids unnecessary tooling or syntax burden: Yes. The classroom table needs only site, latitude, sample size, and mean carapace width; the official-source preparation can remain in a hidden reproducibility block.

## Decision

- [x] At least 4 independent sources were consulted, or a human-approved exception is documented
- [x] At least 8 credible examples were reviewed without padding trivial variants, or a human-approved exception is documented
- [x] Exact variables, observational units, sampling stories, provenance, and reuse conditions were checked
- [x] Two or three finalists were compared and numerically probed
- [x] Rejection reasons and transferable teaching patterns were recorded
- [x] Human reviewer approved the selected dataset
- [x] Dataset locked for implementation
- [x] Diff contains only Stages 0-1 records and intended planning changes
- [x] Planning PR ready for human review
- Notes: The instructor approved the 13-site fiddler-crab summary, with Old Faithful retained only as a brief L04 callback. No dataset file, image, lesson source, or rendered output has been added at the planning stage. The official CC0 source will be acquired reproducibly when written-material implementation begins after the planning PR is merged.
