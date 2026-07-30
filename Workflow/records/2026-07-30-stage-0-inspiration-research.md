# Stage 0 - Inspiration and Resource Research

## Metadata

- Week: L05
- Date: 2026-07-30
- Author: Ondřej Mottl (with Codex)
- Status: Working resource dossier for Phase 0 review
- Online sources checked: 2026-07-30

## Planning question

How can L05 keep effect magnitude and biological importance at the centre while moving from scientific claims and provisional knowledge to a technically honest explanation of the narrower question answered by a regression p-value?

## Main conclusion

The familiar regression coefficient should be taught as the primary effect size because it answers the main scientific question in meaningful units. The p-value should not be taught as either an unexplained number from `summary(model)` or the lesson's final verdict. The lesson needs the complete conceptual chain:

`scientific question → effect size in meaningful units → biological importance → uncertainty → exact null claim → test statistic → reference distribution and degrees of freedom → p-value → decision and possible error → effect-first scientific conclusion`

The formal machinery belongs in the core lesson, but its depth should be controlled. Students should construct and interpret the slope test statistic, understand why the reference curve is a t distribution with `n - 2` residual degrees of freedom in simple regression, and read a two-sided p-value as tail area. They do not need a calculus derivation of the t density or the closed-form derivation of the slope standard error.

## Effect size as the lesson backbone

“Effect size” does not need to mean a new standardized statistic in L05. For the familiar quantitative-predictor model, the raw slope is already an effect size: it states how much the expected response changes per unit change in the predictor. Its original units usually make it more useful for biological reasoning than a unitless index.

The same hierarchy should recur in the opening data story, formula development, software output, activities, and final conclusion:

1. Estimate the effect in meaningful units.
2. Ask whether its magnitude matters biologically, ideally against a pre-stated substantive benchmark or consequence.
3. Use the confidence interval to describe uncertainty and the range of effects still compatible with the data and model.
4. Use the p-value only to assess compatibility with the specific exact-zero null under the model assumptions.
5. Return to study design, assumptions, limitations, and the consequences of possible errors.

This makes the t statistic intelligible rather than ceremonial: it compares the effect estimate with one null value in units of estimated uncertainty. The p-value is downstream of the effect, its uncertainty, the null claim, and the reference distribution; it cannot replace any of them.

## Curated source review

