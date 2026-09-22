#----------------------------------------------------------#
#
#       L05 — Od velikosti efektu k testování hypotéz
#                 Praktické cvičení v R
#             Studenti biologie a ekologie
#                       O. Mottl
#                         2026
#
#----------------------------------------------------------#


#----------------------------------------------------------#
# Příprava: projekt, skript a data -----
#----------------------------------------------------------#

# Projekt v RStudiu je hlavní složka pro jednu práci. Soubor
# .Rproj pomáhá tuto složku znovu otevřít. Skript a data jsou
# samostatné soubory uvnitř projektu; uložení skriptu neuloží
# objekty v aktuální relaci R.
#
# V RStudiu zvolte File > New Project > New Directory >
# New Project. Jako Directory name zadejte L05_praktikum.
# V Create project as subdirectory of vyberte složku, kde
# chcete práci uchovat, a potvrďte Create Project.
# Název otevřeného projektu uvidíte vpravo nahoře.
#
# V panelu Files klikněte New Folder, pojmenujte ji data
# a otevřete ji. Stáhněte tento soubor:
# https://cuni-natur-biostatistics.github.io/L05/current/data/pie_crab_site_means.csv
# Uložte jej jako pie_crab_site_means.csv do složky data.
# Kliknutím na .. v panelu Files se vraťte do hlavní složky.
# Stáhněte skript:
# https://cuni-natur-biostatistics.github.io/L05/current/code/cviceni.R
# Uložte jej do hlavní složky projektu jako cviceni.R.
# V RStudiu zvolte File > Open File a stažený skript otevřete.
#
# L05_praktikum/
#   L05_praktikum.Rproj
#   cviceni.R
#   data/
#     pie_crab_site_means.csv
#
# Skript spouštějte shora dolů. Jeden příkaz spusťte kurzorem
# na jeho řádku pomocí Ctrl + Enter. U víceřádkového příkazu
# označte všechny jeho řádky a stiskněte Ctrl + Enter.
# Výsledky se ukážou v Console, grafy v Plots. Řádky začínající
# znakem # jsou komentáře a R je nespouští.
# Pod „Vaše řešení“ pište příkazy bez #; slovní odpovědi pište
# na komentářové řádky začínající #. Kopii průběžně ukládejte
# pomocí Ctrl + S. Nápovědy čtěte postupně.
#
# Hlavní úlohy L05-U01 až L05-U08 tvoří společnou trasu.
# Pozdější úlohy používají data_lokality z vašeho U01
# a mod_krabi z vašeho U02.
# Úlohy navíc jsou dobrovolné a hodí se i k samostudiu.
# Projekt znovu otevřete dvojklikem na soubor .Rproj.
# Restart R smaže objekty z aktuální relace, ale uložený
# skript a CSV zůstanou na disku. Po restartu spusťte svůj
# uložený skript znovu shora dolů.


#--------------------------------------------------#
## Výsledky učení a návaznost na L04 -----
#--------------------------------------------------#

# Po praktiku dokážete převést testovatelné tvrzení na
# hypotézy o sklonu modelu, vyložit velikost efektu a jeho
# nejistotu, sestavit t-statistiku a její stupně volnosti,
# správně číst p-hodnotu, rozlišit dva typy chybného
# rozhodnutí a napsat opatrný biologický závěr.
#
# V L04 jste četli sklon, standardní chybu, interval
# spolehlivosti a graf residuí. Pokud je znáte, krátké
# připomenutí přeskočte:
# - sklon říká, jak se mění průměrná odezva při změně
#   prediktoru o jednu jednotku;
# - standardní chyba popisuje nejistotu odhadu sklonu;
# - 95% interval ukazuje rozsah sklonů slučitelných
#   s daty a modelem;
# - graf residuí kontroluje, co přímka nevystihla.


#--------------------------------------------------#
## Kontrola souboru -----
#--------------------------------------------------#

# Cesta začíná v hlavní složce otevřeného projektu.
# Kontrola nic nestahuje ani nemění ve vašem počítači.
soubor_lokality <- "data/pie_crab_site_means.csv"

if (
  !file.exists(soubor_lokality)) {
  stop(
    "Soubor data/pie_crab_site_means.csv nebyl nalezen. Otevřete projekt L05_praktikum a zkontrolujte název i umístění CSV ve složce data.",
    call. = FALSE
  )
}


