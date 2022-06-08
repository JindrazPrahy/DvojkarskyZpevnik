# Práce na vývoji zpěvníku
Chceš zpěvníku nějak přispět? Skvělé, tady je napsané, jak na to.
Zpěvník lze vyvíjet na Linuxu i na Windows. Nicméně jeho vývoj je možná trochu
složitější, než by se dalo čekat, je potřeba si nainstalovat několik progamů,
naučit se s nimi pracovat, a pochopit, jak spolu interagují.
Snad tě tedy tento komplexní proces neodradí a třeba se i něco naučíš.

# Přehled
Abys mohl pomoci s vývojem zpěvníku, je potřeba, aby ses naučil tyto věci:

1. Co je co? Aneb, jaké programy k vývoji používáme, a jaký je mezi nimi vztah.
2. Jak se dám do práce? Aneb, jak si stáhnout naše pracovní soubory.
3. Základy programu LaTeX
4. Jak my používáme LaTeX?
5. Struktura repositáře

# 1. Co je co?

Náš zpěvník píšeme pomocí programu jménem LaTeX a~ukládáme si ho (a~sdílíme) pomocí služby
[GitHubu](https://desktop.github.com/).

Nepoužíváme tedy Microsoft Word, ani Libre Office, ani Open Office, ani Adobe něco, ale
LaTeX pro psaní zpěvníku. Byť **LaTeX** plní stejnou funkci jako jmenované programy, funguje trochu jinak.
Zatímco např. MS Word funguje jako jeden program, LaTeX je jen něco, co bych nazval anglickým
slovem engine, neboli stroj, který vytváří dokumenty, když mu řeknete jak. Budeme tedy
potřebovat jednak program, který zprostředkuje LaTeX, engine, nebo překladač chcete-li,
a pak jiný program, který LaTeXu bude předhazovat instrukce, podle kterých vytvoří dokument.

Hotové dokumenty si chceme mezi sebou sdílet a vidět i minulé verze, a k tomu
používáme verzovací systém **git**. Někdo musí soubory ale fyzicky (digitálně)
uchovávat, a to je GitHub, který pro uchovávání používá git. Tedy GitHub je
místo, kde máme své soubory (je to něco jako sociální síť) a s GitHubem
komunikujeme pomocí Gitu. Pokud tohle čteš, jsi pravděpodobně na stránce
GitHubu. Celému projektu uloženému na GitHubu se říká GitHubový repositář. Celému projektu uloženému na GitHubu se říká GitHubový repositář.

Ty si na svém počítači budeš muset instalovat:

1. LaTeXový engine, který tvoří dokumenty,
2. Textový editor, který enginu říká, jaké dokumenty má vytvořit,
3. Gitový klient, který komunikuje s GitHubem a dává mu výsledky tvé práce.

Všechny tyto části v průběhu tutorialu vysvětlíme.

# 2. Jak se mám dát do práce?

Aby ses mohl dát do práce, musíš si stáhnout kopii našich pracovních souborů.
K tomu musíš komunikovat pomocí gitu s GitHubem.

## Windows
1. Nainstaluj si nějaký Git client - třeba [od GitHubu](https://desktop.github.com/)
2. Založ si účet na githubu -- pro přispívání je potřeba vědět, kdo příspěvek
   udělal.
3. Clonuj zpěvník: V exploreru dojdi tam, kde chceš mít zpěvník, pravé tlačítko
   -> Git Clone -> do URL zadej
https://github.com/JindrazPrahy/DvojkarskyZpevnik.git
4. Zapamatuj si, kam se ti na počítač uložil náš repozitář.

## Linux

Budeme předpokládat, že máš Ubuntu, jinak pravděpodobně tenhle návod
nepotřebuješ.

### Instalace Gitu a LaTeXu

1. Nainstaluj si Git:
```
sudo apt-get install git
```
2. Stáhni si repozitář tak, že pomocí cd dojdeš do složky, kde ho chceš mít,
a pak napíšeš
```
git clone https://github.com/JindrazPrahy/DvojkarskyZpevnik
```
3. Pravděpodobně se ti bude hodit mít účet na GitHubu


## Používání Gitu

Nyní následuje schéma, jak se pracuje s gitem:
1. Stáhnete si nejaktuálnější kopii práce
2. Provedete měny
3. Řeknete počítači, které změny jste provedli
4. Popíšete pro ostatní, co to bylo za změny
5. Uploadnete změny

Nyní, jak se to provede technicky?

### Windows

1. Zapni program GitHub.
2. Před prací stáhni nejaktuálnější verzi zpěvníku. Dělá se to kliknutím na
   tlačítko pull (nebo git pull).
3. Prováděj úpravy pomocí externích programů (bude popsáno níže).
4. Do relevantní kolonky v programu GitHub napiš tzv. commit message, neboli
   zprávu, jaké úpravy jsi podnikl.
5. Zaškrtni, které soubory chceš uploadnout.
6. Commitni vhodným tlačítkem.
7. Uploadni neboli pushni svou práci vhodným tlačítkem.
8. V kroku 3. lze mít vypnutý program GitHub.

### Linux

1. cd do souboru se zpěvníkem
2. Stáhni si nejaktuálnější verzi (!nutné!):
```
git pull
```
3. Uprav nějaké soubory podle svého uvážení.
4. Nahlaš, které soubory jsi upravoval takto:
```
git add SOUBOR
```
Pro lenochy:
```
git add -R *
```
5. Jeden commit je takový balík, po kterém se do repozitáře uploadují změny.
6. Commituj soubory, vždy musíš přidat zprávu popisující, jaké změny jsi
   udělal:
```
git commit -m"Zpráva v commitu"
```
7. Uploadni změny:
```
git push
```
8. Budeš muset zadat své GitHubové jméno a heslo.


2. Nainstaluj si LaTeX (jsou to 3Gb):
```
sudo apt-get install texlive-full
```
3. Nainstaluj si TeXmaker:
```
sudo apt-get install texmaker
```
4. Pokud jsi fajnšmekr, stačí ti místo texmakeru sudo apt-get install vim.


# Základy programu LaTeX


LaTeX je tzv. značkovací jazyk, něco jako html. V jazyku se napíše kód, ten se
pak přeloží překladačem LaTeXu, a vznikne pdf. Základní znalosti LaTeXu lze nabýt třeba
zde:
1. [http://www.jidu.cz/Navody/LaTeX/](http://www.jidu.cz/Navody/LaTeX/index.php),
2. [https://www.overleaf.com/learn/latex/Learn_LaTeX_in_30_minutes](https://www.overleaf.com/learn/latex/Learn_LaTeX_in_30_minutes).

Nyní předpokládáme, že víš, jak LaTeX funguje, a dokážeš napsat a zkompilovat
nějaký jednoduchý dokument.

# Jak my používáme LaTeX?

Zaměřme se na to, jak funguje zpěvník ve složce Cely_zpevnik. Ostatní zpěvníky
fungují analogicky. Když otevřte soubor Zpevnik.tex a zkompilujete jej (což
trvá dlouho), tak byste měli obdržet pdf celého zpěvníku. Jak ale zajišťujeme,
aby tento soubor byl přehledný i při velkém počtu jednotlivých písniček?
Vkládáme je do zpěvníku z jiných souborů. Vskutku si můžete všimnout, že toto
se provádí pomocí mnoha řádků s nápisem \input...
Písničky, které se do zpěvníku vkládají, jsou uložené ve složce songy.

Vývoj tedy probíhá tak, že člověk buď přidá nějakou novou písničku do složky
songy, či upraví stávající. Jak ale zobrazíme jednotlivé písničky? To se dělá
pomocí souboru ve složce Generator. Když si ten soubor otevřeš a zkompiluješ
ho, objeví se jedna zkompilovaná písnička. Písnička, která se objeví, je napsaná
na předposledním řádku, můžeš ji přepsat na nějakou jinou a pak ji zkompilovat.

Editace písničky probíhá tedy tak, že člověk má v jednom tabu otevřený song, který
edituje, a když se na něj chce kouknout, tak zkompiluje soubor generator.tex otevrený
ve druhém tabu.

Songy mají nějaký formát, který je vysvětlen v souboru
songy/00Songtemplate.tex.
Ten se musíš naučit, ale neměl by být příliš těžký. Naučení se s tím formátem
je snad ta nejtěžší část vývoje zpěvníku.

Technická poznámka: kompilujeme v nonstopmodu, protože ten zpěvník má nějaké skryté bugy,
které ale nic nedělají.


# Struktura repositáře

Git má tzv. branche, neboli různé vývojové větve. V každé větvi najdete jiný zpěvník.
Toto jsou jednotlivé větve:

- **master** - zde najdete všechny písničky v pdf, txt a táborový zpěvník Pražské Dvojky
- **Wakan** - zde najdete táborový zpěvník Wakanů
- **Ucebni** - tohle je branch pro redukovaný zpěvník pro ty, co se učí na kytaru
- **Vanocni** - Zpěvník s koledami

Popišme ještě strukturu branche master.

- Akordy - obrázky akordů na vkládání do zpěvníku
- Cely_zpevnik - složka s celým zpěvníkem
- Generator - vývojová složka, kde si můžete zkoušet jednotlivé songy
- pdf - pdf jednotlivých songů
- scripts - kompilační skripty
- songy - LaTeXové zdrojové soubory písniček
- taby - obrázky složitých kytarových kreací na vkládání do zpěvníku
- txt - jednotlivé písničky ve formátu txt


# Pokročilé

Chcete-li zkompilovat všechny songy jednotlivě, tak je na to bashový skript,
který funguje tak, že pouze `./skript.sh` zkompiluje všechno a `./skript.sh -f
song` zkompiluje jen jeden song. Můžete buď kompilovat do formátu txt skriptem
ve složce txt, nebo do formátu pdf skriptem ve složce Generator.

# Typo pravidla

Vzhledem k tomu, že výhodou LaTeXu je jeho konzistence,
chci tuto konzistenci využít co nejvíc a všechny rozhodnutí
ohlednì typografie napsat sem, aby se vše mohlo sjednotit.


1. ZDROJOVÝ KÓD: nové odsazení pomocí dvou mezer, text písní
 pro čitelnost odsazen odstavcem, používejte makra tam, kde
 to jen jde.
2. KOMPILACE jednotlivých písní pomocí \include:
 - \include{} znamená, že se do texového souboru
 vloží obsah jiného texového souboru (jako #include
 v jazyce C).
 - Při kontrolování jednotlivých písní tedy nezbyde než
 používat generátor jednotlivých písní, ale zase
 se všechny v případě potřeby můžou vysázet pomocí
 hlavního dokumentu Zpěvník.
3. KLASIKA:
 - Uvozovky sázejte pomocí \uv{} pokud to půjde, jinak
 pište ,, (začátek) `` (konec).
 - Vnímejte rozdíl mezi pomlèkou - a spojovníkem --
 (Prostě používejte -- ve větě jako , a - jen v jednom slově
 jako třeba ice-cream. Kdyžtak: [http://prirucka.ujc.cas.cz/?id=164](http://prirucka.ujc.cas.cz/?id=164)
4. REPETICI pište pomocí /: :/ a značte kde možné pro šetření místa.
5. AKORDY nad slova pomocí ^{}, které je před slovem. Více akordů
      (vybrnkávání, předehra...) pomocí \textbf{} (aby nelítaly ve vzduchu).
      Taky nepsat opakující se vzorec akordů vícekrát, než je pochopitelné.
6. OBRÁZKY akordů jsou více volné. Nemusí být u každé písničky. Nemají
   specifické místo, ale doporučená velikost je nejvíc width=3cm.
7. SLOKY, REFRÉNY a NÁZVY písní pište pomocí upraveného balíčku leadsheets
   a předdefinovaných makr (příkazů).
8. ZAROVNÁNÍ písní na støed je ve verzi 18.09 automatizované.
9. ROZLOŽENÍ písně na stránce: Přehlednost > Místo, takže
   Velikost písma > Aby toho na jedné stránce nebylo moc >
   Aby se to za každou cenu nacpalo do jedné stránky.
10. GRAMATIKA: Necopypastujte prosím chyby.
    Písničky jsou také text, takže doplňujte tečky a čárky. Velká
    písmena jsou jako v normálních větách a v prvním slově v názvu.
11. ANGLICKÉ písně mají:
      -velká všechna písmena v názvu;
      -velká všechna písmena na začátku řádku.
12. ELIPSA (tři tečky za sebou) se píše takto:
 - Slovo\elipsa\dots\,.
 - \elipsa je mnou definovaný příkaz o dané délce.
 - pokud \dots nejdou zkompilovat, pište:
 \elipsa.\elipsa.\elipsa.\,