| Source | What it contributes | Pattern to adapt | What not to import directly |
|---|---|---|---|
| [National Academies: Decoding Science](https://nap.nationalacademies.org/resource/25303/interactive/index.html) | Science as a collective, cumulative process that evaluates evidence and remains open to revision | Open with “How can science know?” and distinguish useful evidence from absolute certainty | A general public-outreach sequence without a direct bridge to the model parameter |
| [Stanford Encyclopedia of Philosophy: Scientific Method](https://plato.stanford.edu/entries/scientific-method/) | The asymmetry between confirming and falsifying universal claims, plus the limits of simple falsificationism | Use falsifiability as an opening lens, then explicitly say that one observation, measurement error, auxiliary assumptions, and accumulated evidence make real science more complicated | Presenting Popper as the complete or uncontested philosophy of science |
| [University of Lethbridge: What is a Hypothesis?](https://sites.ulethbridge.ca/science-toolkit/home/the-science-toolkit/what-is-science/hypotheses/what-is-a-hypothesis/) | A worked “Moon is made of green cheese” example distinguishing testability from plausibility and deriving observable predictions | Use the Moon claim as a humorous sorting task: testable does not mean plausible, and evidence addresses predictions rather than declaring metaphysical truth | Spending the lesson on lunar facts or treating a single test as final proof |
| [NSW Department of Education: Foundations of Scientific Thinking](https://education.nsw.gov.au/content/dam/main-education/teaching-and-learning/curriculum/key-learning-areas/science/s-6/science-extension/Scientific_thinking_final.pdf) | Classroom-ready contrasts among falsifiable, non-falsifiable, factual, and value claims, including the Moon and passenger-pigeon examples | Adapt several claims into a quick vote or small-group classification activity | Copying worksheets or artwork without a separate reuse check |
| [ASA Statement on Statistical Significance and P-Values](https://doi.org/10.1080/00031305.2016.1154108) | Authoritative boundaries: p-values concern compatibility with a specified model, do not give the probability that a hypothesis is true, do not measure effect size, and should not be used as a sole threshold for conclusions | Use the ASA principles as the interpretation checklist at the end of the lesson | Turning the six principles into a dense opening lecture |
| [ASA President's Task Force Statement on Statistical Significance and Replicability](https://hdsr.mitpress.mit.edu/pub/50vl2b07/release/2) | A balanced message that properly used tests and p-values remain useful tools within sound design, analysis, and reporting | Avoid framing L05 as either worship or rejection of p-values | Treating the broader policy discussion as student examinable detail |
| [Gardner and Altman: Confidence intervals rather than P values](https://www.bmj.com/content/292/6522/746) | A classic argument that estimation of effect magnitude and its confidence interval is more informative than an isolated significance decision | Make the estimate and interval the first result students interpret; introduce the p-value afterward for a narrower null-compatibility question | Replacing all testing instruction with a confidence-interval-only lesson |
| [Points of Significance: Importance of effect size](https://www.nature.com/articles/s41562-023-01586-w) | Statistical significance alone cannot establish practical or scientific importance; effect size and uncertainty are needed | Explicitly separate “different from zero?” from “large enough to matter?” on every result card | A broad survey of standardized effect-size measures before students need them |
| [ModernDive: Hypothesis Testing](https://moderndive.com/v2/hypothesis-testing.html) and [Inference for Regression](https://moderndive.com/v2/inference-for-regression.html) | A visual null distribution, “equally or more extreme,” frequent learning checks, and the regression statistic `t = (b1 - 0) / SE(b1)` | Reuse the visual and question sequence while keeping the familiar L03-L04 slope and course-native code | The tidyverse/infer workflow, a new two-group problem, or a simulation-first detour that hides the regression connection |
| [Modern Statistics with R: The Cornerstones of Statistics](https://modernstatisticswithr.com/basicstatistics.html) | Hypothesis testing as an evidence argument, the Lady Tasting Tea story, and discussion of p-hacking and selective reporting | Use the burden-of-evidence logic and optionally retain the Lady Tasting Tea as a historical sidebar or self-study example | Importing its wider technical scope or allowing historical detail to displace the L05 model |
| [NIST: Tests of Individual Regression Parameters](https://www.itl.nist.gov/div898/handbook/pmd/section4/pmd447.htm) | The exact model-first formal chain: coefficient distance in estimated standard-error units, Student's t reference distribution, and `n - p` residual degrees of freedom | Use this as the technical backbone for the familiar simple model, where `p = 2` and residual `df = n - 2` | NIST's terse reference-manual style or manual critical-value-table workflow as the main pedagogy |
| [Penn State STAT 500: Linear Regression Foundations](https://online.stat.psu.edu/stat500/Lesson09) | A conventional statement that the slope statistic follows a t distribution with `n - 2` degrees of freedom under the null and model assumptions | Use as a cross-check for notation and scope | A procedural regression lesson that repeats L03 |
| [Janson, Fithian, and Hastie: Effective Degrees of Freedom](https://pmc.ncbi.nlm.nih.gov/articles/PMC4787623/) | A rigorous geometric interpretation: residuals in an ordinary linear model are free in an `n - p` dimensional complement after `p` fitted directions are removed | Use internally to keep the “independent information after constraints” explanation accurate | Projection geometry, matrix notation, effective degrees of freedom, or model-selection theory in student-facing L05 |
| [Math Is Fun: Degrees of Freedom](https://www.mathsisfun.com/data/degrees-freedom.html) | A beginner-friendly fixed-total/fixed-mean demonstration in which the final value is forced | Adapt the constrained-values demonstration between the Sudoku hook and regression | Treating an informal web explanation as the statistical authority |
| [Martin: Analogies and Heuristics in Introductory Statistics](https://doi.org/10.1080/10691898.2003.11910705) | A research-based rationale for memorable physical analogies and an explicit warning that analogies must augment rather than replace statistical reasoning | Label every analogy's mapping and its point of failure | Allowing the legal, contest, or signal-to-noise analogy to become the lesson's actual definition |
| [NCBI Bookshelf: Type I and Type II Errors and Statistical Power](https://www.ncbi.nlm.nih.gov/books/NBK557530/) | The Boy Who Cried Wolf, healthcare consequences, and the link from Type II error to intuitive power | Pair one funny mnemonic with one biologically consequential decision | Memorizing “false positive/false negative” without first fixing the null hypothesis and decision rule |

## Candidate opening examples

| Example | Conceptual job | Recommended use | Limitation to state |
|---|---|---|---|
| “The Moon is made entirely of cheese” | A claim can be testable yet implausible; observations address predictions | Opening vote: scientific, testable, plausible, and what evidence would count against it? | Scientific testing does not start from zero background knowledge, and one p-value does not assign truth probabilities |
| “All birds can fly” or “All swans are white” | One counterexample can contradict a universal statement | Thirty-second contrast with repeatedly observing confirming cases | Real scientific hypotheses are usually embedded in measurement and auxiliary assumptions |
| “Passenger pigeons are extinct” | A single live individual would overturn the claim, while failure to find one is not final proof | Biology-facing bridge from falsifiability to imperfect detection | This naturally foreshadows false negatives and detection probability, which should remain intuitive rather than become an occupancy-model lesson |
| Lady Tasting Tea | A concrete historical claim with a transparent null reference world | Optional sidebar or reading example if the main dataset does not provide a comparably clean randomization story | It introduces a classification experiment rather than the familiar regression slope |

## Degrees-of-freedom teaching sequence

1. **Sudoku hook:** In a single valid Sudoku row, students may choose several entries, but once eight distinct digits are fixed the ninth is forced. Each added constraint reduces what remains free.
2. **State the analogy boundary:** Empty Sudoku cells are not literally statistical degrees of freedom because Sudoku constraints are discrete, overlapping, and sometimes redundant. The puzzle makes “freedom under constraints” visible; it does not derive regression degrees of freedom.
3. **Constrained-number demonstration:** Ask students to choose four numbers whose mean is 10. The first three can vary, but the fourth is forced because their sum must be 40. Therefore only `4 - 1 = 3` independent pieces of variation remain after estimating/fixing one mean.
4. **Return to the familiar model:** A simple regression has `n` response observations and estimates two parameters from them, the intercept and slope. Those fitted quantities impose two independent constraints on the residuals, leaving `n - 2` residual degrees of freedom.
5. **Show why df matters:** Overlay t curves for very small, moderate, and large df. With fewer residual degrees of freedom, the noise estimate is less stable and the reference distribution has heavier tails; the same absolute t statistic therefore corresponds to a larger p-value.

## Decision-error example bank

| Example | Type I / false positive | Type II / false negative | Recommended role |
|---|---|---|---|
| Pregnancy-test cartoon | A test reports pregnancy in a clearly impossible non-pregnant case | A test reports no pregnancy in an obvious late pregnancy | Fast, funny mnemonic after the null state has been explicitly fixed; avoid making it the only example |
| Boy Who Cried Wolf | Villagers respond when no wolf is present | Villagers fail to respond when a wolf is present | Clean fallback with an established teaching source |
| Invasive species surveillance | Management acts as if a species is present when it is absent | Management misses an invasion that is present | Course-native biological example that makes asymmetric consequences discussable |
| New treatment claim | Adopt an ineffective or harmful treatment | Discard a genuinely useful treatment | Shows why the preferred error balance depends on consequences rather than the labels alone |

## Proposed 90-minute conceptual arc

| Time | Concept block | Student activity | Formal destination |
|---|---|---|---|
| 0-10 min | What can science call true? | Classify Moon, bird, extinction, and value claims; name an observation that would change the conclusion | Scientific claims are testable and conclusions remain conditional and revisable |
| 10-22 min | How large is the biological effect? | Interpret the familiar slope in original units, propose a magnitude worth caring about, and inspect its confidence interval | The coefficient is an effect size; magnitude, importance, and uncertainty are distinct questions |
| 22-32 min | From the effect to an exact null claim | Translate `beta1 = 0` into `H0` and predict how estimates would vary if that claim and the model assumptions held | The null distribution addresses a specific conditional question, not overall scientific importance |
| 32-43 min | Measure distance from the null | Construct a numerical “difference divided by uncertainty” example from estimate and SE | `t = (b1 - 0) / SE(b1)` as standardized distance |
| 43-57 min | Degrees of freedom | Sudoku row → fixed-mean cards → regression residual constraints | Independent information after fitting; simple regression residual `df = n - 2` |
| 57-67 min | Reference distribution and p-value | Compare t curves by df and shade both tails beyond `|t_obs|` | Two-sided p-value as the null-model probability of an equally or more extreme statistic |
| 67-78 min | Decisions and errors | Pregnancy or wolf mnemonic, then classify consequences in an invasive-species decision table | Alpha, Type I, Type II, and power at an intuitive level |
| 78-90 min | Return to scientific evidence | Write and critique conclusions in the order magnitude, biological importance, CI, p-value, assumptions, and context | The effect remains the scientific result; `p < 0.05` is neither its size nor a truth machine |

## Formal depth boundary

### Core and student-visible

- Hypotheses about the familiar slope parameter.
- The raw slope as an effect size in original units and a domain-informed comparison with a magnitude worth caring about.
- The confidence interval as a range of effect sizes compatible with the data and model, compared with both zero and a substantive benchmark where appropriate.
- A numerical construction and interpretation of `t = (estimate - null value) / standard error`.
- The idea and visual form of the null reference distribution.
- Degrees of freedom as independent residual information after fitted constraints.
- The simple-regression result `df = n - 2`, with intercept and slope identified as the two fitted parameters.
- The qualitative effect of df on the t distribution.
- A two-sided p-value as shaded tail area.
- The connection among a two-sided test, whether the corresponding confidence interval contains zero, and the scientific conclusion.

### Intuitive only

- Statistical power as the ability to detect a meaningful effect that exists.
- The dependence of power on effect magnitude, precision/sample size, variability, and alpha.
- The fact that assumptions and study design are part of the conditional reference model.

### Deferred

- Calculus or probability derivation of the Student t density.
- Closed-form derivation of the slope standard-error formula.
- Matrix/projection proof of residual degrees of freedom.
- One-sided testing as a major branch, formal power calculations, sample-size calculations, multiple-testing correction, equivalence testing, and Bayesian hypothesis probabilities.
- General degrees-of-freedom formulas for models not yet taught.
- A catalogue of standardized effect-size indices and formal equivalence or non-inferiority testing.

## Resource and reuse note

These sources are being used for concepts, sequencing, and example discovery. Any external worksheet, figure, cartoon, photograph, or other visual considered for the eventual lesson must receive a separate item-level reuse check. The safer default is to create original course-native diagrams for the Moon classification, constrained-number/Sudoku bridge, t curves, p-value tails, and decision matrix while citing the conceptual sources.
