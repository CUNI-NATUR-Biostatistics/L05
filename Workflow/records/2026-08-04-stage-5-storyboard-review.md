# L05 presentation — Stage 5 storyboard revision

## Status

- Date: 2026-08-04
- Branch: `lesson/l05-presentation`
- Phase: Stage 5 instructor review
- Status: revised implementation awaiting further instructor review; not approved
- Presentation source: `Presentation/presentation.qmd`
- Approved written source: `Learning_materials/skripta.qmd` (unchanged)

## Reason for the redesign

The instructor judged the first deck too close to a beat-by-beat presentation of the written lesson. The redesign therefore treats the slides as a classroom story rather than as condensed skripta: it is more visual, uses shorter technical sequences, and repeatedly separates biological reality from what one study happened to observe.

The instructor subsequently reviewed the rebuilt deck slide by slide. This pass implements that detailed feedback, including the opening sequence, Czech wording, variable-role activity, model callback, null-world simulation, t and p-value sequence, error sequence, and closing composition.

## Central narrative

> **Realita existuje nezávisle na studii. Studie nám poskytne jen omezené pozorování. Statistický test se ptá, jak neobvyklé by takové pozorování bylo v jednom přesně vymezeném hypotetickém světě.**

The live story now runs:

1. a cheese Moon and the question of testability;
2. a real fiddler crab and 13 Atlantic-coast site means;
3. familiar regression tools and the observed effect;
4. biological reality versus the observation produced by one study;
5. repeated observations of the same assumed reality;
6. a zero-systematic-slope world that still contains residual variation;
7. simulated slopes, standardized distance, t reference distributions, and tail area;
8. the conditional meaning of a p-value;
9. decision rules, alpha, and Type I/II errors;
10. confidence intervals as another view of exact-zero compatibility;
11. an effect-first scientific conclusion, the Moon callback, and the L06 bridge.

## Instructor decisions implemented

### Opening and learning outcomes

- Slide 2 contains only the generated cheese Moon and `Měsíc je celý ze sýra.`
- The question to students follows on a separate slide with a smaller Moon.
- The learning outcomes now focus on:
  - distinguishing reality from what a study captured;
  - interpreting an observed effect and its uncertainty as an L04 callback;
  - explaining the p-value;
  - distinguishing possible errors in statistical decisions;
  - writing a scientific conclusion about the tested observation.
- The claim-classification activity uses four visual columns, each with its own image.

### Crab and familiar model

- The crab is introduced with a real photograph before the data.
- The repeated biological question was removed from the introduction slide.
- The live deck shows the 13 site means directly and does not teach the original individual-level data structure.
- Students identify response and predictor before seeing Bergmann's rule and predicting the trend direction.
- The fitted-data slide is titled `Lineární model` and reconnects to familiar `lm()` and `summary()` use.
- The separate 0.49-mm scaling activity and the premature biological-importance/p-value prompt were removed.

### Reality, observation, and uncertainty

- Awkward metaphoric headings were replaced with direct Czech questions.
- The central question is `Je naměřený vztah realita?`
- The follow-up asks how likely it is that the observed relationship could arise from chance under a defined zero-trend world.
- Repeated studies are revealed progressively.
- The confidence-interval display was enlarged vertically.
- `Tvar residuí` was changed to `Distribuce residuí`.
- The remaining unknown is phrased as whether the observed relationship could have arisen by chance.

### Null-world visual sequence

- The answer on the prediction slide is delayed and the correct option is emphasized with rough notation.
- The former dense 20-study slide was rebuilt as a sequence:
  1. the coloured linear-model equation and a zero systematic slope plus residuals;
  2. many datasets and fitted lines generated from that one null reality;
  3. an animation following one random dataset and the accumulating histogram of slopes;
  4. an immediate static final-frame fallback;
  5. the observed crab points and line beside the null-slope histogram with the observed slope marked.
- The animation deliberately echoes the repeated-sampling animation used in L04.

### t, df, p-value, and decisions

- The t calculation now follows the agreed concrete-to-general order: observed effect, null effect, their difference, standard error, then standardized distance.
- Nonstandard wording such as `jeden krok nejistoty` was removed.
- The tail-area sequence now varies both |t| and degrees of freedom through concrete figures.
- The p-value misconception answer is delayed and highlighted with rough notation.
- The confidence-interval decision slide now appears after Type I and Type II errors.
- The power section was removed completely from the live deck.

### Conclusion and closing

- The conclusion remains cautious without implying that statistical inference is pointless.
- It states what the 13-site study showed, why the zero-slope model is a poor explanation of the observed pattern, and which substantive claims remain outside the design.
- The Moon-return slide was recomposed around the visual callback.
- `Co si odnést` was rebuilt to remove the formatting defect and restore breathing room.

## Interaction rhythm

The revised deck contains approximately 11 meaningful interactions:

1. name an observation that could change the cheese-Moon conclusion;
2. classify four claims by whether observations could change them;
3. identify response and predictor;
4. predict the direction implied by Bergmann's rule;
5. interpret the 13-site pattern before the line appears;
6. decide whether the fitted relationship is reality or one observation;
7. predict fitted slopes in a zero-systematic-slope world;
8. construct the t statistic numerically;
9. compare t values, sample sizes, and shaded tail areas;
10. diagnose the p-value misconception and classify Type I/II errors;
11. write an effect-first conclusion for a biologist.

Formal commitment slides include a visible no-vote fallback. Fragment states preserve the question before the answer.

## Visual system

- Generated cheese Moon: opening hook and final callback.
- Four-image claim montage: Moon, white swans, passenger pigeon, and a deliberately subjective beautiful-bird image.
- Verified fiddler-crab photograph and Atlantic-coast site map.
- Recurrent 13-site scatterplot before and after the fitted line.
- Reality/observation and study-window metaphors.
- Repeated-study small multiples.
- Zero-slope equation, residual illustration, multi-study figure, animated slope histogram, and static fallback.
- t/df/tail-area plots with matched visual grammar.
- Existing Type I/II illustrations used briefly as a mnemonic before the consequential invasive-species example.

## Current scale and validation

- Rendered slide count: 43 PDF pages. The independent review led to one additional diagnostics callback slide.
- Render command: `Rscript R/render_presentation.R`.
- `Presentation/presentation.html`, `Presentation/presentation.pdf`, and `docs/index.html` rendered successfully.
- HTML/docs SHA-256: both `EFCFEA2DE5CBC1D2017A0C3B3BCBB44A9A1FF544E37BDCA3BD0044BD1AB58F3C`.
- The animation contains 124 frames and is followed immediately by a static final-frame slide.
- The complete PDF was inspected page by page.
- Initial and final HTML fragment states were inspected for the repeated-study, null prediction, t-construction, p-value misconception, and Moon-return sequences.
- Questions precede answers; no-vote fallbacks are visible on entry; rough-notation emphasis appears only after commitment.
- Source encoding is UTF-8 without BOM; image paths resolve; the two generated HTML files correspond exactly.
- `git diff --check` passed.
- `Learning_materials/skripta.qmd` remains unchanged.
- `renv::status()` reports only installed-and-recorded packages that are unused by the project; this did not block rendering.

## Human-review gate

- The revised deck is available for continued instructor review.
- It is not approved.
- No presentation changes have been staged, committed, pushed, or published.
- Remaining instructor judgments are the pacing of 43 slides in approximately 90 minutes, the desired depth of the t/df/tail-area sequence, and whether the brief pregnancy-test mnemonic has the right classroom tone.
