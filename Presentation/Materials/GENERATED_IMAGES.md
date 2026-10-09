# L05 generated images: placements and prompts

This file records every AI-generated image used or proposed for the L05 presentation, as required by `_internal/.ai/authoring/presentation.md` ("Lesson illustration series" and "Required lesson-derived title image"). Each entry lists the target slide, teaching role, generation prompt, Czech alt text and status. When an image is generated, fill in its provenance row (tool, date, file name, SHA-256).

Slide numbers refer to the 57-slide deck of 2026-10-09 (static PDF variant).

## Shared style rules

These rules follow the established series (L01 animals, L02 penguins, L03 botanist, L04 Yellowstone bison, marmot and raven):

- **Characters for L05:** a small team of Atlantic marsh fiddler crabs (*Minuca pugnax*; males with one oversized claw) as careful field researchers. Their recurring sceptical colleague is a great blue heron in a lab coat; crabs and herons are a natural predator–prey pair, which keeps the humour gentle. The cheese Moon from slide 2 may reappear as a small callback.
- **Style:** warm storybook natural-history watercolour/gouache with gentle academic humour; natural anatomy; clean silhouettes; readable from the back of a lecture hall.
- **Brand palette as accents:**
  - graphite `#2E2E2E`;
  - grey `#8A8A8A`;
  - indigo `#5D2890`;
  - amethyst `#86579E`;
  - orange `#F3A712`;
  - parchment `#F4F1EC`.
- **Keep the deck's colour meaning inside the pictures:**
  - grey = observed data;
  - purple = model, estimate or measuring units (standard errors);
  - dark graphite = reference or zero;
  - orange only as a small accent for "our" observation or the current focus.
- **Do not include** text, numbers, letters, logos, watermarks, axes, charts or data claims.
- **Title-composite exception requested on 2026-10-09:** the current title combines new illustrations with schematic motifs from actual lesson figures. Its two research cards may show unlabelled axes, a point cloud with a rising fitted line and a null-distribution histogram. These are illustrative motifs, not quantitative teaching figures; no values or test outcome are displayed.
- **Never reveal an answer:** do not place an image on a prediction or MCQ slide where it would give the answer away, and do not draw a result students are about to estimate.
- **On the slide:**
  - Czech `fig-alt`;
  - a small visible disclosure, „Ilustrace vytvořená pomocí AI.“ (`.text-size-tiny .text-right`, as in L04);
  - a speaker note explaining the metaphor.
- The fiddler-crab photograph (Natalia Agudelo / SERC, CC BY 2.0) and the existing cheese-Moon illustration stay unchanged.

## Existing generated images

### `mesic_ze_syra.png`: cheese Moon (slides 2, 3, 4 and 53)

- Status: approved and in use. The AI disclosure is visible on slide 2. Provenance is recorded in `Workflow/records/2026-09-16-presentation-standards.md`.

### `chyba_i_falesne_pozitivni.jpg`, `chyba_ii_falesne_negativni.jpg`: Type I/II mnemonics (slide 45)

- Status: retained in use. These are deliberately absurd pregnancy-test illustrations, as in the learning materials. No original generation tool, prompt or date was found in the local workflow records; these fields remain unknown. SHA-256: `chyba_i_falesne_pozitivni.jpg` = `C4473F17924C95D164C13D1C82F374540A74CCCB1FC6B0EAA00AD1E127260228`; `chyba_ii_falesne_negativni.jpg` = `B049E40223501B264D64CCA6324792CDC85557AAC4B853734E4F3F35EC9D9068`.

## Reserved slots in the deck

Each proposed illustration already has a reserved slot on its slide. The slot calls `include_optional_figure()` (`R/Functions/include_optional_figure.R`) with the suggested file name.

- To place an image, save it under exactly that name in `Presentation/Materials/` and re-render. The image, its alt text and the visible disclosure (`ai_disclosure()`) appear automatically.
- Until an image is generated:
  - slides 19 and 39 show their previous figure (the anchor graph and the null-world figure) with matching alt text;
  - slides 32, 41 and 52 leave the space empty;
  - no disclosure caption is shown.
- After generating an image, fill in its provenance row below.

## Proposed illustrations

### 1. Our window onto the marsh: slide 19 „Je naměřený vztah realita?“ (recommended)

