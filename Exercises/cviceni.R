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
# Příprava -----
#----------------------------------------------------------#

#--------------------------------------------------#
## Jak získat a otevřít soubory -----
#--------------------------------------------------#
# Ke cvičení potřebujete dva soubory: tento skript cviceni.R a datový
# soubor pie_crab_site_means.csv. Oba najdete na webu kurzu:
# https://cuni-natur-biostatistics.github.io/L05/current/code/cviceni.R
# https://cuni-natur-biostatistics.github.io/L05/current/data/pie_crab_site_means.csv
#
# Jak soubory uložit:
# 1. Vytvořte složku L05_praktikum a v ní podsložku data.
# 2. Soubor cviceni.R uložte do složky L05_praktikum.
# 3. Soubor pie_crab_site_means.csv uložte do podsložky data. Jeho jméno
#    neměňte.
# Pokud prohlížeč uloží soubory rovnou do složky Stažené soubory,
# přesuňte je odtud na uvedená místa.
#
# Jak otevřít projekt v RStudiu:
# RStudio Project je obyčejná složka, ve které pracujete. RStudio do ní
# přidá soubor .Rproj, pomocí kterého složku příště snadno znovu otevřete.
# Skript, data i výstupy zůstávají samostatnými soubory uvnitř složky.
# 1. V RStudiu zvolte File > New Project > Existing Directory.
# 2. Vyberte složku L05_praktikum a potvrďte Create Project.
# 3. V panelu Files otevřete cviceni.R.
# 4. Přes File > Save As si uložte vlastní kopii, například
#    cviceni_L05_prijmeni.R.
#
# Výsledná složka vypadá takto:
# L05_praktikum/
# ├── L05_praktikum.Rproj
# ├── cviceni.R
# └── data/
#     └── pie_crab_site_means.csv

#--------------------------------------------------#
## Jak se skriptem pracovat -----
#--------------------------------------------------#
# Hlavní úlohy U01–U08 řešte v uvedeném pořadí, protože na sebe navazují.
# Pozdější úlohy používají tabulku data_lokality z vaší úlohy U01
# a model mod_krabi z vaší úlohy U02.
# Úlohy navíc N01–N13 jsou dobrovolné. Slouží k dalšímu procvičování,
# klidně i po praktiku, a nemusíte je stihnout.
#
# Spouštění kódu:
# - Jeden příkaz spustíte tak, že do něj umístíte kurzor a stisknete
#   Ctrl + Enter.
# - Více příkazů najednou označte myší a stiskněte Ctrl + Enter.
# - Výsledky se vypisují v panelu Console, grafy v panelu Plots a vytvořené
#   objekty uvidíte v panelu Environment.
#
# Komentáře a odpovědi:
# - Řádky začínající znakem # jsou komentáře; R je nespouští.
# - Kód pište pod řádek "Vaše řešení". Slovní odpovědi pište jako komentáře.
# - Některé ukázky kódu jsou zakomentované. Zkopírujte je do svého řešení
#   a z každého řádku odstraňte úvodní #. Nejrychleji to uděláte tak, že
#   vložené řádky označíte a zvolíte Code > Comment/Uncomment Lines
#   (Ctrl + Shift + C). Spusťte je až tehdy, když už existují objekty,
#   které používají.
# - Nápovědy čtěte postupně. Druhá nápověda je konkrétnější než první.
# - Kopii skriptu průběžně ukládejte pomocí Ctrl + S.
#
# Když se něco pokazí:
# Pokud objekty v Environmentu neodpovídají skriptu, zvolte Session >
# Restart R. Restart smaže objekty z paměti, ale uložené soubory zůstanou.
# Potom znovu spusťte přípravu a své hotové hlavní úlohy shora dolů.

#--------------------------------------------------#
## Výsledky učení a předpoklady -----
#--------------------------------------------------#
# Po cvičení byste měli umět:
# - převést testovatelné biologické tvrzení na nulovou a alternativní
#   hypotézu o sklonu přímky,
# - vyložit velikost efektu v původních jednotkách a jeho nejistotu,
# - sestavit t-statistiku a určit její stupně volnosti,
# - správně číst p-hodnotu a rozlišit chybu I. a II. typu,
# - napsat opatrný biologický závěr.
#
# Navazujeme na předchozí lekce: datové rámce, plot(), hist(), lm(),
# coef(), summary(), confint(), residua a interval spolehlivosti. Nové
# funkce vysvětlujeme vždy u úlohy, kde je poprvé potřebujete.
#
# Krátké připomenutí z minulé lekce (pokud ho znáte, přeskočte ho):
# - sklon říká, o kolik se v průměru změní odezva, když se prediktor
#   zvětší o jednu jednotku;
# - standardní chyba popisuje nejistotu odhadu sklonu;
# - 95% interval spolehlivosti ukazuje rozsah sklonů slučitelných
#   s daty a modelem;
# - graf residuí ukazuje, co přímka nevystihla.