#----------------------------------------------------------#
# Hlavní úlohy -----
#----------------------------------------------------------#

#--------------------------------------------------#
## Co lze u slanisek skutečně zkoumat? -----
#--------------------------------------------------#

# Výukový soubor vychází z měření samců kraba houslisty
# na slaniskách atlantského pobřeží. Každý řádek této
# tabulky je jedno slanisko, ne jeden krab. Průměrná šířka
# krunýře je v milimetrech, zeměpisná šířka ve stupních.
# Soubor je připraven z dat lterdatasampler::pie_crab;
# původ a přípravu popisují skripta L05.
# Vzor z L04: název objektu a cestu nahraďte v U01.
# data_nazev <- read.csv(file = cesta_k_souboru)
# head(x = data_nazev)


#----------------------------------------#
### Úloha | L05-U01 -----
#----------------------------------------#

# Zadání: Načtěte CSV určené v soubor_lokality do
# objektu data_lokality a zobrazte prvních šest řádků.
# Pak zjistěte počet řádků, rozsah zemepisna_sirka,
# rozsah pocet_krabu a počet chybějících hodnot
# v zemepisna_sirka a prumerna_sirka_mm. U tvrzení
# „Na severnějších slaniskách mají samci v průměru širší
# krunýř“ určete prediktor, odezvu a co by jej mohlo
# vyvrátit. Je tvrzení testovatelné?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: 13 úplných slanisek na 30,0–42,7°
# s 25–37 kraby na lokalitu. Tvrzení je testovatelné:
# data by mohla ukázat nulový nebo opačný vztah.
# Nápověda 1: Nejdřív vytvořte tabulku v paměti;
# teprve potom kontrolujte její řádky a sloupce.
# Jeden řádek je jednotka analýzy.
# Nápověda 2: Načtěte pomocí read.csv() s argumentem
# file = soubor_lokality a uložte jako data_lokality.
# Použijte head(), nrow(), range() a sum(is.na())
# na příslušné sloupce. Prediktorem je zemepisna_sirka.


#--------------------------------------------------#
## Jak velká změna je v datech? -----
#--------------------------------------------------#

# Fitujte známou přímku: odezva ~ prediktor.
# Zde každý ze 13 průměrů lokalit přispívá jedním bodem.
# Vzor z L03: obecné názvy nahraďte svou otázkou a tabulkou.
# mod_nazev <- lm(
#   formula = odezva ~ prediktor,
#   data = data_tabulka
# )
# coef(object = mod_nazev)


#----------------------------------------#
### Úloha | L05-U02 -----
#----------------------------------------#

# Zadání: Z data_lokality fitujte pomocí lm() model
# prumerna_sirka_mm podle zemepisna_sirka a uložte jej
# jako mod_krabi. Zobrazte jeho koeficienty pomocí coef().
# Nakreslete bodový graf zemepisna_sirka na ose x a
# prumerna_sirka_mm na ose y; osy popište se stupni a
# milimetry. Do grafu přidejte přímku mod_krabi.
# Z coef(mod_krabi) přečtěte sklon;
# vysvětlete jej v mm na 1° a přibližně pro rozdíl 5°.
# Vypovídá sklon sám o biologické důležitosti?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Body i přímka převážně rostou.
# Sklon je asi 0,490 mm na 1°; za 5° odpovídá změně
# asi 2,45 mm. Důležitost vyžaduje biologický kontext.
# Nápověda 1: Ve vzorci přímky patří odezva vlevo
# od ~ a prediktor vpravo. Body jsou jednotlivá
# slaniska, přímka shrnuje jejich vztah.
# Nápověda 2: Do lm() dejte prumerna_sirka_mm vlevo
# a zemepisna_sirka vpravo; data jsou data_lokality.
# V plot() popište osy, pak přidejte
# abline(reg = mod_krabi). Sklon je druhý člen coef().


#--------------------------------------------------#
## Co přímka nevystihla? -----
#--------------------------------------------------#

# Stejně jako v L04 porovnáme residua s odhady modelu.
# Residuum je pozorovaný průměr minus hodnota na přímce.
# Nula znamená, že daný průměr leží přesně na přímce.


#----------------------------------------#
### Úloha | L05-U03 -----
#----------------------------------------#