- Placement: left column, replacing the third repetition of the scatter plot (it already appears on slides 17 and 20). The two questions stay on the right.
- Layout correction (2026-10-09): the portrait fills a 36% left column, with the AI disclosure directly beneath it; the questions occupy a 60% right column in the shared vertically balanced stack. Removed the spacer above the picture and the oversized empty image-column area. The affected slide was visually checked in offline HTML at 1600 × 900 and 1280 × 720 and in PDF; the image, heading, questions and disclosure fit without overlap. QA evidence: `Temp/image-qa/html-slide19-fixed-1600x900.png`, `html-slide19-fixed-1280x720.png`, `pdf-slide19-fixed.png` and `slide19-layout-report.json`.
- Teaching role: a study sees reality only through a small window. The fitted line is a view, not the marsh itself.
- Suggested file: `krabi_okno_do_reality.png`
- Draft alt text: „Humorná ilustrace kraba houslisty s deskami, který se dívá malým dřevěným oknem terénní stanice na rozlehlé slanisko; vidí jen jeho výsek. Ilustrace vytvořená pomocí AI.“
- Prompt:

```text
Use case: illustration-story / scientific-educational. Asset type: painted illustration for the left column of a 16:9 Czech university biostatistics slide, matching a course illustration series.
Scene: inside a tiny rustic salt-marsh field station, a male Atlantic marsh fiddler crab (Minuca pugnax, one oversized claw) in a little field vest stands on a crate and peers through a small square wooden window. Through the window we see only a cropped slice of a vast golden-green salt marsh with tidal creeks, other crabs and their burrows; most of the marsh continues beyond the window frame and is only hinted at around it. On the crab's clipboard: a few small grey dots and one short purple line. Gentle humour: the crab squints with great concentration, its big claw resting on the windowsill.
Teaching purpose: our study sees reality only through a limited window. Do NOT draw any chart axes, numbers or labels on the clipboard.
Style: warm storybook natural-history watercolour/gouache, natural crab anatomy, clean silhouettes.
Palette: marsh in natural greens and ochres; window frame and station wood parchment #F4F1EC and graphite #2E2E2E; clipboard dots grey #8A8A8A, short line indigo #5D2890; crab vest amethyst #86579E; one small orange #F3A712 accent (a pencil).
Composition: portrait about 4:5, window and crab clearly readable at about 500 px width.
Text: none. NO TEXT, NO NUMBERS, NO LETTERS, NO logos, NO watermark.
```

### 2. Measuring in standard errors: slide 32 „Jak vzdálené je naše pozorování od nuly?“ (recommended)

- Placement: right of the table of known numbers, above the question. Shrink the table width to about 55 %.
- Teaching role: the distance from zero is counted in identical purple "standard-error rods". This is the idea of t without any numbers. The slide asks for the count, so the image must not show a countable answer.
- Suggested file: `krabi_mereni_v_se.png`
- Draft alt text: „Humorná ilustrace dvou krabů houslistů, kteří na bahnité pláži odměřují vzdálenost od tmavého kolíku k oranžovému praporku stejně dlouhými fialovými tyčkami. Ilustrace vytvořená pomocí AI.“
- Prompt:

```text
Use case: illustration-story / scientific-educational. Asset type: transparent painterly cutout for the right column of a 16:9 Czech university biostatistics slide, matching a course illustration series.
Scene: on a smooth mudflat, two male Atlantic marsh fiddler crabs work as a surveying team. A dark graphite wooden stake marks the start; far away a small orange pennant marks their own observation. Between them the crabs carefully lay identical purple measuring rods end to end; one crab carries the next rod on its big claw like a beam, the other checks alignment with a tiny spirit level. The row of rods is partly hidden behind a tuft of marsh grass so the number of rods cannot be counted.
Teaching purpose: distance measured in equal units (standard errors). Do NOT show numbers, tick marks, a ruler scale or a countable complete row.
Style: warm storybook natural-history watercolour/gouache, natural anatomy, clean silhouettes.
Palette: rods indigo #5D2890 and amethyst #86579E; stake graphite #2E2E2E; pennant orange #F3A712; mud and sand parchment #F4F1EC with grey #8A8A8A shadows.
Composition: wide, roughly 3:2, all elements inside the frame with transparent padding; readable at about 550 px width.
Text: none. NO TEXT, NO NUMBERS, NO LETTERS, NO logos, NO watermark. True transparent background, clean alpha edges.
```