#--------------------------------------------------#
## Technická kontrola souboru -----
#--------------------------------------------------#
# Následující kód zkontroluje, zda je datový soubor na správném místě.
# Označte ho celý a spusťte Ctrl + Enter. Cesta k souboru začíná ve složce
# otevřeného projektu. Pokud soubor chybí, R se zastaví a vypíše, co máte
# zkontrolovat.
soubor_lokality <- "data/pie_crab_site_means.csv"
if (
  !file.exists(soubor_lokality)) {
  stop(
    paste0(
      "Soubor data/pie_crab_site_means.csv nebyl nalezen. ",
      "Otevřete projekt L05_praktikum a zkontrolujte jméno ",
      "a umístění CSV v podsložce data."
    ),
    call. = FALSE
  )
}
# Data pocházejí z měření samců kraba houslisty na slaniskách atlantského
# pobřeží USA. Jeden řádek tabulky představuje jedno slanisko, ne jednoho
# kraba. Proměnné a jednotky:
# kod_lokality      ... zkratka slaniska;
# nazev_lokality    ... název slaniska;
# zemepisna_sirka   ... zeměpisná šířka slaniska ve stupních severní šířky;
# pocet_krabu       ... počet změřených dospělých samců;
# prumerna_sirka_mm ... průměrná šířka krunýře samců v mm.
# Zdroj: pie_crab, lterdatasampler, CC0. Původ a přípravu průměrů popisují
# materiály k této lekci.

#----------------------------------------------------------#
# Hlavní úlohy -----
#----------------------------------------------------------#

#--------------------------------------------------#
## Co lze u slanisek skutečně zkoumat? -----
#--------------------------------------------------#
# Tabulku ze souboru CSV načtete funkcí read.csv() jako v minulých
# lekcích; výsledek uložíte do objektu šipkou <-. Načtenou tabulku
# zkontrolujete těmito funkcemi:
# - head() vypíše prvních šest řádků.
# - str() ukáže typ každého sloupce.
# - colSums(x = is.na(x = ...)) spočítá v každém sloupci chybějící
#   hodnoty. is.na() vrací TRUE pro chybějící hodnotu a při sčítání se TRUE
#   počítá jako 1, FALSE jako 0.

#----------------------------------------#
### Úloha | L05-U01 -----
#----------------------------------------#

# Zadání:
# 1. Načtěte soubor, jehož cesta je uložena v soubor_lokality, a tabulku
#    uložte jako data_lokality.
# 2. Prohlédněte si ji pomocí head(), str() a colSums() a zapište do
#    komentáře, zda některá hodnota chybí.
# 3. Zjistěte, kolik slanisek tabulka obsahuje, a rozsah zeměpisné šířky
#    (sloupec zemepisna_sirka) a počtu změřených krabů na slanisko
#    (sloupec pocet_krabu).
# 4. Pro tvrzení „Na severnějších slaniskách mají samci v průměru širší
#    krunýř“ zapište do komentáře prediktor a odezvu.

# Vaše řešení:


# Očekávaný výsledek:
# Tabulka obsahuje 13 slanisek. Zeměpisná šířka sahá od 30,0 do 42,7° s. š.
# a na každém slanisku bylo změřeno 25 až 37 krabů. Žádná hodnota nechybí.
# Prediktorem je zeměpisná šířka, odezvou průměrná šířka krunýře.
#
# Nápověda 1:
# Kontrolovat můžete až tabulku, která už existuje v Environmentu. Jeden
# řádek je jedno slanisko, takže počet slanisek je počet řádků. Rozsah
# tvoří nejmenší a největší hodnota sloupce.
#
# Nápověda 2:
# Funkci read.csv() zadejte argument file = soubor_lokality. Dále použijte
# nrow() a range(); sloupec vyberete pomocí $, například
# data_lokality$pocet_krabu. Odezva je proměnná, kterou chceme vysvětlit.
#
# Interpretace:
# Je tvrzení testovatelné? Jaký výsledek v datech by mu odporoval?

#--------------------------------------------------#
## Jak velká změna je v datech? -----
#--------------------------------------------------#
# Ukázka: bodový graf průměrů slanisek. Každý bod je jedno slanisko.
# Ukázka je zakomentovaná, protože potřebuje data_lokality z U01.
# plot(
#   x = data_lokality$zemepisna_sirka,
#   y = data_lokality$prumerna_sirka_mm,
#   xlab = "Zeměpisná šířka (° s. š.)",
#   ylab = "Průměrná šířka krunýře (mm)",
#   pch = 16
# )
# Obecný tvar modelu z minulých lekcí:
#   lm(formula = odezva ~ prediktor, data = tabulka)
# Přímku odhadnutou funkcí lm() přidáte do posledního grafu funkcí
# abline() s argumentem reg = jméno_modelu. Funkce coef() vrací intercept
# a sklon modelu.