# Zadání: Z mod_krabi nakreslete residua proti fitted
# hodnotám, popište osy v mm a přidejte vodorovnou
# přerušovanou čáru v nule. Samostatně vytvořte
# histogram residuí. Popište, zda vidíte nápadný
# oblouk, změnu rozptylu nebo vzdálenější lokality.
# Co z těchto grafů nezjistíte o nezávislosti slanisek?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Residua leží po obou stranách
# nuly a některé lokality se od přímky liší výrazněji.
# Grafy samy neprokážou nezávislost blízkých lokalit.
# Nápověda 1: Graf proti odhadům zachová polohu
# každého residua podél přímky; histogram ukazuje četnost.
# Nápověda 2: V plot() použijte fitted(mod_krabi) a
# resid(mod_krabi), pak abline(h = 0, lty = 2).
# Samostatný histogram vytvořte pomocí hist().


#--------------------------------------------------#
## Jak přesně známe velikost vztahu? -----
#--------------------------------------------------#

# Ve výstupu summary() sledujte řádek zemepisna_sirka.
# Estimate je odhad sklonu, Std. Error jeho standardní
# chyba. Sloupce t value a Pr(>|t|) zatím nevykládejte.
# confint() vypíše intervaly pro oba koeficienty.


#----------------------------------------#
### Úloha | L05-U04 -----
#----------------------------------------#

# Zadání: Zobrazte summary(mod_krabi) a
# confint(mod_krabi). V řádku zemepisna_sirka
# určete odhad a standardní chybu sklonu a opište
# jeho 95% interval sklonu. Přepočtěte jeho
# hranice na rozdíl 5°.
# Pro hypotetické posouzení považujte změnu alespoň
# 2 mm za 5° za biologicky zajímavou. Co data podle
# tohoto měřítka připouštějí? Rozlište odhad, nejistotu
# a předem zvolené měřítko důležitosti.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Odhad asi 0,490, SE asi 0,0795
# a 95% interval 0,315–0,664 mm/°. Za 5° jde přibližně
# o 1,57–3,32 mm; interval připouští hodnoty pod i nad
# hypotetickým prahem 2 mm. Nulový sklon v něm není.
# Nápověda 1: Oba výstupy mají samostatný řádek pro
# sklon; převod na 5° nemění samotný model.
# Nápověda 2: V summary() čtěte Estimate a Std. Error
# v řádku zemepisna_sirka. Hranice téhož řádku
# confint() vynásobte pěti.


#--------------------------------------------------#
## Jaké přesné tvrzení porovnáváme s daty? -----
#--------------------------------------------------#

# Testujeme parametr přímky: skutečný sklon v širší
# populaci slanisek. Nulová hypotéza H0 říká, že
# tento sklon je přesně 0 mm/°. Oboustranná alternativní
# hypotéza HA říká, že sklon je různý od nuly.
# t-statistika měří vzdálenost od nuly v jednotkách
# standardní chyby: t = (odhad sklonu - 0) / SE sklonu.
# V jednoduché regresi odhadujeme intercept i sklon,
# takže residuální stupně volnosti jsou počet lokalit - 2.


#----------------------------------------#
### Úloha | L05-U05 -----
#----------------------------------------#

# Zadání: Pro model mod_krabi zapište H0 a oboustrannou
# HA jako tvrzení o sklonu. Z výstupu summary(mod_krabi)
# opište odhad sklonu a jeho SE; vypočtěte z nich
# t = (odhad - 0) / SE. Spočtěte počet lokalit minus 2
# a porovnejte jej s df.residual(mod_krabi). Co měří t?
# Proč 13 jednotlivých slanisek dává df = 11?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: H0: sklon = 0; HA: sklon není 0.
# t je asi 6,16 a df = 11. Vzdálenost od nulového
# sklonu činí asi 6,16 standardní chyby odhadu.
# Nápověda 1: V čitateli je rozdíl od přesně nulového
# sklonu; dva odhadnuté koeficienty spotřebují dvě
# volnosti ze 13 průměrů lokalit.
# Nápověda 2: Estimate a Std. Error najdete v řádku
# zemepisna_sirka. Použijte jejich podíl a nrow()
# minus 2; hodnotu porovnejte s df.residual().


#--------------------------------------------------#
## Jak neobvyklý je výsledek v nulovém světě? -----
#--------------------------------------------------#

