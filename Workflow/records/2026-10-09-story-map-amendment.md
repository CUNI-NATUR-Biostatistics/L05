# L05 story-map amendment after the 2026-10-09 review polish

- Scope: the restructured opening and ending of `Learning_materials/skripta.qmd` and the complete slide sequence of `Presentation/presentation.qmd` after the 2026-10-09 polish (see `2026-10-09-review-polish.md`).
- Story-map status: complete. The heading strips below were read as a continuous student-facing sequence, and the knowledge-state ledgers were checked against the source order.
- Human story-map approval (learning materials): approved by Ondřej Mottl on 2026-10-09; decision: approve the current story map and knowledge-state ledger; requested revisions: none.
- Human story-map approval (presentation): approved by Ondřej Mottl on 2026-10-09; decision: approve the current story map and knowledge-state ledger; requested revisions: none.
- Approval evidence: in response to the commit plan identifying both approvals as pending, Ondřej Mottl wrote "A approve the story map". This records approval of both amendments after the polish; it does not change the chronology of the earlier drafting or constitute final artifact-review or release approval.

## Learning materials story map

| Order | Internal role | Student-facing heading | Speaker note |
|---|---|---|---|
| 1 | Bridge from the previous lesson; science-and-truth hook | Úvod | Name the two unexplained `summary()` columns as the reason for this lesson; open the question of what evidence allows us to claim. |
| 2 | Testability vs plausibility with playful claims | Měsíc ze sýra? (H3) | Four claims, a folded answer table, the asymmetry of extinction claims, and a quick check with a folded answer. |
| 3 | Learning outcomes (all five syllabus outcomes) | Výsledky učení | Order matters: effect and uncertainty come before the p-value. |
| 4 | Main biological question, dataset, visible data check | Každý řádek je jedno slanisko | Bergmann's rule as a prediction; `read.csv()`, `str()`, `summary()` and missing values; computed ranges; full table; map; optional data-preparation boxes. |
| 5 | Familiar model as the anchor; effect in original units | Co říká známá přímka? | Prediction before the graph; grey points and a purple line; `lm()`, `summary()`, `confint()`. |
| 6 | Routine diagnostics after fitting | Dobrá praxe: po každém modelu zkontrolujeme residua (H3) | Residual density and residuals vs fitted values; cautious reading with few sites. |
| 7 | Biological size of the effect | Co znamená sklon v milimetrech na stupeň? (H3) | Rescale to the chosen difference and the full range; folded answer on biological importance. |
| 8 | Uncertainty callback | Jeden odhad nestačí | SE and CI recalled from the previous lesson. |
| 9 | Null world built by simulation; H0/H_A named after the encounter | Co kdyby ve skutečnosti žádný trend nebyl? | Sceptical colleague; zero systematic slope plus residuals; 20 studies, then many slopes. |
| 10 | Standardised distance (t) with the four-stage equation | Jak daleko jsme od vodorovné přímky? | Text-only equation, substitution, symbols; t is not the biological effect size. |
| 11 | Degrees of freedom via analogies | Malá odbočka: kolik volnosti zbývá? (with H3s Sudoku, Čtyři čísla s průměrem 10, Zpět ke krabům, Proč jsme s malým počtem lokalit opatrnější?) | Analogy limits named in a folded answer; heavier tails explained with an illustrative bound only. |
| 12 | p-value as a tail area; misconception repair | Jak neobvyklé by bylo naše t v nulovém světě? (H3 Tři studenti čtou stejný výsledek) | Orange p-value area; Anna/Boris/Cyril; what the p-value is not; optional multiple-testing box. |
| 13 | Decision rule, critical values, CI equivalence | Když musíme udělat rozhodnutí (H3 Kritické hodnoty, Stejnou otázku můžeme položit intervalu) | α chosen beforehand; the historical table bridged to `qt()`/`pt()`; "statisticky významný" defined before use; optional equivalence box. |
| 14 | Type I/II errors and illustrative power | Dva způsoby, jak se splést (H3 Rychlá paměťová pomůcka, Biologický příklad: invazní druh, Když skutečný vztah přehlédneme, Kolik studií vztah odhalí?) | Error terms "chyba I./II. typu"; power simulated for pre-chosen scenarios only, with an explicit caveat. |
| 15 | Return to the biological question; full conclusion | Co tedy můžeme říct o krabech? (H3 Co se do jedné přímky nevešlo) | Compare sentences A and B; conclusion table; model answer; limitations including computed leave-one-out. |
| 16 | Close the Moon arc | Měsíc pořád není ze sýra | The p-value answers a narrow question; main idea box. |
| 17 | Bridge to the next lesson | Co bude následovat dál | Categorical predictor and a difference between groups; the same reasoning order. |
| 18 | Key ideas | Shrnutí | Mirrors the learning outcomes. |
| 19 | Closing conceptual question | Závěrečná otázka (H3) | Three questions before trusting a "p < 0,05" headline; folded answer. |