### 3. The sceptical colleague: slide 39 „Nulová hypotéza pojmenuje nulový svět“ (recommended)

- Placement: left column, replacing the repeated null-world plot (shown on slide 27). The H0, H_A and explanation boxes stay on the right.
- Teaching role: puts a face on the null hypothesis. It matches the skripta's "skeptická kolegyně", who says the rising points may be chance. It sits after the p-value MCQ, so it does not reveal any answer.
- Suggested file: `volavka_skepticka_kolegyne.png`
- Draft alt text: „Humorná ilustrace volavky v laboratorním plášti, která s pozvednutým obočím pokrčuje křídly nad deskami krabího týmu; krab houslista jí ukazuje rostoucí řadu teček. Ilustrace vytvořená pomocí AI.“
- Prompt:

```text
Use case: illustration-story / scientific-educational. Asset type: transparent painterly cutout for the left column of a 16:9 Czech university biostatistics slide, matching a course illustration series.
Scene: a tall great blue heron in a neat white lab coat and small round spectacles, the friendly but sceptical colleague, leans down with one raised eyebrow and a gentle shrug of the wings. A small male Atlantic marsh fiddler crab proudly holds up a clipboard with a few grey dots rising slightly from left to right. The heron points one wingtip at a flat graphite line drawn on her own clipboard, as if saying "maybe there is no trend at all". The crab keeps a polite safe distance; gentle humour about predator and prey working as colleagues.
Teaching purpose: the null world is a precise competing possibility (zero trend), not an accusation. Do NOT show numbers, axes, labels or a p-value.
Style: warm storybook natural-history watercolour/gouache, natural heron and crab anatomy, clean silhouettes.
Palette: heron in natural blue-grey with graphite #2E2E2E details; lab coat parchment #F4F1EC; dots grey #8A8A8A; the heron's flat line graphite #2E2E2E; small accessories in indigo #5D2890 and amethyst #86579E; one restrained orange #F3A712 accent (the crab's pencil).
Composition: portrait about 4:5, both characters fully visible with transparent padding; readable at about 500 px width.
Text: none. NO TEXT, NO NUMBERS, NO LETTERS, NO logos, NO watermark. True transparent background, clean alpha edges.
```

### 4. One invasive crab in the trap: slide 41 „Někdy nestačí popisovat — musíme jednat“ (recommended)

- Placement: below the bold sentence and the question, centred, about 45 % of the slide width.
- Teaching role: makes the decision under uncertainty concrete. The European green crab (*Carcinus maenas*) is a real invasive species on the US Atlantic coast. The image shows the dilemma, not the decision.
- Suggested file: `krabi_invazni_past.png`
- Draft alt text: „Humorná ilustrace dvou krabů houslistů u monitorovací pasti, ve které sedí jeden zelený krab; jeden houslista drží píšťalku na poplach, druhý dalekohled a gestem naznačuje počkat. Ilustrace vytvořená pomocí AI.“
- Prompt:

```text
Use case: illustration-story / scientific-educational. Asset type: transparent painterly cutout for a 16:9 Czech university biostatistics slide, matching a course illustration series.
Scene: at the edge of a tidal creek, a small mesh monitoring trap holds a single European green crab (Carcinus maenas, clearly a different, green-shelled species). Two male Atlantic marsh fiddler crabs in tiny ranger hats stand beside it in friendly disagreement: one raises an orange alarm whistle, ready to call for intervention; the other holds binoculars and gestures "wait, let's keep watching". Gentle humour; no one is wrong yet.
Teaching purpose: a decision must be made under uncertainty, and both possible mistakes have costs. Do NOT show which choice is right, any numbers, signs or labels.
Style: warm storybook natural-history watercolour/gouache, accurate anatomy for both crab species, clean silhouettes.
Palette: green crab in natural olive green; fiddler crabs in natural colours with indigo #5D2890 and amethyst #86579E ranger hats; trap graphite #2E2E2E; creek and sand parchment #F4F1EC with grey #8A8A8A; whistle orange #F3A712 as the single accent.
Composition: wide, roughly 16:9, all elements inside the frame with transparent padding; readable at about 600 px width.
Text: none. NO TEXT, NO NUMBERS, NO LETTERS, NO logos, NO watermark. True transparent background, clean alpha edges.
```