# Pokud platí H0 a předpoklady modelu, t-statistika
# se porovnává s t-rozdělením o 11 stupních volnosti.
# pt() vrací plochu nalevo od zadané hodnoty t.
# Například plocha nalevo od t = -2 při df = 11:
pt(q = -2, df = 11)

# Oboustranná p-hodnota zahrnuje oba chvosty:
# výsledky alespoň tak vzdálené od nuly jako pozorované t.
# Hladinu alfa = 0,05 volíme před pohledem na p-hodnotu.


#----------------------------------------#
### Úloha | L05-U06 -----
#----------------------------------------#

# Zadání: Použijte t ze svého výpočtu v U05 a
# df.residual(mod_krabi). Spočtěte oboustrannou
# p-hodnotu jako dvojnásobek plochy vlevo od -|t|.
# Porovnejte ji s předem zvolenou alfa = 0,05.
# Má 95% interval sklonu z U04 nulu uvnitř? Napište,
# co p-hodnota znamená za platnosti H0 a modelu.
# Znamená pravděpodobnost, že H0 platí?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: p asi 0,0000711 < 0,05;
# H0 o nulovém sklonu zamítáme. Interval nulu
# neobsahuje. P-hodnota je pravděpodobnost stejně
# nebo více extrémní t-statistiky v nulovém světě,
# nikoli pravděpodobnost pravdivosti H0.
# Nápověda 1: Dva chvosty odpovídají oboustranné HA;
# nulové tvrzení je podmínka výpočtu, ne jeho výsledek.
# Nápověda 2: Pro levou plochu použijte
# pt(q = -abs(t), df = df.residual(mod_krabi))
# a výsledek vynásobte dvěma. Číslo t nahraďte
# svou vypočtenou hodnotou z U05.


#--------------------------------------------------#
## Co znamená chybné rozhodnutí? -----
#--------------------------------------------------#

# Zamítnutí H0 není důkaz pravdy HA. Kdyby H0 ve
# skutečnosti platila a my ji zamítli, šlo by o chybu
# I. druhu. Kdyby skutečný vztah existoval, ale H0
# jsme nezamítli, šlo by o chybu II. druhu.


#----------------------------------------#
### Úloha | L05-U07 -----
#----------------------------------------#

# Zadání: Uvažujte rozhodnutí o H0: skutečný sklon
# mezi zeměpisnou šířkou a průměrnou šířkou krunýře
# je nulový. Popište pro tato slaniska (a) chybu
# I. druhu a (b) chybu II. druhu. Při jakém rozhodnutí
# by výzkumník mylně hlásil vztah, který neexistuje?
# Proč ani malé p z U06 nevylučuje omyl?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: I. druh je zamítnutí pravdivé
# H0, tedy falešné hlášení vztahu. II. druh je
# nezamítnutí H0 při skutečně nenulovém sklonu.
# Rozhodnutí vychází z omezených dat a předpokladů.
# Nápověda 1: U každé chyby oddělte skutečný stav
# od rozhodnutí testu.
# Nápověda 2: I. druh = H0 platí a zamítneme ji;
# II. druh = H0 neplatí a nezamítneme ji.


#--------------------------------------------------#
## Co smíme říct o krabech? -----
#--------------------------------------------------#

# Studie je observační. Počty krabů v lokalitách se
# mírně liší; jednoduchý model přesto váží průměry
# lokalit stejně. Blízká slaniska si mohou být podobná
# a některá mají na přímku větší vliv. Graf residuí
# sám neprokáže nezávislost lokalit ani příčinu vztahu.


#----------------------------------------#
### Úloha | L05-U08 -----
#----------------------------------------#

# Zadání: Napište 4–6 vět pro biologa o vztahu
# zemepisna_sirka a prumerna_sirka_mm u 13 slanisek.
# V tomto pořadí uveďte: biologickou otázku a jednotku
# dat; graf, přímku a kontrolu residuí; odhad sklonu
# v mm/° a za 5° i jeho možnou důležitost; 95% interval;
# p-hodnotu vzhledem k H0: sklon = 0 a alfa = 0,05;
# alespoň dvě omezení studie. Oddělte důkaz vztahu
# od tvrzení, že zeměpisná šířka změnu způsobuje.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Závěr začíná efektem asi
# 0,490 mm/° (2,45 mm za 5°) a intervalem
# 0,315–0,664 mm/°. Výsledek je obtížně slučitelný
# s nulovým sklonem při předpokladech modelu,
# ale neprokazuje příčinu; zmíníte prostorovou
# podobnost lokalit a nerovnou přesnost průměrů.
# Nápověda 1: Věcnou velikost vztahu řekněte
# před rozhodnutím testu; na konec patří omezení.
# Nápověda 2: Navazujte na U02–U07: sklon a 5°,
# SE/interval, t/df/p, alfa, graf residuí a
# způsob získání 13 lokalit.