### Learning-materials knowledge-state ledger

| Block | May assume | Introduces | Must not yet assume | Evidence that makes it understandable |
|---|---|---|---|---|
| 1–3 | Estimate, SE, CI, `summary()` from the previous lesson | Testability vs plausibility | H0, p-value, t | Four everyday claims and the cheese Moon |
| 4–7 | Simple linear model, residual plots | Site as the observational unit; effect in mm per degree; biological importance | Any test result | Visible data check, scatter plot, rescaled effect figure |
| 8 | SE and CI | — | p-value | The CI figure |
| 9 | Residuals, residual SD | Null world; H0 and H_A as named possibilities | t, p-value | 20 simulated studies and the histogram of null slopes |
| 10 | SE, null world | t as a standardised distance | Reference t distribution, p-value | Table of known numbers and the substitution |
| 11 | t | Degrees of freedom; heavier tails at small df | The p-value as a named quantity | Sudoku, the fixed-mean example, t curves with an illustrative bound |
| 12 | t, df, reference curve | p-value as a two-sided tail area | α, significance | The tail-area figure and the summary output |
| 13 | p-value | α, critical values, "statisticky významný", CI equivalence | Error types | Critical-value table and figure; CI against zero |
| 14 | Decision rule | Type I/II errors; power for chosen scenarios | Formal power planning | Pregnancy mnemonic, invasive-species table, power simulation |
| 15–19 | All of the above | Full conclusion order and limitations | Causal claims | Sentence comparison, conclusion table, leave-one-out range |

## Presentation story map