### 5. Presenting a careful conclusion: slide 52 „Co nám studie ukázala?“ (optional)

- Placement: between the two panels and the takeaway strip, or replacing the "Co zůstává otevřené" panel bullets with the image beside a shorter list.
- Teaching role: the crab team presents a result with humility. The audience, including the heron, is curious rather than dismissive. This reinforces "uncertainty does not mean the study showed nothing".
- Suggested file: `krabi_prezentace_zaveru.png`
- Draft alt text: „Humorná ilustrace krabího týmu, který na malé konferenci na pláži ukazuje plakát s několika tečkami a fialovým pásem; v publiku sedí zvědavá volavka a další živočichové. Ilustrace vytvořená pomocí AI.“
- Prompt:

```text
Use case: illustration-story / scientific-educational. Asset type: transparent painterly cutout for a 16:9 Czech university biostatistics slide, matching a course illustration series.
Scene: a tiny beach-side scientific meeting under a canvas awning. Three male Atlantic marsh fiddler crabs stand by a wooden easel holding a poster that shows only a few grey dots and a soft purple band (no axes). One crab gestures modestly with its big claw. In the small audience: the sceptical great blue heron in her lab coat (from the series), a few shorebirds and a periwinkle snail, all leaning in with curiosity. Gentle humour; respectful scientific discussion.
Teaching purpose: a careful, honest result with uncertainty is still a real contribution. Do NOT show numbers, axes, titles, a p-value or any written conclusion.
Style: warm storybook natural-history watercolour/gouache, natural anatomy, clean silhouettes.
Palette: poster parchment #F4F1EC with grey #8A8A8A dots and an amethyst #86579E band; awning indigo #5D2890; easel graphite #2E2E2E; one restrained orange #F3A712 accent (a lanyard).
Composition: wide, roughly 3:2, all figures fully inside the frame with transparent padding.
Text: none. NO TEXT, NO NUMBERS, NO LETTERS, NO logos, NO watermark. True transparent background, clean alpha edges.
```

## Initial title illustration (retained alternative)

- Status: generated on 2026-10-09 after illustrations 1–5 and initially embedded on the title slide. Retained as an alternative; the current title uses `krabi_titulni_kompozice.png`, recorded below. The 2026-10-08 publication exception remains historical.
- Placement: title slide with the shared `.course-title-illustrated` layout (as in L02–L04). Keep the question, the lesson identifier, the formal title and the materials link as editable slide text.
- Suggested file: `krabi_titulni_ilustrace.png`

Reference images to supply, in this order:

| Reference | File | Role in the generation |
|---|---|---|
| 1 | `krab_houslista.jpg` (Natalia Agudelo / SERC, CC BY 2.0) | Anatomy only; do not copy the photograph |
| 2 | `mesic_ze_syra.png` | Cheese-Moon callback |
| 3 | `krabi_okno_do_reality.png` | Main crab character |
| 4 | `volavka_skepticka_kolegyne.png` | The heron |
| 5 | `krabi_mereni_v_se.png` | Purple rods motif |
| 6 | `mapa_lokalit.png` | The Atlantic-coast setting only; no data points copied as results |

- Record each reference's provenance and reuse terms here; the crab photograph keeps its attribution.
- Draft alt text: „Krabi houslisté jako terénní tým na slanisku při západu slunce měří krunýř kolegy fialovou šuplérou; za nimi stojí skeptická volavka v plášti a nad obzorem vychází Měsíc se sýrovými dírkami. Ilustrace vytvořená pomocí AI.“
- Prompt:

```text
Use case: illustration-story / scientific-educational.
Asset type: one new transparent painterly title-slide illustration for L05, a Czech university biostatistics lesson about effect size, hypothesis testing and careful scientific claims, using fiddler crabs from salt marshes along the US Atlantic coast. It will sit beside editable title text on the right-hand 36% of a deep indigo slide.
Input images are visual REFERENCES, not panels or an edit target: Image 1 crab photograph (anatomy of Minuca pugnax only; do not reproduce the photo); Image 2 cheese Moon (the humorous Moon with cheese holes); Images 3–5 the series' crab researchers, sceptical heron and purple measuring rods (PRIMARY character references); Image 6 coastal map (only the idea of a long Atlantic coastline, no points or results). Create one coherent new scene, not a collage, preserving the series' warm natural-history watercolour/gouache brushwork and character identities.
Scene: at dusk on a golden salt marsh, the familiar male fiddler-crab researchers measure a colleague's carapace with a small purple caliper while another crab holds a clipboard with a few grey dots. Behind them, the sceptical great blue heron in her lab coat raises one eyebrow. Above the horizon a large Moon with subtle cheese-like holes rises, a quiet joke about testable but implausible claims. Gentle academic humour, natural anatomy.
Composition: compact portrait cutout about 4:5; Moon in the upper half, crab team dominant in the lower half; all subjects fully inside the frame with generous transparent padding; readable at about 450 px width; one continuous scene, no panel borders.
Palette: natural crab and heron colours with graphite #2E2E2E details; parchment #F4F1EC lab coat, clipboard and moonlight; indigo #5D2890 and amethyst #86579E caliper and accessories; restrained orange #F3A712 accent. Light silhouettes must stay visible on deep indigo.
Constraints: genuinely transparent background with clean alpha edges; NO sky rectangle or painted backdrop outside the subjects; NO text, NO numbers, NO letters, NO equations, NO axes, NO charts, NO percentage symbols, NO labels, NO logos, NO watermarks. Do not invent numerical results or show a test outcome.
```

## Generation provenance

| File | Tool and date | Prompt section | SHA-256 | Placed on slide | Alt text and disclosure checked |
|---|---|---|---|---|---|
| `krabi_okno_do_reality.png` | built-in image_gen, 2026-10-09 | 1 | `25B1A8AAF02372DCC1D43CD76F95DF5283A19938E9D497F6F02D26FBAE97EFF7` | 19 | HTML/PDF checked |
| `krabi_mereni_v_se.png` | built-in image_gen, 2026-10-09 | 2 | `D01D80191731B0CC1DB055EF9F3D65EC184DC1683F22EE978B4D61DF9F77C9FF` | 32 | HTML/PDF checked |
| `volavka_skepticka_kolegyne.png` | built-in image_gen, 2026-10-09 | 3 | `5CB58DC9367ECF4B441B19811F1D854AD40E909BD2A490392876103CFB53F7EA` | 39 | HTML/PDF checked |
| `krabi_invazni_past.png` | built-in image_gen, 2026-10-09 | 4 | `6D62555E3E5FD5B49A1B03BBE7971941A36EA397796F6898C1A729BEFA5D2883` | 41 | HTML/PDF checked |
| `krabi_prezentace_zaveru.png` | built-in image_gen, 2026-10-09 | 5 (optional) | `D3B7DCBF012AC7A76E578698F8E2F49B0C278999A4091167B47D1F35C52E95CE` | 52 | HTML/PDF checked |
| `krabi_titulni_ilustrace.png` | built-in image_gen, 2026-10-09 | Initial title (two passes; see below) | `CD009F9495508F5986084DBA44FF8467FE294584482CA3848BE7B8BCFD03D697` | previous title; retained alternative | HTML/PDF checked before replacement |
| `krabi_titulni_kompozice.png` | built-in image_gen, 2026-10-09 | Current title composite (see below) | `E76752073D84B93B20F5F4D3ED3C00D7A7EFBB0913D84A57D59D4ACE6798D4E1` | 1 | HTML/PDF checked |

### Generation and reference record: 2026-10-09

Validation: all six PNGs were opened and visually checked; their recorded SHA-256 values match the saved bytes. UTF-8 without BOM, no replacement characters, unique chunk labels and the focused source diff check passed. The illustrated slides (1, 19, 32, 39, 41 and 52) were inspected in HTML and PDF; all images load, all AI disclosures are visible, and image widths were corrected to prevent cropping. The trap illustration is centred using native Quarto columns. The PDF contains 57 pages, and the standalone HTML and local docs copy are byte-identical.

The canonical presentation wrapper ran in offline mode using `BIOSTAT_POLLSLIVE_CLIENT_SOURCE=D:/GITHUB/CUNI-NATUR-Biostatistics/_internal` (local client revision `1057461322ef702c5866800893ea235ed49a8cc6`) because the pinned client was not cached. The current lesson-local theme was retained with `options(biostat.theme_sync_complete = TRUE)`. This was a local image-validation render; no live PollsLive synchronization or public publication was performed. Poppler was unavailable, so the installed PyMuPDF renderer was used for PDF-page visual inspection. QA screenshots and reports are in the ignored `Temp/image-qa/` folder.