#----------------------------------------------------------#
# Úlohy navíc -----
#----------------------------------------------------------#

# Tyto úlohy nejsou součástí společné trasy. Můžete si
# vybrat jednotlivé úlohy, pokud je jejich výchozí
# objekt už připraven. N09 potřebuje druhý CSV.


#--------------------------------------------------#
## Tvrzení, data a význam efektu -----
#--------------------------------------------------#


#----------------------------------------#
### Úloha navíc | L05-N01 -----
#----------------------------------------#

# Zadání: U každého výroku rozhodněte, zda jej lze
# ověřit pozorováním: „Měsíc je ze sýra“; „Krab
# houslista je nejkrásnější živočich“; „Na těchto
# slaniskách roste průměrná šířka krunýře se
# zeměpisnou šířkou“. U testovatelných vět popište,
# jaké pozorování by jim odporovalo. Odlište
# testovatelnost od věrohodnosti.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: První a třetí výrok lze
# ověřovat daty; druhý je hodnotový soud. Měsíc
# ze sýra je testovatelný, byť nevěrohodný.
# Nápověda 1: Ptejte se, zda si umíte představit
# pozorování, které by výrok vyvracelo.
# Nápověda 2: Chemické složení a měření krabů
# jsou pozorovatelné; „nejkrásnější“ nemá
# společné měřicí pravidlo.


#----------------------------------------#
### Úloha navíc | L05-N02 -----
#----------------------------------------#

# Zadání: Z mod_krabi přepočtěte odhad sklonu
# a jeho 95% interval na rozdíl 10° zeměpisné
# šířky. Hypotetický biolog považuje za důležitou
# změnu alespoň 3 mm za 10°. Rozlište, zda
# hranici překračuje bodový odhad a zda ji
# překračují všechny hodnoty intervalu.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Odhad asi 4,90 mm,
# interval asi 3,15–6,64 mm za 10°; celé
# rozmezí je nad hypotetickými 3 mm.
# Nápověda 1: Jednotku „na 1°“ lze násobit
# stejným počtem stupňů u odhadu i mezí.
# Nápověda 2: Druhý koeficient coef(mod_krabi)
# a řádek zemepisna_sirka z confint(mod_krabi)
# vynásobte deseti.


#----------------------------------------#
### Úloha navíc | L05-N03 -----
#----------------------------------------#

# Zadání: Ve výstupu summary(mod_krabi) porovnejte
# řádky (Intercept) a zemepisna_sirka. Uveďte,
# který odpovídá změně v mm na 1° a co by zde
# znamenal intercept. Proč intercept nevykládáme
# jako měřenou šířku krabů na rovníku?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Změnu popisuje sklon.
# Intercept je odhad pro 0° zeměpisné šířky,
# hluboko mimo pozorovaný rozsah 30,0–42,7°.
# Nápověda 1: Význam interceptu určíte dosazením
# nuly za prediktor v rovnici přímky.
# Nápověda 2: Porovnejte 0° s range()
# sloupce zemepisna_sirka.


#--------------------------------------------------#
## Testová statistika a rozhodnutí -----
#--------------------------------------------------#


#----------------------------------------#
### Úloha navíc | L05-N04 -----
#----------------------------------------#

# Zadání: Pro jednoduchou regresi s interceptem
# a sklonem spočtěte residuální df, kdyby studie
# měla 8 nebo 20 nezávislých lokalit. Vysvětlete,
# proč se odečítá stále 2 a ne počet krabů.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: df = 6 a df = 18.
# Dva odhadnuté koeficienty spotřebují dvě
# volnosti; řádky hlavní analýzy jsou lokality.
# Nápověda 1: Počet residuálních stupňů
# volnosti závisí na počtu nezávislých řádků.
# Nápověda 2: Použijte n - 2 pro n = 8 a 20.