#----------------------------------------#
### Úloha | L05-U02 -----
#----------------------------------------#

# Zadání:
# 1. Z data_lokality fitujte model, ve kterém je odezvou
#    prumerna_sirka_mm a prediktorem zemepisna_sirka. Uložte jej jako
#    mod_krabi.
# 2. Zobrazte jeho koeficienty pomocí coef().
# 3. Zkopírujte graf z ukázky, odstraňte # a přidejte do grafu přímku
#    mod_krabi.
# 4. Přepočtěte sklon na rozdíl 5° zeměpisné šířky.

# Vaše řešení:


# Očekávaný výsledek:
# Body i přímka převážně stoupají. Sklon je asi 0,490 mm na 1°, za 5° to
# odpovídá změně asi 2,45 mm.
#
# Nápověda 1:
# Ve vzorci modelu patří odezva vlevo od ~ a prediktor vpravo. Přepočet
# na 5° používá stejný sklon pro pětkrát větší rozdíl zeměpisné šířky.
#
# Nápověda 2:
# Funkci lm() zadejte argumenty formula a data = data_lokality. Sklon je
# druhá hodnota z coef(object = mod_krabi); vynásobte ji pěti.
#
# Interpretace:
# Říká samotný sklon, zda je změna biologicky důležitá? Co byste k tomu
# potřebovali vědět?

#--------------------------------------------------#
## Co přímka nevystihla? -----
#--------------------------------------------------#
# Residuum je pozorovaný průměr slaniska minus hodnota odhadnutá přímkou.
# Nula znamená, že slanisko leží přesně na přímce.
# - resid() vrací residua modelu, fitted() hodnoty odhadnuté modelem.
# - abline(h = 0) přidá do grafu vodorovnou čáru v nule; argument lty = 2
#   ji udělá přerušovanou.
# - hist() nakreslí histogram.

#----------------------------------------#
### Úloha | L05-U03 -----
#----------------------------------------#

# Zadání:
# 1. Nakreslete bodový graf residuí mod_krabi (osa y) proti hodnotám
#    odhadnutým modelem (osa x). Obě osy popište včetně jednotky mm.
# 2. Přidejte vodorovnou přerušovanou čáru v nule.
# 3. V samostatném grafu nakreslete histogram residuí.

# Vaše řešení:


# Očekávaný výsledek:
# Residua leží po obou stranách nuly bez zřetelného oblouku nebo
# trychtýře. Několik slanisek se od přímky liší výrazněji než ostatní.
#
# Nápověda 1:
# Graf proti odhadnutým hodnotám ukazuje, zda se odchylky od přímky
# systematicky mění podél přímky. Histogram ukazuje, jak často se residua
# různé velikosti vyskytují.
#
# Nápověda 2:
# V plot() zadejte x = fitted(object = mod_krabi) a
# y = resid(object = mod_krabi). Čáru přidá abline(h = 0, lty = 2).
#
# Interpretace:
# Vidíte oblouk, trychtýř nebo slanisko s velkým residuem? Co z těchto
# grafů nepoznáte o nezávislosti blízkých slanisek?

#--------------------------------------------------#
## Jak přesně známe velikost vztahu? -----
#--------------------------------------------------#
# Ve výstupu summary() sledujte řádek zemepisna_sirka. Estimate je odhad
# sklonu, Std. Error jeho standardní chyba. Sloupce t value a Pr(>|t|)
# zatím nevykládejte; vrátíme se k nim v U05 a U06.
# confint() vypíše 95% intervaly spolehlivosti obou koeficientů.

#----------------------------------------#
### Úloha | L05-U04 -----
#----------------------------------------#

# Zadání:
# 1. Zobrazte summary(object = mod_krabi) a confint(object = mod_krabi).
# 2. V řádku zemepisna_sirka najděte odhad sklonu, jeho standardní chybu
#    a 95% interval spolehlivosti.
# 3. Přepočtěte obě hranice intervalu na rozdíl 5°.
#
# Představte si, že biologové předem označili změnu alespoň 2 mm na 5°
# za biologicky zajímavou.

# Vaše řešení:


# Očekávaný výsledek:
# Odhad sklonu asi 0,490 mm/°, standardní chyba asi 0,0795 mm/° a 95%
# interval 0,315–0,664 mm/°. Na 5° to je asi 1,57–3,32 mm. Interval
# obsahuje hodnoty pod i nad hranicí 2 mm a nulu neobsahuje.
#
# Nápověda 1:
# V obou výstupech má sklon vlastní řádek. Přepočet na 5° nemění model,
# mění jen jednotku rozdílu.
#
# Nápověda 2:
# V summary() čtěte sloupce Estimate a Std. Error. V confint() čtěte
# sloupce 2.5 % a 97.5 % a obě hodnoty vynásobte pěti.
#
# Interpretace:
# Leží celý interval nad hranicí 2 mm, nebo ji protíná? Co z toho
# vyplývá o biologickém významu? Oddělte odhad, jeho nejistotu a předem
# zvolenou hranici důležitosti.

