# Presentation standards rollout

## Scope

- Date: 2026-09-16
- Branch: `lesson/l05-presentation-standards`
- Requirements: Issues #5, #6, and #8; Issue #7 is tracked in `2026-09-16-pollslive-retrieval-quiz.md`

## Decisions

- The first slide uses the approved question-first course title composition and canonical logo.
- The approved cheese-Moon illustration is retained. Every occurrence now has context-specific Czech alternative text, and the opening occurrence retains the visible AI disclosure.
- The original generation tool and prompt are not recoverable from repository history or the existing workflow records. They are recorded as unknown rather than reconstructed.
- One hidden `broom::tidy(mod_krabi, conf.int = TRUE)` object supplies the displayed coefficient table, slope, standard error, test statistic, p-value, and confidence interval. `tinytable::tt()` replaces the former `summary(...)$coefficients` plus `knitr::kable()` table path. The visible `summary(mod_krabi)` teaching call remains.
- A render-time assertion compares tidy estimates with `coef(mod_krabi)`.

## Retained illustration provenance

- File: `Presentation/Materials/mesic_ze_syra.png`
- Known: AI-generated illustration; conceptual role is a humorous falsifiable claim used to frame evidence and revision of conclusions.
- Unknown: original generation tool, exact prompt, date, and generation settings.
- SHA-256: `431ACAF837DEE7B68B09042ED9C2DD25572A3DFF1D28279485DE9E4084A80338`

## Validation status

- The render-time assertion confirms the tidy estimates equal `coef(mod_krabi)`.
- Canonical render: passed; HTML and PDF contain 55 slides, and `Presentation/presentation.html` matches `docs/index.html` by SHA-256.
- Visual inspection: passed, including the title at 1600 × 900 and 1280 × 720, the coefficient table, and the retained illustration metadata.
- UTF-8, duplicate chunk-label, R parsing, and focused diff checks: passed.
- `broom` and `tinytable` are consistent direct source dependencies. `renv::status()` still reports unrelated packages that were already installed and recorded but unused; no broad pruning or snapshot was performed.
- Independent read-only presentation review: passed; no remaining finding.
- The approved three-question PollsLive retrieval block is implemented and validated offline; see `2026-09-16-pollslive-retrieval-quiz.md` for evidence, independent review, and remote activation gates.
- Git publication: follow-up authorization granted on 2026-09-16; review and merge state is tracked in the lesson PR.
