# L05 PollsLive retrieval quiz: harder replacement questions

- Date: 2026-10-19
- Branch: `pollslive-harder-retrieval`
- Workstream: focused post-presentation PollsLive revision
- Approver: Ondřej Mottl (human author)
- Decision: approved on 2026-10-19 in the authoring session.
- Requested revision: the author asked for the Q3 evidence to show the confidence band; it now uses the L04 band figure, and the stem and explanation refer to the band.

Integration-map status: unchanged and approved. Exact-question status: approved.

## Reason for the revision

After teaching L03 the author judged the retrieval questions far easier than the Moodle self-tests. The previous L05 set asked which column holds the estimate and offered distractors such as "lm() vybírá sklon náhodně", and its correct answer to the interval question was the longest, most qualified option. The new set asks for a computation, a comparison of two estimates and a transfer to study design. Every distractor encodes a named misconception.

## Integration map

The retrieval block keeps its approved position before `Výsledky učení`. No other slide changes.

| Position | Teaching move | Student knowledge used | Bridge |
|---|---|---|---|
| Q1 | Build an approximate 95% interval from estimate and SE | L04 model output and the ± 2 SE rule | A test compares an estimate with its uncertainty. |
| Q2 | Judge precision by the SE, not by agreement of estimates | L04 Pepa's June sample and the full data | One study gives one estimate with its own precision. |
| Q3 | Connect the SE to the spread of the predictor | L04 SE = σ̂ / √Sₓₓ | Precision depends on the design, which L05 links to power. |

## Exact production questions

The canonical text is `pollslive/quiz.json`.

| Question ID | Correct option | Key | Distractors and the misconception each encodes |
|---|---|---|---|
| `interval-ze-se` | [12,0; 14,7] min/min | B | [12,7; 14,0] (± 1 SE); [11,3; 15,3] (± 2 minutes); [8,4; 18,3] (SE of the intercept) |
| `presnost-dvou-vyberu` | celý soubor, menší SE | D | similar estimates mean equal precision; the larger sample's estimate is the true slope; right study for the wrong reason (95 % of eruptions in the interval) |
| `plan-dalsiho-mereni` | 50 eruptions spread from 1,5 to 5 min | A | eruptions near the mean (add almost nothing to Sₓₓ); removing extreme eruptions (shrinks Sₓₓ, widens the interval); a 99% interval (higher level, wider interval) |

Changes from the approved proposal, kept within its meaning: Q2 shows the two rows as an evidence card, and the stem no longer repeats the numbers. Q2 option B quotes 13,34 instead of 13,3 to match the card. In Q3 the near-mean option replaced "all around 4,5 min": 4,5 min is far from the mean of 3,6 min, so it also narrows the interval noticeably and blurred the contrast. Option A's range was adjusted to 1,5–5 min to match the observed 1,65–4,83 min.

Checked numbers (fresh R session, 117 eruptions): slope 13,335 (SE 0,657), intercept 45,91 (SE 2,47); June subset of 39 eruptions: slope 12,92 (SE 1,12). With the printed rounded values, 13,34 ± 2 · 0,66 = [12,02; 14,66].

## Knowledge-state ledger

| Item | Available before quiz? | Evidence in L04 |
|---|---|---|
| Estimate and SE in `summary()` output | yes | learning materials `Kde ve výstupu najdeme velikost a přesnost?` |
| Approximate interval as estimate ± 2 SE | yes | learning materials on the margin of error; Moodle family `ci-z-se` |
| Pepa's June estimate against other samples | yes | learning materials `Pepa: jeden měsíc, jeden odhad` |
| SE = σ̂ / √Sₓₓ; SE shrinks with more, well-spread observations | yes | learning materials `Jak se standardní chyba sklonu počítá?` |

## Evidence

| Asset | Source | SHA-256 |
|---|---|---|
| `l04-odhad-a-se.png` | rendered by `R/render_pollslive_assets.R` (printed coefficient table) | `5968c909677c89e996b74bbd9981aa70030b49aae9bb12e94384a8f507a0dd5c` |
| `l04-dva-vybery.png` | rendered by `R/render_pollslive_assets.R` | `894a9d5021a4c6308b4c69c67c229ef4534d67c34b9e101a778374c6702e3e62` |
| `l04-pas-spolehlivosti.png` | byte-identical copy of L04 `Presentation/Materials/pas_spolehlivosti.png` (confidence band, dashed line at the mean eruption length) | `4c6aa5a520629f857241c813bdf7a03f9b70beaec3aaa631ac2edf124f7c489f` |

The previous assets `l04-one-hundred-estimates.png`, `l04-estimate-standard-error.png` and `l04-confidence-interval-coverage.png` are removed.

## Answer key and course balance

L05 key: B D A. The course-wide table is in L04 `Workflow/records/2026-10-19-pollslive-harder-retrieval.md`: across L02-L08 and L10 each position is correct six times and twice at each question number.

## Validation

- `node pollslive/validate.mjs`: passed without credentials.
- `Rscript R/verify_pollslive_assets.R`: passed.
- Offline render: see the review section.

## Review

Independent read-only review: completed on 2026-10-19 by a separate reviewer subagent (canonical prompt `.ai/agents/vision-corrector.md`, scoped to the retrieval block of L04, L05, L06, L07, L08 and L10; a capable general-purpose model, chosen because the task is a focused content review of 18 short items). No blockers: every keyed answer was confirmed correct, every distractor wrong, and the course-wide key balance verified.

Should-fix, resolved: Q3 relied on the SE formula section of the L04 learning materials (core section `Jak se standardní chyba sklonu počítá?`; the L04 deck shows only that the band is narrowest at the mean); the stem now says the band shows the uncertainty of the mean trend and asks for a more precise slope. Option D (converting to seconds, which literally narrows the interval in other units) was replaced by "99% interval instead of 95%". Minor, resolved: the explanation no longer uses the Sₓₓ glyph, which rendered with a fallback font in the PDF.

Focused re-check of these corrections by the same reviewer: pending.

## Operational boundary

No staging, commits, pushes, live PollsLive operations, response submissions or activation changes were made.