#--------------------------------------------------#
## Jaké přesné tvrzení porovnáváme s daty? -----
#--------------------------------------------------#
# Testujeme parametr přímky: skutečný sklon v širší populaci slanisek.
# Nulová hypotéza H0 tvrdí, že tento sklon je přesně 0 mm/°. Oboustranná
# alternativní hypotéza HA připouští růst i pokles.
#
# t-statistika měří, jak daleko je odhad od nulové hodnoty, v jednotkách
# standardní chyby:
#   t = (odhad sklonu - 0) / standardní chyba sklonu
#
# Model odhaduje dva koeficienty, intercept a sklon. Residuální stupně
# volnosti proto získáme jako počet slanisek minus 2. Funkce df.residual()
# vrací tento počet přímo z modelu.

#----------------------------------------#
### Úloha | L05-U05 -----
#----------------------------------------#

# Zadání:
# 1. Do komentáře zapište H0 a HA pro mod_krabi vlastními slovy. Použijte
#    názvy obou proměnných a jednotku sklonu.
# 2. Z výstupu summary(object = mod_krabi) opište odhad sklonu a jeho standardní
#    chybu a spočtěte z nich t.
# 3. Spočtěte počet slanisek minus 2 a porovnejte výsledek
#    s df.residual(object = mod_krabi).

# Vaše řešení:


# Očekávaný výsledek:
# H0: průměrná šířka krunýře se se zeměpisnou šířkou lineárně nemění,
# sklon je 0 mm/°. HA: sklon není 0 mm/°. t je asi 6,16 a odpovídá
# sloupci t value. Obě cesty dávají df = 11.
#
# Nápověda 1:
# V čitateli vzorce je vzdálenost odhadu od nulové hodnoty, ve jmenovateli
# měřítko nejistoty odhadu.
#
# Nápověda 2:
# Vydělte Estimate hodnotou Std. Error z řádku zemepisna_sirka. Počet
# slanisek vrátí nrow(x = data_lokality).
#
# Interpretace:
# Proč se od počtu slanisek odečítají právě dva? Co by se změnilo,
# kdybychom za pozorování chybně považovali jednotlivé kraby?

#--------------------------------------------------#
## Jak neobvyklý je výsledek v nulovém světě? -----
#--------------------------------------------------#
# Kdyby platila H0 i předpoklady modelu, kolísaly by hodnoty t podle
# t-rozdělení se stejnými stupni volnosti, jaké má model. Pozorované t
# proto porovnáváme s tímto rozdělením. Funkce pt() vrací plochu pod
# t-křivkou nalevo od zadané hodnoty t.
#
# Ukázka: plocha nalevo od t = -2 při 11 stupních volnosti.
pt(
  q = -2,
  df = 11
)
# Oboustranná p-hodnota sčítá plochu v obou chvostech, tedy všechny
# výsledky alespoň tak vzdálené od nuly jako pozorované t. Hladinu
# významnosti alfa = 0,05 volíme dřív, než se na p-hodnotu podíváme.
#
# Velmi malá čísla R vypisuje zkráceně. Například 7.11e-05 znamená
# 7,11 × 10⁻⁵, tedy 0,0000711. Zápis e-05 říká „posuň desetinnou čárku
# o pět míst doleva“.

#----------------------------------------#
### Úloha | L05-U06 -----
#----------------------------------------#

# Zadání:
# 1. Spočtěte oboustrannou p-hodnotu jako dvojnásobek plochy nalevo
#    od -|t|. Použijte t ze své úlohy U05 a
#    df.residual(object = mod_krabi).
# 2. Porovnejte p-hodnotu s předem zvolenou hladinou významnosti alfa = 0,05
#    a rozhodněte o H0.
# 3. Zkontrolujte, zda 95% interval sklonu z U04 obsahuje nulu.

# Vaše řešení:


# Očekávaný výsledek:
# p je asi 0,0000711 (R vypíše 7.112446e-05), tedy méně než 0,05, a H0
# o nulovém sklonu zamítáme. Hodnota odpovídá sloupci Pr(>|t|). Interval nulu neobsahuje.
#
# Nápověda 1:
# Oboustranná alternativa připouští kladný i záporný sklon, proto
# potřebujete plochu v obou chvostech. Křivka je souměrná, takže stačí
# jeden chvost zdvojnásobit.
#
# Nápověda 2:
# Funkci pt() zadejte jako q zápornou absolutní hodnotu t; absolutní
# hodnotu vrátí abs(). Výsledek vynásobte dvěma.
#
# Interpretace:
# Doplňte větu: „Kdyby platila H0 a předpoklady modelu, ...“. Znamená
# p-hodnota pravděpodobnost, že H0 platí?

