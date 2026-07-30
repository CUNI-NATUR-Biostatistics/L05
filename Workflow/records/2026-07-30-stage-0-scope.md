# Stage 0 - Scope Lock

## Metadata

- Week: L05
- Date: 2026-07-30
- Author: Ondřej Mottl (with Codex)
- Reviewer: Ondřej Mottl (pending review)

## Git checkpoint

- Stage group: Stages 0-1 planning
- Branch: `lesson/l05-scope-data`
- Base branch and commit: `main` at `3b5d84e` (`Initial commit`)
- `git status --short` reviewed: [x]
- Previous-stage PR merged: N/A
- Planned PR: Planning PR for Stages 0-1; not opened

## Topic sentence

Begin by asking what it means for science to call a claim true and how observations can count for or against a testable claim. Then return to the familiar linear-model slope as an effect size in biologically meaningful units: ask how large the effect is, whether it matters, and how uncertain it is before testing the narrower claim that the population slope is zero. Build the p-value transparently through the estimate, its standard error, a t test statistic, the null reference distribution, residual degrees of freedom, and tail probability. Finish with an effect-first scientific conclusion in which the p-value is one supporting component rather than the verdict.

## Weekly outcomes (mapped)

- Canonical L05 outcome 1 from `_internal/osnova_lekci.md`: Distinguish a testable scientific claim from an untestable or purely evaluative statement and translate a biological claim into null and alternative hypotheses about a parameter of a familiar model.
- Canonical L05 outcome 2 from `_internal/osnova_lekci.md`: Interpret the slope as an effect size in original units, discuss its biological importance, and distinguish effect magnitude and uncertainty from the p-value.
- Canonical L05 outcome 3 from `_internal/osnova_lekci.md`: Explain how an effect estimate, its standard error, and degrees of freedom produce a test statistic and its null reference distribution, and use that chain to interpret the p-value correctly.
- Canonical L05 outcome 4 from `_internal/osnova_lekci.md`: Distinguish Type I and Type II errors in the context of a biological question.
- Canonical L05 outcome 5 from `_internal/osnova_lekci.md`: Write a cautious conclusion in the order effect magnitude and importance, uncertainty interval, compatibility with the null hypothesis, and study limitations.
- Model-first framing from `_internal/osnova_lekci.md`: Add formal claims and statistical decision-making to the quantitative-predictor model already used in L03-L04. Do not introduce a new predictor type or an isolated test-selection workflow.

## Inspiration consulted

- Authoring problem to solve: How to keep effect magnitude and biological importance as the main scientific questions while moving from a discussion of scientific truth to a technically honest but beginner-readable derivation of a regression p-value.
- Relevant source(s) from `_internal/obecne/nove/biostatistics_course_inspiration_hub.md`: ModernDive; Modern Statistics with R; genomicsclass / PH525x. The extended online review and adaptation decisions are recorded in `Workflow/records/2026-07-30-stage-0-inspiration-research.md`.
- Pattern(s) worth borrowing: Use humorous claims to distinguish testability from plausibility; frame scientific conclusions as conditional and revisable; treat the familiar raw slope as the primary effect size; ask about magnitude and biological importance before testing an exact-zero null; use the confidence interval to show which effect sizes remain compatible with the data and model; derive the t statistic as distance from the null measured in standard-error units; make degrees of freedom visible through constrained choices before returning to `n - 2` regression residual information; visualize the t reference distribution and “equally or more extreme” tail area; connect each possible decision error to consequences in a biological story; finish with an effect-first evidence statement.
- Pattern(s) explicitly rejected: An isolated catalogue or decision tree of classical tests; presenting the p-value as an unexplained output or the climax of the lesson; beginning with algebra before the scientific question; treating “statistically significant” as proof or as a measure of effect importance; replacing an interpretable raw coefficient with a catalogue of standardized effect-size indices; introducing a categorical predictor, t-test, or ANOVA before L06; treating a Sudoku grid as a literal derivation of statistical df; tidyverse-first student workflows; calculus derivations or formal power and sample-size calculations.
- Why the selected pattern fits this course: It preserves the model-first line from L03-L04 and gives the familiar coefficient a clear scientific priority: it states how much the response changes. The confidence interval describes uncertainty about that quantity, while the p-value answers the narrower conditional question about an exact null. The philosophy opening supplies the purpose, the constrained-choice sequence supplies intuition for df, and the reference distribution makes the conditional logic of the p-value inspectable.

## Concrete student actions (3-5)

1. Distinguish a testable scientific claim from an untestable or purely evaluative statement and translate a biological claim into parameter-level hypotheses.
2. Interpret the familiar slope as an effect size in meaningful units, discuss whether its magnitude matters biologically, and use its confidence interval to describe uncertainty.
3. Build and interpret the slope test statistic as the estimated distance from the null value measured in standard-error units.
4. Explain why simple linear regression has `n - 2` residual degrees of freedom, how df changes the t reference distribution, and how the two-sided p-value is read as tail area under that distribution.
5. Identify Type I and Type II errors and write an effect-first conclusion that uses the p-value as one conditional piece of evidence.

## Evidence hierarchy used throughout

Every worked result and student conclusion should answer the questions in this order:

1. **How large is the estimated effect?** State the slope in the original response-per-predictor units.
2. **Is that magnitude biologically important?** Compare it with domain knowledge or a pre-stated effect worth caring about, without requiring formal equivalence testing.
3. **How uncertain is the estimate?** Use the confidence interval to show the range of effects reasonably compatible with the data and model.
4. **How compatible are the data with the exact null claim?** Use the test statistic and p-value for the conditional question `H0: beta1 = 0`.
5. **What limits the conclusion?** Return to design, assumptions, measurement, and consequences of errors.