#----------------------------------------#
### Úloha navíc | L05-N05 -----
#----------------------------------------#

# Zadání: Pro ilustrativní |t| = 2 spočtěte
# oboustrannou plochu v chvostech t-rozdělení
# při df = 11 a df = 30. Která je menší?
# Tyto hodnoty nepovažujte za krabí t-statistiku.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Asi 0,0708 pro df = 11
# a 0,0546 pro df = 30; druhá plocha je menší.
# Nápověda 1: Pro oboustrannou otázku potřebujete
# oba chvosty za stejně vzdálenými hranicemi.
# Nápověda 2: Dvakrát použijte 2 * pt(q = -2,
# df = ...), nejprve s df = 11, pak 30.


#----------------------------------------#
### Úloha navíc | L05-N06 -----
#----------------------------------------#

# Zadání: Ponechte p-hodnotu modelu mod_krabi
# stejnou jako v U06. Rozhodněte o H0 při předem
# zvolených hladinách alfa = 0,01 a 0,00001.
# Změnila se data nebo odhadnutý efekt?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Při 0,01 H0 zamítneme,
# při 0,00001 ji nezamítneme. Data ani sklon
# se změnou rozhodovacího pravidla nemění.
# Nápověda 1: Nové alfa mění hranici rozhodnutí,
# nikoli výstup již fitovaného modelu.
# Nápověda 2: Porovnejte p asi 0,0000711
# zvlášť s 0,01 a 0,00001.


#----------------------------------------#
### Úloha navíc | L05-N07 -----
#----------------------------------------#

# Zadání: Pro mod_krabi vypište 90% a 99%
# interval sklonu. Porovnejte jejich šířku
# s 95% intervalem z U04. Obsahuje některý
# z nich nulový sklon?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: 90% interval asi
# 0,347–0,632 a 99% asi 0,243–0,736 mm/°.
# Vyšší spolehlivost dává širší interval;
# žádný z těchto intervalů neobsahuje nulu.
# Nápověda 1: Výběr hladiny mění šířku
# intervalu, nikoli bodový odhad.
# Nápověda 2: Použijte confint() s argumenty
# object = mod_krabi a level = 0.90 či 0.99;
# čtěte řádek zemepisna_sirka.


#----------------------------------------#
### Úloha navíc | L05-N08 -----
#----------------------------------------#

# Zadání: Představte si, že na základě zjištěného
# severojižního vztahu chcete prioritně sledovat
# severní slaniska. Uveďte jeden možný praktický
# následek chyby I. druhu a jeden následek chyby
# II. druhu. Proč volba alfa neodstraňuje obě chyby?
# Netvrďte, že šířka sama způsobuje velikost krabů.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Falešné hlášení vztahu
# může přesunout monitoring bez věcného důvodu;
# přehlédnutý vztah může zdržet další výzkum.
# Hranice alfa mění rozhodovací pravidlo, ne
# jistotu o skutečném stavu.
# Nápověda 1: Oddělte skutečný stav od rozhodnutí
# a popište důsledek pro omezené zdroje.
# Nápověda 2: I. druh = hlášený vztah při
# skutečně nulovém sklonu; II. druh = přehlédnutý
# skutečně nenulový sklon.


#--------------------------------------------------#
## Jednotka analýzy a kontrola modelu -----
#--------------------------------------------------#

# Pro N09 potřebujete i tabulku jednotlivých krabů.
# V panelu Files otevřete složku data, stáhněte soubor
# z této adresy a uložte jej jako pie_crab.csv:
# https://cuni-natur-biostatistics.github.io/L05/current/data/pie_crab.csv
# V panelu Files se vraťte kliknutím na ..
# Ostatní úlohy navíc tento soubor nepotřebují.


#----------------------------------------#
### Úloha navíc | L05-N09 -----
#----------------------------------------#

# Zadání: Pokud jste stáhli data/pie_crab.csv,
# načtěte jej jako data_krabi. Zjistěte počet
# jednotlivých krabů a počet různých hodnot
# kod_lokality. Porovnejte je s 13 řádky
# data_lokality. Která tabulka je vstupem
# inferenčního modelu mod_krabi?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: 392 krabů z 13 lokalit;
# model pracuje s 13 průměry lokalit. Krabi
# z téže lokality nejsou 392 nezávislých
# odpovědí na otázku o zeměpisné šířce.
# Nápověda 1: Počet měření a počet nezávislých
# lokalit odpovídají dvěma různým otázkám.
# Nápověda 2: Použijte read.csv(), nrow() a
# length(unique(data_krabi$kod_lokality)).


