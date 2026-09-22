# L05 — Co nám statistický test dovoluje tvrdit?

**Od velikosti efektu k opatrnému vědeckému závěru**

Tento repozitář obsahuje pátou lekci kurzu [Biostatistika a plánování ekologických pokusů (MB120P163)](https://cuni-natur-biostatistics.github.io/) vyučovaného na Přírodovědecké fakultě Univerzity Karlovy.

Úplný přehled kurzu, rozvrh, pravidla hodnocení a materiály ostatních lekcí najdete na [veřejném HUBu kurzu](https://cuni-natur-biostatistics.github.io/).

## O této lekci

Jsou samci atlantského kraba houslisty *Minuca pugnax* v průměru větší na severněji položených slaniskách? Pátá lekce sleduje tuto biologickou otázku od prvního grafu až k opatrně formulovanému výsledku statistického testu.

Na datech ze třinácti slanisek spojíme velikost odhadnutého vztahu, jeho nejistotu a srovnání s přesně formulovanou nulovou hypotézou. Postupně zavedeme testovou statistiku, stupně volnosti, p-hodnotu, hladinu významnosti a statistickou sílu.

Hlavní důraz leží na interpretaci: statisticky významný výsledek není automaticky velký, biologicky důležitý ani příčinný. Dobrá výsledková věta musí spojit efekt, nejistotu, uspořádání studie a omezení toho, co lze z dat tvrdit.

## Výsledky učení

Po prostudování této lekce dokážete:

- popsat velikost vztahu nalezeného v datech a přesnost jeho odhadu;
- převést biologické tvrzení na konkrétní nulovou hypotézu;
- vysvětlit význam testové statistiky, stupňů volnosti a p-hodnoty bez zaměňování p-hodnoty za pravděpodobnost pravdivosti hypotézy;
- použít rozhodovací pravidlo založené na hladině významnosti a rozlišit statistickou významnost od biologické důležitosti;
- rozpoznat chybu I. a II. druhu a vysvětlit základní význam síly testu;
- napsat opatrný vědecký závěr, který nepředstírá, že jeden test rozhodl vědeckou pravdu.

## Materiály pro studenty

Následující odkazy vedou vždy na nejnovější schválené vydání L05. Rozpracovaná verze ve větvi `main` může být novější, ale není určena jako závazná studijní verze.

| Materiál | Online verze | PDF |
| --- | --- | --- |
| Skripta | [Číst online](https://cuni-natur-biostatistics.github.io/L05/current/learning/) | [Stáhnout PDF](https://cuni-natur-biostatistics.github.io/L05/current/learning/skripta.pdf) |
| Prezentace | [Otevřít slidy](https://cuni-natur-biostatistics.github.io/L05/current/presentation/) | [Stáhnout PDF](https://cuni-natur-biostatistics.github.io/L05/current/presentation/presentation.pdf) |
| Praktické cvičení v R | [Stáhnout skript](https://cuni-natur-biostatistics.github.io/L05/current/code/cviceni.R) | — |
| Data ke cvičení | [Průměry lokalit](https://cuni-natur-biostatistics.github.io/L05/current/data/pie_crab_site_means.csv), [jednotliví krabi](https://cuni-natur-biostatistics.github.io/L05/current/data/pie_crab.csv) | — |


- [HUB kurzu](https://cuni-natur-biostatistics.github.io/) je hlavní vstup ke všem veřejným studijním materiálům.
- [Moodle kurzu](https://dl2.cuni.cz/course/view.php?id=106) slouží zapsaným studentům pro oznámení, testy, zadání, odevzdávání a individuální výsledky.

## Pro vyučující a správce

### Zdrojové a vyrenderované soubory

- `Learning_materials/skripta.qmd` je zdroj skript; výsledky jsou `Learning_materials/skripta.html` a `Learning_materials/skripta.pdf`.
- `Presentation/presentation.qmd` je zdroj slidů; výsledky jsou `Presentation/presentation.html` a `Presentation/presentation.pdf`.
- `data/pie_crab.csv` a `data/pie_crab_site_means.csv` obsahují výuková data o krabech a souhrny lokalit.
- `R/` obsahuje podporované renderovací a tematické nástroje.
- `theme/` obsahuje synchronizovanou lokální kopii společné vizuální identity kurzu.

### Reprodukovatelné prostředí

Repozitář používá `renv`. Po klonování otevřete `L05.Rproj` a v čerstvé R relaci spusťte:

```r
renv::restore()
renv::status()
```

Kompletní lokální render spustíte podporovaným wrapperem:

```r
source("R/render_all.R")
```

Samostatně lze použít `R/render_skripta.R` nebo `R/render_presentation.R`. Přímé volání `quarto render` obchází synchronizaci sdíleného tématu a nemá se používat pro release render.

### Publikování

`website-release.yml` je explicitní seznam souborů povolených ve veřejném balíčku. Větev `main` vytváří veřejný náhled, zatímco stabilní tag `L05-vMAJOR.MINOR.PATCH-YYYYMMDD` vytváří neměnné vydání a aktualizuje cestu `/L05/current/`. Podrobný publikační postup je v [`WEBSITE_RELEASES.md`](WEBSITE_RELEASES.md).

Před vydáním je nutné zkontrolovat vyrenderované HTML a PDF, úplnost manifestu, provenanci a podmínky použití dat a médií a nepřítomnost neveřejných informací v celém repozitáři.

## Licence

Původní výukový obsah je licencován pod CC BY 4.0 a software pod licencí MIT. Přesné vymezení, doporučená citace a výjimky pro převzatá data, média, fonty, loga a další položky jsou v [`LICENSE.md`](LICENSE.md).