All six planned images, including optional illustration 5, were generated with the built-in image_gen tool. Sections 1–5 above are the exact submitted prompts, without additional references. The window scene is an opaque RGB illustration; the other five assets preserve the generated RGBA transparency. Visual inspection checked the depicted metaphors, absence of written claims and numbers, and the hidden portion of the measuring rods. The existing photograph and cheese-Moon image were retained.

The title used all six listed references across two passes because the tool accepts at most five reference paths per call. Pass 1 supplied references 1–5 in the listed order; pass 2 supplied the first-pass title as the edit target and reference 6 as a geographic-setting reference only. The second pass also removed caliper scale markings and corrected its jaws to measure carapace width.

| Reference | Provenance and reuse terms | SHA-256 |
|---|---|---|
| `krab_houslista.jpg` | Natalia Agudelo / Smithsonian Environmental Research Center; [Wikimedia Commons original](https://commons.wikimedia.org/wiki/File:Uca_pugnax_(I0443)_(14451829642).jpg), CC BY 2.0. Anatomy reference only; attribution retained on the original photograph slide and the title. | `613ED4DB7CCBB165CAF47DBB5F51287D6F9C9A0E01083C8DEBA84859F093C818` |
| `mesic_ze_syra.png` | Existing course AI illustration; original tool, prompt and generation date unknown, as recorded in `Workflow/records/2026-09-16-presentation-standards.md`. Reused as an existing course asset under the repository educational-content terms; no newly verified third-party license is asserted. | `431ACAF837DEE7B68B09042ED9C2DD25572A3DFF1D28279485DE9E4084A80338` |
| `krabi_okno_do_reality.png` | New course AI illustration, built-in image_gen, 2026-10-09, prompt 1; repository educational-content terms (CC BY 4.0 where applicable). | `25B1A8AAF02372DCC1D43CD76F95DF5283A19938E9D497F6F02D26FBAE97EFF7` |
| `volavka_skepticka_kolegyne.png` | New course AI illustration, built-in image_gen, 2026-10-09, prompt 3; repository educational-content terms (CC BY 4.0 where applicable). | `5CB58DC9367ECF4B441B19811F1D854AD40E909BD2A490392876103CFB53F7EA` |
| `krabi_mereni_v_se.png` | New course AI illustration, built-in image_gen, 2026-10-09, prompt 2; repository educational-content terms (CC BY 4.0 where applicable). | `D01D80191731B0CC1DB055EF9F3D65EC184DC1683F22EE978B4D61DF9F77C9FF` |
| `mapa_lokalit.png` | Existing course figure generated by `Presentation/presentation.qmd`; coastal-setting reference only, with no map data copied into the title. Repository educational-content terms apply to original figure content; underlying data retain their source terms. | `D3148B5BB3E715852548AC8ABFE32BE94E4CAC0F569C46D2DCC9B0C5B3E12A00` |

### Exact title prompt: pass 1

```text
Use case: illustration-story / scientific-educational.
Asset type: one new transparent painterly title-slide illustration for L05, a Czech university biostatistics lesson about effect size, hypothesis testing and careful scientific claims, using fiddler crabs from salt marshes along the US Atlantic coast. It will sit beside editable title text on the right-hand 36% of a deep indigo slide.
First reference pass of a two-pass title-image workflow (the coastal map will be supplied in a following pass). Input images are visual REFERENCES, not panels or an edit target: Image 1 crab photograph (anatomy of Minuca pugnax only; do not reproduce the photo); Image 2 cheese Moon (the humorous Moon with cheese holes); Images 3–5 the series' crab researchers, sceptical heron and purple measuring rods (PRIMARY character references); The setting is salt marshes along the long US Atlantic coastline; a coastal map is reserved for the second reference pass. Create one coherent new scene, not a collage, preserving the series' warm natural-history watercolour/gouache brushwork and character identities.
Scene: at dusk on a golden salt marsh, the familiar male fiddler-crab researchers measure a colleague's carapace with a small purple caliper while another crab holds a clipboard with a few grey dots. Behind them, the sceptical great blue heron in her lab coat raises one eyebrow. Above the horizon a large Moon with subtle cheese-like holes rises, a quiet joke about testable but implausible claims. Gentle academic humour, natural anatomy.
Composition: compact portrait cutout about 4:5; Moon in the upper half, crab team dominant in the lower half; all subjects fully inside the frame with generous transparent padding; readable at about 450 px width; one continuous scene, no panel borders.
Palette: natural crab and heron colours with graphite #2E2E2E details; parchment #F4F1EC lab coat, clipboard and moonlight; indigo #5D2890 and amethyst #86579E caliper and accessories; restrained orange #F3A712 accent. Light silhouettes must stay visible on deep indigo.
Constraints: genuinely transparent background with clean alpha edges; NO sky rectangle or painted backdrop outside the subjects; NO text, NO numbers, NO letters, NO equations, NO axes, NO charts, NO percentage symbols, NO labels, NO logos, NO watermarks. Do not invent numerical results or show a test outcome.
```

### Exact title prompt: pass 2

```text
Use case: precise-object-edit / scientific-educational. Asset type: final transparent painterly title illustration for L05.
Input Image 1 is the title illustration EDIT TARGET. Input Image 2 is a supporting US Atlantic-coast map REFERENCE for geographic setting only; do not reproduce the map, coastline diagram, points, axes, numbers, colours as data, or any results.
Keep Image 1's watercolour/gouache brushwork, recurring fiddler-crab researchers, familiar sceptical heron in lab coat, cheese Moon, portrait composition, palette and coherent golden tidal salt-marsh scene. Use the map solely to confirm an Atlantic-coast salt-marsh setting; retain a natural tidal creek and coastal-marsh vegetation rather than inserting any map panel.
Required precise corrections: the purple caliper must visibly measure the WIDTH OF THE CRAB'S CARAPACE: align its outer jaws horizontally at the left and right edges of the blue-grey shell, below the bases of the eye stalks; keep the eye stalks unobstructed and never measure the eyes. Remove all scale markings, tick marks, number-like glyphs or lettering from the purple caliper so its beam is completely plain. Do not add any extra claws or limbs.
Preserve the existing few plain grey dots on the clipboard, with no axes. Keep all characters and Moon fully within the frame with generous transparent padding. Preserve genuinely transparent background and clean alpha edges; no sky rectangle or painted backdrop outside the scene. Light silhouettes readable on deep indigo. NO text, numbers, letters, equations, axes, charts, percentage symbols, labels, logos or watermarks. No numerical result or test outcome.
```


## Current title composite (requested 2026-10-09)

- Status: generated, saved and embedded on slide 1; title visually checked in the completed HTML and PDF render.
- File: `krabi_titulni_kompozice.png` (1122 × 1402 px, RGBA with genuine transparency).
- Teaching role: combines the lesson's field researchers and sceptical colleague with the two visual ideas behind the title question: an estimated relationship and a competing null world.
- Czech alt text: „Kompozitní ilustrace krabích výzkumníků s fialovou měřicí tyčí a skeptické volavky u okna do slaniska; dvě desky nesou schematické motivy rostoucího vztahu a rozdělení sklonů v nulovém světě. Ilustrace vytvořená pomocí AI.“
- Integration: existing `.course-title-illustrated` layout, local-image helper, editable title text, AI disclosure and retained anatomy-reference attribution. The previous title image remains available as an alternative.
- Validation: the embedded HTML image matches the saved PNG byte-for-byte; the image and disclosure fit at 1600 × 900. The complete PDF title was visually inspected, and the PDF retains 57 pages. `Presentation/presentation.html` and `docs/index.html` are byte-identical. The canonical wrapper used the previously documented local client and existing theme in offline mode; no live PollsLive synchronization was requested. QA evidence: `Temp/image-qa/html-title-composite.png`, `pdf-title-composite.png` and `title-composite-report.json`.
- Reuse terms: repository educational-content terms (CC BY 4.0 where applicable) for original course figures and new course AI illustrations; underlying figure data and third-party anatomy references retain their existing source terms. The original figures remain available in the teaching slides. The composite's unlabelled research cards are schematic motifs, not accurate quantitative reproductions or evidence of a test outcome.

All five reference assets were visually inspected and supplied in this order:

| Reference | File and teaching role | SHA-256 |
|---|---|---|
| 1 | `krabi_okno_do_reality.png`: New course AI illustration; character, salt-marsh setting and painterly style. Built-in image_gen, 2026-10-09, prompt 1 above. | `25B1A8AAF02372DCC1D43CD76F95DF5283A19938E9D497F6F02D26FBAE97EFF7` |
| 2 | `krabi_mereni_v_se.png`: New course AI illustration; purple standard-error rods and surveying team. Built-in image_gen, 2026-10-09, prompt 2 above. | `D01D80191731B0CC1DB055EF9F3D65EC184DC1683F22EE978B4D61DF9F77C9FF` |
| 3 | `volavka_skepticka_kolegyne.png`: New course AI illustration; sceptical heron identity. Built-in image_gen, 2026-10-09, prompt 3 above. | `5CB58DC9367ECF4B441B19811F1D854AD40E909BD2A490392876103CFB53F7EA` |
| 4 | `prumery_s_primkou.png`: Original course figure generated by presentation.qmd; grey observations and rising purple fitted-line motif only. | `83FAE0577A91A0332719E0B8D7EF70E188FBF46FC6859554143808FB5DEE083D` |
| 5 | `pozorovani_proti_nulovym_sklonum.png`: Original course figure generated by presentation.qmd; right-panel purple null-distribution mound and dark central reference only. Orange observed-slope marker and all numerical results omitted. | `C24BD8FB39881DD9F254DF785C76E5FE976E132510BB81915E3131561A387460` |

### Exact composite-generation prompt

```text
Use case: compositing / scientific-educational.
Asset type: a new transparent painterly composite title illustration for L05, a Czech university biostatistics lesson. It will appear in the right-hand 36% of a deep indigo title slide, beside separately editable title text. Create a portrait composition about 4:5.
Input images are references, not a single edit target. Image 1: newly generated fiddler-crab field researcher at a marsh-station window, for character, setting and watercolour/gouache style. Image 2: newly generated fiddler-crab surveying team with purple standard-error rods, for the measurement motif. Image 3: newly generated sceptical great blue heron in her lab coat and spectacles, for character identity. Image 4: the actual lesson scatterplot with grey observations and a rising purple fitted line, for its qualitative point-cloud and slope motif only. Image 5: the actual lesson figure comparing an observed slope with a purple null-distribution histogram, for the purple mound centred around a dark zero-reference motif only.
Primary request: combine the new generated characters AND recognisable motifs from the actual lesson figures into a polished, cohesive illustrated composite. Use the natural-history watercolour/gouache brushwork of Images 1–3 throughout; do not merely paste rectangular screenshots together.
Composition: in the upper half, a small wooden field-station window frames a golden-green Atlantic salt marsh. The familiar inquisitive blue-grey heron in a parchment lab coat stands behind and to one side, visibly sceptical but friendly. In the lower half, two male Atlantic marsh fiddler-crab researchers, each with exactly one oversized claw and one small claw, dominate the foreground; one carries a plain purple measuring rod, another holds study papers. Two overlapping parchment research cards bridge the window and crabs: one card carries the grey point-cloud and rising purple line motif from Image 4; the other carries a compact purple histogram mound with a dark central zero-reference line inspired by the RIGHT panel of Image 5. Keep these cards secondary but legible at a display width of about 450 pixels. Both character and figure motifs must be clearly present, with clean silhouettes and visual breathing room.
Scientific constraints: cards are explicitly schematic illustration motifs, not quantitative reproductions. Preserve the qualitative rising association and central null-distribution mound. Omit the orange observed-slope marker from Image 5, all numerical values, tick marks, axis labels, statistical statements and test outcomes. Do not invent numerical results or imply that the title's decorative cards are data figures. Do not draw a countable full sequence of measuring rods. Original scientific figures remain separate teaching assets.
Palette: graphite #2E2E2E for references, grey #8A8A8A for observations, indigo #5D2890 and amethyst #86579E for models and rods; parchment #F4F1EC; restrained orange #F3A712 only on one small pencil or crab accessory; natural crab, heron and marsh colours. Gentle academic humour. Natural crab and heron anatomy.
Transparency and framing: genuinely transparent background, clean alpha edges, generous transparent padding around all subjects. No painted sky rectangle, no panel grid, no background colour field. Light outlines must remain readable on deep indigo. NO text, letters, numbers, equations, logos, watermark or written headings. Output only the illustration, not an entire slide.
```