The p-value is therefore not an alternative measure of effect size and not a global evidence score. It is derived from the estimated effect relative to its uncertainty and a reference distribution, and it answers a deliberately narrower question.

## Proposed lesson spine

1. Science, truth, and testable claims: a short discussion using the Moon-cheese and biology claim cards.
2. Return to one familiar biological model: state the observed slope in meaningful units, ask whether that effect would matter, and inspect its confidence interval.
3. Translate the narrower exact-zero claim into `H0: beta1 = 0` and `HA: beta1 != 0`.
4. Construct the hypothetical world in which `H0` and the model assumptions hold, and visualize the resulting null distribution of slope estimates or standardized statistics.
5. Build `t = (b1 - 0) / SE(b1)` from the effect estimate and standard error already understood from L04.
6. Teach degrees of freedom through a Sudoku-row hook, a rigorous fixed-mean number demonstration, and the regression result `df = n - 2`.
7. Compare t curves across df, locate the observed statistic, and shade equally or more extreme values in both tails to obtain the p-value.
8. Introduce alpha, Type I and Type II errors, and intuitive power through a funny diagnostic mnemonic followed by a biologically consequential decision.
9. Return to the scientific claim and write an effect-first evidence statement using magnitude, biological importance, confidence interval, p-value, assumptions, limitations, and context.

## Formal depth boundary

- Core: the raw slope as an interpretable effect size, a domain-informed discussion of meaningful magnitude, confidence-interval uncertainty, parameter-level hypotheses, numerical t-statistic construction, null reference distribution, residual degrees of freedom, qualitative df effect on the t curve, two-sided tail area, and test-CI connection.
- Intuitive only: power and the dependence of decision errors on effect magnitude, precision, sample size, variability, and alpha.
- Deferred: derivation of the slope standard-error formula, derivation of the Student t density, matrix proof of `n - 2`, manual integration or extensive t tables, general df formulas for later models, formal power/sample-size calculations, multiple-testing correction, equivalence testing, and Bayesian hypothesis probabilities.

## Out of scope this week

- Re-teaching how to fit or geometrically interpret `lm(y ~ x)`, its coefficient, residuals, standard error, or confidence interval; these are foundations from L03-L04.
- Categorical predictors, two-group comparisons, t-tests, ANOVA, and post-hoc comparisons; these belong to L06.
- Multiple predictors, interactions, candidate-model comparison, nonlinear models, hierarchical models, and generalized linear models; these belong to later lessons.
- A test-selection tree or catalogue of named classical tests.
- A catalogue of standardized effect-size indices such as Cohen's d; the raw regression slope is the most interpretable effect size for this lesson.
- Re-deriving the coefficient estimate, residual geometry, standard error, or confidence interval from first principles; L05 uses these L03-L04 foundations to build the test statistic.
- Calculus derivation of the Student t density, closed-form derivation of the slope standard error, matrix/projection proof of residual df, or general df formulas for models not yet taught.
- Formal power analysis, sample-size calculation, multiple-testing correction, equivalence testing, and Bayesian hypothesis probabilities.
- Using a significance threshold as the sole conclusion or treating a non-significant result as proof of no effect.

## Risks and dependencies

- Risk: Students may reverse the conditioning and interpret the p-value as the probability that the null hypothesis is true.
- Risk: The threshold at `0.05` may dominate attention and displace effect magnitude, interval width, biological relevance, and study limitations.
- Risk: Calling the coefficient an “effect size” only in the final summary may leave the p-value as the apparent main result. Keep the estimate, units, and substantive importance visible before and after every inferential step.
- Risk: Type I and Type II errors may become detached vocabulary unless both are tied to plausible consequences in one memorable biological decision.
- Risk: A philosophy-of-science opening could consume the technical lesson or imply that simple falsificationism is a complete account of scientific knowledge. Limit it to a purposeful bridge from testable claims to conditional evidence.
- Risk: The Sudoku analogy could make students equate df with empty cells. State its limits, insert the fixed-mean demonstration, and use the fitted intercept and slope as the actual regression explanation.
- Risk: Formal detail could crowd out interpretation. Every formula or distribution must answer a previously stated question and be followed immediately by a visual or interpretation task.
- Dependency: Stage 1 must identify a real data story with a familiar quantitative-predictor model, interpretable effect units, a defensible substantive benchmark or consequence, a clearly stated coefficient-level claim, enough observations to make df comparisons meaningful, and enough signal to compare effect size, confidence interval, and p-value without requiring L06 or later methods.
- Dependency: Stage 1 must explicitly compare the continuity benefit of reusing the L04 Old Faithful story with the motivational benefit of a new biological or public-life dataset; neither option is locked at Stage 0.
- Inspiration risk: Philosophy sources can become abstract, and simulation-based statistics sources can become inference-first, syntax-heavy, or technically advanced. Retain only the claim-evidence logic, visual conditional-reference structure, and interpretation checks needed for beginners.

## Decision

- [x] Scope locked for implementation
- [x] Continue Stage 1 on this same planning branch
- Notes: The instructor approved the effect-first revision on 2026-07-30. Phase 0 now includes a science-and-truth opening; effect magnitude, biological importance, and uncertainty as the evidence backbone; the explicit construction and interpretation of the t test statistic; the t reference distribution; residual degrees of freedom; and a richer decision-error sequence. The required Stage 1 broad scan, finalist probes, and separate human review were subsequently completed, and the site-level fiddler-crab story was locked.