#--------------------------------------------------#
## Co znamená chybné rozhodnutí? -----
#--------------------------------------------------#
# Zamítnutí H0 není důkazem, že HA platí. Rozhodnutí se může mýlit dvěma
# způsoby:
# - chyba I. typu: zamítneme H0, přestože ve skutečnosti platí;
# - chyba II. typu: H0 nezamítneme, přestože ve skutečnosti neplatí.

#----------------------------------------#
### Úloha | L05-U07 -----
#----------------------------------------#

# Zadání:
# Uvažujte H0: skutečný sklon vztahu mezi zeměpisnou šířkou a průměrnou
# šířkou krunýře je nulový.
# 1. Popište slovy, co by u těchto slanisek znamenala chyba I. typu.
# 2. Popište, co by znamenala chyba II. typu.
# 3. Kterou z obou chyb jsme mohli udělat v U06, když jsme H0 zamítli?

# Vaše řešení:


# Očekávaný výsledek:
# Chyba I. typu: hlásíme vztah se zeměpisnou šířkou, který ve skutečnosti
# neexistuje. Chyba II. typu: skutečný vztah přehlédneme. Protože jsme H0
# zamítli, mohla nastat jen chyba I. typu.
#
# Nápověda 1:
# U každé chyby oddělte skutečný stav (H0 platí, nebo neplatí) od
# rozhodnutí (H0 zamítneme, nebo nezamítneme).
#
# Nápověda 2:
# Chyba II. typu vyžaduje, abychom H0 nezamítli. Podívejte se, jak jsme
# rozhodli v U06.
#
# Interpretace:
# Proč ani velmi malá p-hodnota nevylučuje omyl?

#--------------------------------------------------#
## Co smíme říct o krabech? -----
#--------------------------------------------------#
# Studie je observační. Počty krabů na slaniskách se mírně liší,
# jednoduchý model ale přesto dává průměrům všech slanisek stejnou váhu. Blízká slaniska
# si mohou být podobná a některá mají na přímku větší vliv. Graf residuí
# sám neprokáže nezávislost slanisek ani příčinu vztahu.

#----------------------------------------#
### Úloha | L05-U08 -----
#----------------------------------------#

# Zadání:
# Napište do komentáře 4–6 vět pro biologa o vztahu zeměpisné šířky
# a průměrné šířky krunýře. Dodržte toto pořadí:
# 1. biologická otázka a jednotka pozorování;
# 2. graf, přímka a kontrola residuí;
# 3. odhad sklonu v mm/° a na 5° a jeho možná biologická důležitost;
# 4. 95% interval spolehlivosti;
# 5. p-hodnota vzhledem k H0: sklon = 0 a hladině alfa = 0,05;
# 6. alespoň dvě omezení studie.
# Oddělte doklad o vztahu od tvrzení, že zeměpisná šířka změnu způsobuje.

# Vaše řešení:


# Očekávaný výsledek:
# Po otázce a kontrole modelu závěr uvede efekt asi 0,490 mm/° (2,45 mm
# na 5°) a interval 0,315–0,664 mm/°; teprve potom p-hodnotu. Data jsou při předpokladech modelu obtížně slučitelná
# s nulovým sklonem, ale neprokazují příčinu. Mezi omezeními je například
# prostorová podobnost slanisek a nestejná přesnost průměrů.
#
# Nápověda 1:
# Věcnou velikost vztahu uveďte před rozhodnutím testu; omezení patří
# na konec.
#
# Nápověda 2:
# Čísla vezměte z U02 (sklon a 5°), U04 (interval) a U05–U06 (t, df, p).
# Omezení najdete v textu nad touto úlohou.
#
# Interpretace:
# Které věty vašeho závěru by se nezměnily, kdyby p-hodnota vyšla 0,2?

#----------------------------------------------------------#
# Úlohy navíc -----
#----------------------------------------------------------#
# Tyto úlohy nejsou součástí hlavních úloh. Můžete si vybrat jednotlivé
# úlohy; většina potřebuje mod_krabi z U02 a úloha N09 druhý soubor CSV.
# Nové objekty pojmenujte jinak než objekty z hlavních úloh, abyste si
# je nepřepsali.

#--------------------------------------------------#
## Tvrzení, data a význam efektu -----
#--------------------------------------------------#

#----------------------------------------#
### Úloha navíc | L05-N01 -----
#----------------------------------------#

