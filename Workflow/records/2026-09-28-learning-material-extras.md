# L05 learning-material Extras revision

## Approval and scope

- Date: 2026-09-28
- Branch: `lesson/l05-learning-material-extras`
- Human approver: Ondřej Mottl
- Decision: approved in the course-wide L01-L08 Extra-content review and explicitly authorised for implementation on 2026-09-28.
- Scope: connect diagnostic validity to later interpretation, clarify the limits of a single planned p-value and connect testing to biologically meaningful effect thresholds.

## Mandatory story map

- Artifact: Learning materials amendment
- Story-map status: complete
- Heading-strip audit completed: [x]
- Knowledge-state audit completed: [x]
- Human story-map approval: approved
- Approved by: Ondřej Mottl
- Approval date: 2026-09-28
- Approval decision and requested revisions: The course-wide L01-L08 Extra-content map was approved and implementation was explicitly authorised; no revisions were requested. The table below records that approved content in the canonical format without changing its substance.

| Order | Internal role | Student-facing heading | Speaker note |
|---|---|---|---|
| 1 | Validity bridge | Co říká známá přímka? | After residual diagnostics, state that later effect-size and uncertainty conclusions remain conditional on the model without naming the p-value before it is introduced. |
| 2 | Analysis-planning boundary | Doplňující: jedna předem položená otázka a mnoho vyzkoušených otázek | After interpreting one planned p-value, show why the number of related questions asked of the same data belongs to the evidence. |
| 3 | Scientific threshold | Doplňující: nula nemusí být biologicky nejdůležitější hranice | After comparing a CI with zero, reopen the biological question using a direction-specific biological threshold without teaching equivalence tests. |

## Knowledge-state ledger

| Concept block | May assume before | Introduced or earned here | Must not assume yet | Evidence or experience |
|---|---|---|---|---|
| Conditional interpretation | Students can read the fitted line and the residual diagnostics, and know effect size and uncertainty from L04. | Later conclusions about the size and uncertainty of the relationship remain conditional on the model and study design. | The p-value, null distribution or test decision that are introduced later in L05. | Use only the immediately preceding diagnostic graphs and neutral language about later model output. |
| One planned question and repeated searching | Students can interpret one p-value conditional on a model and null hypothesis. | Repeated searching increases the chance of a seemingly striking result; analysis choices belong to the evidential context. | Correction formulas, false-discovery rates or preregistration workflows. | L06 later gives a concrete example of several related questions without naming its machinery here. |
| Scientific threshold | Students distinguish effect size, CI and p-value. | A direction-specific biologically important threshold can be compared with the interval as well as zero. | Formal equivalence or non-inferiority tests. | Reuse the positive crab slope and its original units; formal methods remain beyond the course. |

## Leakage audit

- The diagnostic bridge no longer names the p-value before its formal introduction.
- The blocks do not change the lesson's null-testing workflow.
- Multiplicity is restricted to the intuitive risk of asking many related questions and is not operationalised before the L06 Tukey example.
- The biological threshold is explicitly directional, so the text does not claim that one positive boundary rules out large effects in both directions.

## Review and validation

- Independent amendment review: final cross-lesson re-review found no student-facing issue after removal of the premature p-value reference, narrowing of the multiplicity preview and clarification of the direction-specific biological threshold.
- Glossary coverage: rechecked after the L01-L08 pass; the first new occurrence of `nejistota` is wrapped, and premature `prediktor` wording was removed when the multiplicity preview was narrowed.
- Source checks: UTF-8 without BOM, no replacement characters, `git diff --check` passed.
- Render: project-native HTML and PDF render passed; all 38 PDF pages were inspected through lesson-wide contact sheets, and new-content pages 8, 26 and 31 were checked at readable size with no clipping, overlap, broken glyphs or orphaned blocks.
- Pre-existing full-artifact review note outside this amendment: model-derived values remain hardcoded in one existing figure alternative-text string.