#----------------------------------------#
### Úloha navíc | L05-N10 -----
#----------------------------------------#

# Zadání: Použijte data_lokality$pocet_krabu.
# Najděte nejmenší a největší počet změřených
# krabů na lokalitu. Vysvětlete, proč se průměry
# z těchto lokalit mohou lišit přesností a co
# jednoduchý nevážený model mod_krabi ignoruje.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: 25 až 37 krabů na
# lokalitu. Přesnost průměrů se může lišit;
# zde mají všechny lokality v regresi stejnou váhu.
# Nápověda 1: Více měření může zpřesnit
# průměr, ale záleží také na variabilitě.
# Nápověda 2: Použijte range() na sloupec
# pocet_krabu; model v U02 nepoužil weights.


#----------------------------------------#
### Úloha navíc | L05-N11 -----
#----------------------------------------#

# Zadání: Z resid(mod_krabi) najděte lokalitu
# s největší absolutní odchylkou od přímky.
# V data_lokality určete její kod_lokality.
# Uveďte velikost residua v mm a vysvětlete,
# proč velké residuum samo neprokazuje chybu
# měření ani chybnou nulovou hypotézu.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Lokalita VCR, residuum
# asi +1,87 mm. Je to výraznější odchylka
# od modelu, nikoli sama o sobě verdikt o datech.
# Nápověda 1: Hledejte největší velikost rozdílu
# bez ohledu na znaménko; řádek odpovídá lokalitě.
# Nápověda 2: Použijte which.max(abs(resid(mod_krabi)))
# jako index do data_lokality a resid(mod_krabi).


#----------------------------------------#
### Úloha navíc | L05-N12 -----
#----------------------------------------#

# Zadání: Z data_lokality vynechte nejjižnější
# lokalitu GTM a zbylých 12 lokalit uložte do
# data_bez_gtm. Fitujte stejnou přímku jako
# mod_krabi a porovnejte oba sklony. Zůstává
# směr vztahu stejný? Dokazuje tato jedna
# kontrola nezávislost lokalit nebo příčinu?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Oba sklony jsou kladné;
# přesná velikost se změní. Jedno vynechání
# neověří prostorovou nezávislost ani příčinu.
# Nápověda 1: Měníte soubor lokalit, nikoli
# definici odezvy a prediktoru.
# Nápověda 2: Vyberte řádky, kde
# data_lokality$kod_lokality != "GTM", a
# použijte stejný vzorec v lm().


#----------------------------------------#
### Úloha navíc | L05-N13 -----
#----------------------------------------#

# Zadání: Opravte tyto tři věty podle
# mod_krabi a svých výsledků: „p = 0,0000711
# znamená 99,99289% pravděpodobnost, že HA
# je pravdivá.“ „Statistická významnost
# dokazuje velký biologický efekt.“ „Zeměpisná
# šířka způsobuje větší kraby.“ V každé
# opravě uveďte, co data skutečně podporují.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: p je podmíněná plocha
# v nulovém světě; věcnou velikost ukazuje
# sklon s intervalem a kontextem; observační
# vztah sám neurčuje příčinu.
# Nápověda 1: Každá věta zaměňuje jinou otázku:
# pravdivost hypotézy, velikost efektu, příčinu.
# Nápověda 2: Vraťte se k U04, U06 a omezením
# uvedeným před U08.


#----------------------------------------------------------#
# Co si odnést -----
#----------------------------------------------------------#

# Zkontrolujte, zda umíte vlastními slovy odpovědět:
# 1. Proč je v modelu 13 řádků, i když bylo změřeno
#    více jednotlivých krabů?
# 2. Co znamená sklon 0,490 mm/° a co znamená jeho
#    standardní chyba? Které číslo posuzuje důležitost?
# 3. Za jaké podmínky čteme p-hodnotu a co neříká?
# 4. Jak se liší chyba I. a II. druhu?
# 5. Která omezení brání příčinnému závěru?
#
# Věcný závěr začíná velikostí vztahu a nejistotou.
# Test se ptá na užší otázku slučitelnosti dat
# s přesně nulovým sklonem za předpokladů modelu.