# Zadání:
# U každého výroku rozhodněte, zda jej lze ověřit pozorováním:
# - „Měsíc je ze sýra.“
# - „Krab houslista je nejkrásnější živočich.“
# - „Na těchto slaniskách roste průměrná šířka krunýře se zeměpisnou
#   šířkou.“
# U testovatelných výroků popište pozorování, které by jim odporovalo.

# Vaše řešení:


# Očekávaný výsledek:
# První a třetí výrok lze ověřovat daty, druhý je hodnotový soud. Měsíc
# ze sýra je testovatelný, i když nevěrohodný.
#
# Nápověda 1:
# Zeptejte se, zda si umíte představit pozorování, které by výrok vyvrátilo.
#
# Nápověda 2:
# Chemické složení hornin i velikost krabů lze změřit; pro slovo
# „nejkrásnější“ neexistuje společné měřicí pravidlo.
#
# Interpretace:
# Čím se liší testovatelnost výroku od jeho věrohodnosti?

#----------------------------------------#
### Úloha navíc | L05-N02 -----
#----------------------------------------#

# Zadání:
# Z mod_krabi přepočtěte odhad sklonu a jeho 95% interval na rozdíl 10°
# zeměpisné šířky. Hypotetický biolog považuje za důležitou změnu alespoň
# 3 mm na 10°. Rozhodněte, zda tuto hranici překračuje bodový odhad a zda
# ji překračují všechny hodnoty intervalu.

# Vaše řešení:


# Očekávaný výsledek:
# Odhad asi 4,90 mm a interval asi 3,15–6,64 mm na 10°. Celý interval
# leží nad hypotetickými 3 mm.
#
# Nápověda 1:
# Jednotku „na 1°“ převedete na „na 10°“ stejným násobkem u odhadu
# i u obou hranic intervalu.
#
# Nápověda 2:
# Druhou hodnotu z coef(object = mod_krabi) a řádek zemepisna_sirka
# z confint(object = mod_krabi) vynásobte deseti.
#
# Interpretace:
# Proč je pro biologický význam důležitější celý interval než samotný
# bodový odhad?

#----------------------------------------#
### Úloha navíc | L05-N03 -----
#----------------------------------------#

# Zadání:
# Ve výstupu summary(object = mod_krabi) porovnejte řádky (Intercept)
# a zemepisna_sirka. Uveďte, který z nich odpovídá změně v mm na 1°
# a co by zde znamenal intercept.

# Vaše řešení:


# Očekávaný výsledek:
# Změnu popisuje sklon v řádku zemepisna_sirka. Intercept je odhad pro
# zeměpisnou šířku 0°, tedy hluboko mimo pozorovaný rozsah 30,0–42,7°.
#
# Nápověda 1:
# Význam interceptu zjistíte, když za prediktor v rovnici přímky
# dosadíte nulu.
#
# Nápověda 2:
# Porovnejte 0° s výsledkem range() pro sloupec zemepisna_sirka.
#
# Interpretace:
# Proč intercept nevykládáme jako šířku krabů na rovníku?

#--------------------------------------------------#
## Testová statistika a rozhodnutí -----
#--------------------------------------------------#

#----------------------------------------#
### Úloha navíc | L05-N04 -----
#----------------------------------------#

# Zadání:
# Spočtěte residuální stupně volnosti jednoduché regrese s interceptem
# a sklonem pro studii s 8 a s 20 nezávislými slanisky.

# Vaše řešení:


# Očekávaný výsledek:
# df = 6 a df = 18.
#
# Nápověda 1:
# Residuální stupně volnosti závisí na počtu nezávislých řádků hlavní
# analýzy a na počtu odhadnutých koeficientů.
#
# Nápověda 2:
# Model stále odhaduje dva koeficienty; odečtěte je od počtu slanisek.
#
# Interpretace:
# Proč se odečítá počet koeficientů, a ne počet změřených krabů?

#----------------------------------------#
### Úloha navíc | L05-N05 -----
#----------------------------------------#

# Zadání:
# Pro ilustrativní |t| = 2 spočtěte oboustrannou plochu ve chvostech
# t-rozdělení při df = 11 a při df = 30. Která plocha je menší?
# Hodnota 2 není krabí t-statistika.

# Vaše řešení:


# Očekávaný výsledek:
# Asi 0,0708 pro df = 11 a 0,0546 pro df = 30; druhá plocha je menší.
#
# Nápověda 1:
# Oboustranná otázka potřebuje oba chvosty za stejně vzdálenými hranicemi.
#
# Nápověda 2:
# Použijte pt() stejně jako v ukázce před U06 a výsledek pokaždé
# zdvojnásobte.
#
# Interpretace:
# Proč je při více stupních volnosti stejná hodnota |t| neobvyklejší?

#----------------------------------------#
### Úloha navíc | L05-N06 -----
#----------------------------------------#

