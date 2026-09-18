# L05 PollsLive retrieval quiz: integration map and exact questions

- Date: 2026-09-16
- Branch: `lesson/l05-presentation-standards`
- Workstream: focused post-presentation standards retrofit

Integration-map status: approved.

Exact-question status: approved.

Human approval: approved by the human author in this session on 2026-09-16, without requested revisions.

## Scope and integration map

The retrieval block is inserted before `Výsledky učení` and before the existing claim-classification activity. It retrieves the L04 concepts needed for hypothesis testing and is followed by the learning outcomes and `Od intervalu k nulovému tvrzení`.

| Position | Teaching move | Student knowledge used | Bridge |
|---|---|---|---|
| Q1 | Recognize sampling variability | L04 repeated observers | One study supplies one estimate. |
| Q2 | Distinguish estimate from SE | L04 annotated model output | Testing compares an estimate with its uncertainty. |
| Q3 | Interpret 95% confidence correctly | L04 coverage sequence | L05 asks how compatible data are with a specified null value. |

## Exact production questions

### Q1 — repeated samples

**Evidence:** approved L04 figure `Presentation/Materials/geyserwatch_100_hlaseni.png`.

**Question:** Proč sto pozorovatelů nedostalo ze svých výběrů přesně stejný sklon?

1. Každý pracoval s jiným výběrem pozorování. — **correct**
2. Skutečný vztah se po každém výpočtu změnil.
3. Funkce `lm()` vybírá sklon náhodně.
4. Sklon nemá s daty souvislost.

**Explanation:** Výběry obsahují různá pozorování, a proto se jejich odhady liší. Této změně mezi výběry říkáme výběrová variabilita.

### Q2 — estimate versus precision

**Evidence:** faithful L04 coefficient row with columns `Estimate` and `Std. Error`.

**Question:** Které číslo popisuje velikost odhadnutého vztahu mezi délkou erupce a čekáním?

1. Hodnota ve sloupci `Estimate` — **correct**
2. Hodnota ve sloupci `Std. Error`
3. Počet řádků tabulky
4. Název prediktoru

**Explanation:** `Estimate` je odhad sklonu. `Std. Error` popisuje přesnost tohoto odhadu.

### Q3 — confidence interval

**Evidence:** approved L04 figure `Presentation/Materials/sto_intervalu_pokryti.png`.

**Question:** Co v tomto opakovaném postupu znamená označení „95% interval spolehlivosti“?

1. Při opakování stejného postupu přibližně 95 % takto vytvořených intervalů pokryje skutečný parametr. — **correct**
2. Vypočtený interval má po výpočtu 95% pravděpodobnost obsahovat pevný parametr.
3. Uvnitř intervalu leží 95 % jednotlivých pozorování.
4. Odhad je s pravděpodobností 95 % bez chyby.

**Explanation:** 95 % popisuje dlouhodobou úspěšnost postupu při opakovaných výběrech, nikoli pravděpodobnost jednoho již vypočteného intervalu.

## Knowledge-state ledger

| Item | Available before quiz? | Evidence |
|---|---|---|
| Estimates vary across samples | yes | L04 observer and simulation sequences |
| Estimate and standard error answer different questions | yes | L04 model-output block |
| Repeated-sampling meaning of 95% confidence | yes | L04 coverage sequence |
| Null hypothesis, t statistic, p-value, decision errors | no | introduced in L05 |

## Evidence and accessibility

The two L04 figures are copied byte-identically and pinned by SHA-256; the coefficient row is rendered from the approved L04 model. All artifacts have Czech alt text and provenance and remain available in the offline HTML/PDF fallback.

## Implementation and validation

- `pollslive/quiz.json` uses schema version 2 and contains the three approved questions.
- The standard include is placed after the opening question and before the learning outcomes; the approved bridge follows the outcomes.
- `node pollslive/validate.mjs` passes without credentials.
- All R chunks parse; checked source files are UTF-8 without BOM or replacement characters; no duplicate chunk labels were found.
- Offline PollsLive rendering completed through the canonical presentation wrapper. The final PDF has 55 pages, and `Presentation/presentation.html` is byte-identical to `docs/index.html`.
- The generated `active.qmd`, `offline.qmd`, and `static.qmd` each contain all three questions and no development URL or placeholder.
- Focused PDF inspection covered the quiz fallback and the bridge.

### Final evidence checksums (SHA-256)

- `pollslive/assets/l04-one-hundred-estimates.png`: `36575E899AE4D2D030F72A74834849118A1B105E5A4D4CBC30BEE2ABCD5FD301`
- `pollslive/assets/l04-estimate-standard-error.png`: `CB27F7D879B3BBCAFCBB558868C6F19398A8E1145346476D643656FBC7C055C3`
- `pollslive/assets/l04-confidence-interval-coverage.png`: `FF6F5A6C21E6D657B27B74F7F0EB7031519872F2565B54B5B597A040BC5EECC8`
- `pollslive/source/old_faithful_2024.csv`: `6ED35A5ADBE56E575A48BAEE84BC4D939BE5339765751F81E174E7D007A0F9F3`

## Independent review

The first read-only review found answer-revealing evidence in L03 Q1 and L04 Q1/Q2, literal Markdown markers in fallback text, and incomplete workflow evidence. The evidence cards and quiz text were corrected and rerendered. The focused read-only re-review passed with no content or rendering blockers. It confirmed neutral L03 Q1 evidence, non-revealing L04 Q1/Q2 cards, clean fallback text, matching evidence hashes, approved include positions and bridges, and valid final PDFs.

## Operational limitations

Remote PollsLive synchronization, remote setting verification, QR/link testing on a second device, and schedule activation require an immutable pushed lesson commit and therefore remain pending. No remote poll operation was performed and no production response was submitted. Activation remains disabled.

## Dependency note

`renv::status()` reports 16 already recorded and installed packages that are no longer used by current source. The focused lockfile change adds the newly used direct dependency `tinytable`; `broom` was already recorded. The stale unused entries were left unchanged to avoid unrelated dependency pruning.

## 2026-09-18 author feedback revision

The existing PollsLive include now appears after the opening question and before `Výsledky učení`; quiz content and evidence remain unchanged.

Validation: canonical offline render passed; the 55-page PDF has retrieval on page 4 and outcomes on page 8, and HTML matches `docs/index.html`. The local `_internal` client was used because the pinned cache is absent.