| Order | Internal role | Student-facing heading | Speaker note |
|---|---|---|---|
| 1 | Question-first title | Co nám statistický test dovoluje tvrdit? | — |
| 2 | Absurd claim hook | Měsíc je celý ze sýra! | Laughter, then: how would we know? |
| 3 | Falsification prompt | Co by mohlo změnit váš závěr? | Partner talk; testable but implausible. |
| 4 | Testability across four claims | Která tvrzení mohou pozorování změnit? | Swans, pigeon asymmetry, value judgement. |
| 5–8 | Previous-lesson retrieval (generated PollsLive block; the synchronized variant adds QR and results slides) | Co si pamatujete z minulé lekce? + three quiz questions | Approved separately in `2026-09-16-pollslive-retrieval-quiz.md`. |
| 9 | Bridge from interval to null value | Od intervalu k nulovému tvrzení | One exact value tested against the data. |
| 10 | Learning outcomes (5) | Výsledky učení | Effect and uncertainty come before the p-value. |
| 11 | Section divider | Co z reality skutečně pozorujeme? | — |
| 12 | Organism | Seznamte se: krab houslista | We measure carapace width. |
| 13 | Sites and observational unit | Slaniska podél Atlantiku | One point = one site. |
| 14 | Predictor/response vote | Kterou proměnnou chceme vysvětlit? | Latitude stands in for temperature and season. |
| 15 | Biological prediction | Bergmannovo pravidlo | A prediction, not a fact. |
| 16 | Data first | Co ukazují data? | Describe direction and spread before any line. |
| 17 | Familiar model | Lineární model | Grey data, purple model. |
| 18 | Familiar output; open columns | `summary()` | t value and Pr(>|t|) are not readable yet. |
| 19 | Reality vs estimate | Je naměřený vztah realita? | Two questions on the slide. |
| 20 | Reality seen through the study window | (blank heading) | Selection, measurement and local differences. |
| 21 | Source of variation | Stejná realita, jiné pozorování | Grey dashed = assumed relation; purple = each study's fit. |
| 22 | Uncertainty callback | Jak široké je naše okno do reality? | Estimate, CI, few sites. |
| 23 | Routine diagnostics | Rychlá kontrola modelu | Look for arcs and funnels only. |
| 24 | Known vs unknown | Co už víme — a co stále nevidíme? | The last bullet bridges to the null world. |
| 25 | Section divider | Co kdyby žádný trend nebyl? | — |
| 26 | MCQ prediction | Co bychom pozorovali bez trendu? | B is correct; verified next. |
| 27 | Null-world equation | Jak náhoda vytvoří nenulový sklon? | Grey observation, purple systematic part, orange residual. |
| 28 | Small multiples | Nulový trend, různé odhadnuté přímky | Find the steepest lines. |
| 29 | Animation | Sledujte cestu jednoho náhodného sklonu | Watch one full cycle. |
| 30 | Static final frame | Po N nulových studiích | Predict where our slope belongs. |
| 31 | Our slope against the null histogram | Stejný nulový svět, ale s naším pozorováním | Far outside most simulations. |
| 32 | Numbers needed for the distance | Jak vzdálené je naše pozorování od nuly? | Students divide the difference by the SE. |
| 33 | t named after the calculation | Vzdálenost ve standardních chybách | Not the effect size. |
| 34 | Reference t distribution; p-value | Kolik plochy zůstává za \|t\|? | Curve = t values in the null world, total area 1; definition revealed as a fragment. |
| 35 | Larger \|t\| gives a smaller area | Co udělá větší hodnota \|t\|? | Illustrative values, same number of sites. |
| 36 | More sites at the same \|t\| | Více lokalit při stejném \|t\| | df = n − 2 explained in words. |
| 37 | Misconception MCQ | Která věta čte p-hodnotu správně? | Partner convince; B is correct. |
| 38 | What a small p says and does not say | Co nám malá p-hodnota řekne — a co ne? | — |
| 39 | Name the null world: H0 and H_A | Nulová hypotéza pojmenuje nulový svět | Sites may still differ under H0. |
| 40 | Section divider | Kdy musíme udělat rozhodnutí? | — |
| 41 | Decision context | Někdy nestačí popisovat — musíme jednat | Costs of intervening vs waiting. |
| 42 | α | Kolik falešných poplachů jsme ochotni připustit? | Chosen before looking at the data. |
| 43 | Critical values | Kde začíná krajních 5 % nulového světa? | From printed tables to R. |
| 44 | Decision rule | Rozhodovací pravidlo volíme předem | Not rejecting is not proof of zero. |
| 45 | Error mnemonic tied to H0 | Co když se spleteme? | Null state = no pregnancy. |
| 46 | Classify errors; severity | Invazní druh: která chyba je která? | Severity depends on consequences. |
| 47 | Section divider | Co tedy můžeme tvrdit? | — |
| 48 | Wrong conclusion critique | „p < 0,05, proto je hypotéza pravdivá“ | Students find the errors first. |
| 49 | CI equivalence | Ke stejné nule se můžeme vrátit intervalem | The interval also gives compatible effect sizes. |
| 50 | Writing task with evidence card | Napište výsledek pro biologa | Order: effect, uncertainty, test, limits. |
| 51 | Model answer | Jedna možná odpověď | Includes biological meaning. |
| 52 | Return to the question | Co nám studie ukázala? | What remains open. |
| 53 | Close the Moon arc | A co sýrový Měsíc? | Tests do not prove truth. |
| 54 | Section divider | Závěr | — |
| 55 | Bridge to the next lesson | Platí stejná logika i pro dvě skupiny? | Same reasoning for a difference between groups. |
| 56 | Key ideas | Shrnutí | Mirrors the outcomes. |
| 57 | Closing conceptual question | Co potřebujete vidět, než napíšete „p < 0,05, takže severní krabi jsou větší“? | Expected questions listed in the notes. |

### Presentation knowledge-state ledger

| Slides | May assume | Introduces | Must not yet assume | Evidence |
|---|---|---|---|---|
| 1–10 | Previous lesson (retrieval) | Testability vs plausibility | H0, p | Four claims, quiz evidence |
| 11–24 | Linear model, SE, CI, residual plots | Reality vs study; source of variation | Any test | Scatter, repeated studies, CI, residual plots |
| 25–31 | Residuals | Null world (informal) | The term "nulová hypotéza" | Equation, small multiples, animation, histogram |
| 32–36 | SE | t; reference t distribution; p-value; df = n − 2 | α, significance | Table, substitution, tail-area figures |
| 37–39 | p-value (informal null world) | Misconception repair; H0/H_A named | Decision rule | MCQ, contrast panels, null-world figure |
| 40–46 | H0, p | α, critical values, decision rule, Type I/II errors | — | Invasive-species scenario, critical-value figure, mnemonic |
| 47–57 | All of the above | Conclusion order, limitations | Causal claims | Critique, CI against zero, writing task, summary |