# Zadání:
# Ponechte p-hodnotu modelu mod_krabi stejnou jako v U06. Rozhodněte o H0
# při předem zvolených hladinách alfa = 0,01 a alfa = 0,00001.

# Vaše řešení:


# Očekávaný výsledek:
# Při alfa = 0,01 H0 zamítneme, při alfa = 0,00001 ji nezamítneme.
#
# Nápověda 1:
# Nová hladina alfa mění hranici rozhodnutí, nikoli výstup už fitovaného
# modelu.
#
# Nápověda 2:
# H0 zamítáme, když p < alfa. Pomůže zapsat obě čísla stejně:
# p ≈ 7,1 × 10⁻⁵, alfa = 1 × 10⁻² a alfa = 1 × 10⁻⁵.
#
# Interpretace:
# Změnila se se změnou hladiny alfa data nebo odhadnutý efekt?

#----------------------------------------#
### Úloha navíc | L05-N07 -----
#----------------------------------------#

# Zadání:
# Pro mod_krabi vypište 90% a 99% interval spolehlivosti sklonu.
# Hladinu spolehlivosti nastavíte ve funkci confint() argumentem level.
# Porovnejte jejich šířku s 95% intervalem z U04. Obsahuje některý z nich
# nulový sklon?

# Vaše řešení:


# Očekávaný výsledek:
# 90% interval asi 0,347–0,632 mm/° a 99% interval asi 0,243–0,736 mm/°.
# Vyšší spolehlivost dává širší interval; žádný z intervalů nulu
# neobsahuje.
#
# Nápověda 1:
# Hladina spolehlivosti mění šířku intervalu, nikoli bodový odhad.
#
# Nápověda 2:
# Hladinu zadejte v argumentu level jako desetinné číslo (95 % je 0.95).
# Čtěte řádek zemepisna_sirka.
#
# Interpretace:
# Proč si za větší jistotu platíme širším intervalem?

#----------------------------------------#
### Úloha navíc | L05-N08 -----
#----------------------------------------#

# Zadání:
# Představte si, že podle zjištěného vztahu se zeměpisnou šířkou chcete
# přednostně sledovat severní slaniska. Uveďte jeden možný praktický
# následek chyby I. typu a jeden následek chyby II. typu.

# Vaše řešení:


# Očekávaný výsledek:
# Falešně ohlášený vztah může přesunout monitoring bez věcného důvodu;
# přehlédnutý vztah může zdržet další výzkum.
#
# Nápověda 1:
# Oddělte skutečný stav od rozhodnutí a popište, co by každý omyl stál
# při omezených zdrojích.
#
# Nápověda 2:
# U chyby I. typu je skutečný sklon nulový, u chyby II. typu nenulový.
#
# Interpretace:
# Proč volba hladiny alfa neodstraní obě chyby najednou? Pozor: netvrďte,
# že zeměpisná šířka sama způsobuje velikost krabů.

#--------------------------------------------------#
## Jednotka pozorování a kontrola modelu -----
#--------------------------------------------------#
# Pro N09 potřebujete i tabulku jednotlivých krabů. Stáhněte soubor
# https://cuni-natur-biostatistics.github.io/L05/current/data/pie_crab.csv
# a uložte jej jako pie_crab.csv do podsložky data. Ostatní úlohy navíc
# tento soubor nepotřebují.
#
# Funkce unique() vrátí každou hodnotu jen jednou a length() spočítá
# jejich počet.

#----------------------------------------#
### Úloha navíc | L05-N09 -----
#----------------------------------------#

# Zadání:
# Pokud jste stáhli data/pie_crab.csv, načtěte jej jako data_krabi.
# 1. Zjistěte počet jednotlivých krabů.
# 2. Zjistěte, z kolika různých slanisek pocházejí (sloupec kod_lokality).
# 3. Porovnejte oba počty s počtem řádků data_lokality.

# Vaše řešení:


# Očekávaný výsledek:
# 392 krabů ze 13 slanisek; model mod_krabi pracuje se 13 průměry slanisek.
#
# Nápověda 1:
# Počet měření a počet nezávislých slanisek odpovídají dvěma různým
# otázkám.
#
# Nápověda 2:
# Použijte read.csv(), nrow() a length(x = unique(x = ...)) na sloupec
# data_krabi$kod_lokality.
#
# Interpretace:
# Proč krabi ze stejného slaniska nejsou 392 nezávislých odpovědí
# na otázku o zeměpisné šířce? Ze které tabulky jsme počítali p-hodnotu?

#----------------------------------------#
### Úloha navíc | L05-N10 -----
#----------------------------------------#

# Zadání:
# Vraťte se k rozsahu sloupce pocet_krabu z U01. Kolikrát víc krabů bylo
# změřeno na slanisku s největším počtem než na slanisku s nejmenším?

# Vaše řešení:


# Očekávaný výsledek:
# 25 až 37 krabů, tedy asi 1,5krát více.
#
# Nápověda 1:
# Porovnejte nejmenší a největší hodnotu podílem.
#
# Nápověda 2:
# Vydělte největší počet nejmenším; oba najdete ve výstupu range() z U01.
#
# Interpretace:
# Proč mohou mít průměry slanisek různou přesnost? Jak s tím zacházel
# model mod_krabi, který všem slaniskům dal stejnou váhu?

#----------------------------------------#
### Úloha navíc | L05-N11 -----
#----------------------------------------#

# Funkce which.max() vrátí pořadí největší hodnoty ve vektoru; abs() vrací
# absolutní hodnotu, tedy velikost čísla bez znaménka.
#
# Zadání:
# Z resid(object = mod_krabi) najděte slanisko s největší absolutní odchylkou
# od přímky. V data_lokality určete jeho kod_lokality a uveďte velikost
# residua v mm.

# Vaše řešení:


# Očekávaný výsledek:
# Slanisko VCR, residuum asi +1,87 mm.
#
# Nápověda 1:
# Hledejte největší velikost odchylky bez ohledu na znaménko. Pořadí
# residua odpovídá řádku v data_lokality.
#
# Nápověda 2:
# Nejdřív z residuí udělejte absolutní hodnoty pomocí abs(), potom na ně
# použijte which.max(). Získané číslo použijte jako číslo řádku
# v data_lokality.
#
# Interpretace:
# Proč velké residuum samo neprokazuje chybu měření ani chybnou nulovou
# hypotézu?

#----------------------------------------#
### Úloha navíc | L05-N12 -----
#----------------------------------------#

# Operátor != znamená „není rovno“. Zápis x[podmínka, ] vybere řádky,
# ve kterých je podmínka TRUE.
#
# Zadání:
# 1. Z data_lokality vynechte nejjižnější slanisko GTM a zbylá slaniska
#    uložte jako data_bez_gtm.
# 2. Fitujte stejnou přímku jako mod_krabi, uložte ji jako mod_bez_gtm
#    a porovnejte oba sklony.

# Vaše řešení:


# Očekávaný výsledek:
# Sklon se změní z asi 0,490 na asi 0,559 mm/°; oba jsou kladné.
#
# Nápověda 1:
# Měníte soubor slanisek, nikoli odezvu ani prediktor.
#
# Nápověda 2:
# Vyberte řádky, kde data_lokality$kod_lokality != "GTM", a v lm() použijte
# stejný vzorec jako v U02.
#
# Interpretace:
# Zůstává směr vztahu stejný? Dokazuje tato jedna kontrola nezávislost
# slanisek nebo příčinu vztahu?

#----------------------------------------#
### Úloha navíc | L05-N13 -----
#----------------------------------------#

# Zadání:
# Následující tři věty jsou záměrně chybné. Opravte každou z nich podle
# mod_krabi a svých výsledků:
#
#   „p = 0,0000711 znamená 99,99289% pravděpodobnost, že HA je pravdivá.“
#   „Statistická významnost dokazuje velký biologický efekt.“
#   „Zeměpisná šířka způsobuje větší kraby.“
#
# V každé opravě uveďte, co data skutečně podporují.

# Vaše řešení:


# Očekávaný výsledek:
# P-hodnota je podmíněná plocha v nulovém světě. Věcnou velikost ukazuje
# sklon s intervalem a biologickým kontextem. Observační vztah sám
# neurčuje příčinu.
#
# Nápověda 1:
# Každá věta zaměňuje jinou otázku: pravdivost hypotézy, velikost efektu
# a příčinu.
#
# Nápověda 2:
# Vraťte se k U04, U06 a k omezením uvedeným před U08.
#
# Interpretace:
# Která z oprav by se změnila, kdyby studie byla řízený experiment?

#----------------------------------------------------------#
# Ohlédnutí a vlastní kontrola -----
#----------------------------------------------------------#
# Zkuste bez kódu odpovědět na tyto otázky:
# 1. Proč model pracuje jen se 13 pozorováními, i když bylo změřeno mnohem
#    více krabů?
# 2. Co znamená sklon 0,490 mm/° a co jeho standardní chyba? Rozhoduje
#    o biologické důležitosti samotné číslo?
# 3. Za jakých podmínek čteme p-hodnotu a co neříká?
# 4. Jak se liší chyba I. a II. typu?
# 5. Která omezení brání příčinnému závěru?
# Pokud si nejste jistí, vraťte se k úlohám U01, U02–U04, U06 a U07–U08.
#
# Věcný závěr začíná velikostí vztahu a jeho nejistotou. Test odpovídá
# na užší otázku: jak slučitelná jsou data s přesně nulovým sklonem
# za předpokladů modelu.
