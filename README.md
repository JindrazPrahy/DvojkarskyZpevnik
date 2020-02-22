
# DvojkarskyZpevnik

Toto je vývojový repozitář pro velký Dvojkařský Zpěvník. Všechny songy jsou zde
psány pomocí *LaTeX*u.  Zpěvník je uzpůsoben pro kroužkovou vazbu (songů už je
hodně) - umožňuje tak do starších zpěvníků přidávat nové songy, jenž zde
přibývají.

[Přehled písní ve zpěvníku](https://docs.google.com/spreadsheets/d/1ej4QIp3_96SE3kHn7L9kaiDOEUqHb9XJ2Mvoauu2prE/edit#gid=0) - přidávejte sem nové návrhy!


# Stažení

Můžeš si na *GitHub*u najít požadované *pdf* jednoho songu, který chceš. Po
jeho otevření je vpravo nahoře tlačítko Download.  Nebo je celý zpěvník zde:
https://github.com/JindrazPrahy/DvojkarskyZpevnik/blob/master/18_09_LTS/Cely_zpevnik/Zpevnik.pdf.
V repozitáři je ještě spousta jiných věcí týkajících se zpěvníku, můžeš si je
taky stáhnout.

# Práce na vývoji zpěvníku
Chceš zpěvníku nějak přispět? Skvělé, tady je napsané, jak na to.

Zpěvník lze vyvíjet na Linuxu i na Windows. Pro Windows přikládáme detailnější
návod, pro Linux stručnější návod.

Návod sestává ze tří částí -- jak instalovat potřebné programy, jak pracovat s
Gitem, neboli programem, který pracuje s verzemi zpěvníku, a jak pracovat
s~LaTeXem, neboli programem, který generuje pdf zpěvníku.
Používání LaTeXu je podobné pro oba OS, je pro něj tedy toliko jedna sekce.

## Windows

### Instalace Gitu a LaTeXu
1. Nainstaluj si nějaký Git client - třeba [od GitHubu](https://desktop.github.com/)
2. Založ si účet na githubu -- pro přispívání je potřeba vědět, kdo příspěvek
   udělal.
3. Clonuj zpěvník: V exploreru dojdi tam, kde chceš mít zpěvník, pravé tlačítko
   -> Git Clone -> do URL zadej
https://github.com/JindrazPrahy/DvojkarskyZpevnik.git
4. Zapamatuj si, kam se ti na počítač uložil náš repozitář.
5. Nyní je potřeba si nainstalovat LaTeXový překladač. Pokud jsi nováček, tak
   si nainstaluj MikXeX z https://miktex.org/, jinak doporučujeme TeX Live z
https://tug.org/texlive/acquire-netinstall.html.
6. Po tomto kroku je nainstalovaný překladač -- stroj, který z kódu vyprodukuje
   pdf soubor. Nyní je ještě potřeba si stáhnout editor -- program, ve kterém
lze editovat kód. S MikTeXem je přibalen editor TeXWorks. My však doporučujeme
si nainstalovat editor TeXmaker z https://www.xm1math.net/texmaker/.

Pozn. pokud jsi fajnšmekr, můžeš si do Windowsu nainstalovat vnořený Linux,
více info na [stránkách Microsoftu](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
nebo pod jménem bash on Ubuntu on Windows.

### Používání Gitu
Pokaždé, když chceš něco upravit na zpěvníku, dělá se to takto:

1. Zapni program GitHub.
2. Před prací stáhni nejaktuálnější verzi zpěvníku. Dělá se to kliknutím na
   tlačítko pull.
3. Prováděj úpravy.
4. Do relevantní kolonky v programu GitHub napiš tzv. commit message, neboli
   zprávu, jaké úpravy jsi podnikl.
5. Zaškrtni, které soubory chceš uploadnout.
6. Commitni vhodným tlačítkem.
7. Uploadni neboli pushni svou práci vhodným tlačítkem.
8. V kroku 3. lze mít vypnutý program GitHub.

## Linux

Budeme předpokládat, že máš Ubuntu, jinak pravděpodobně tenhle návod
nepotřebuješ.

### Instalace Gitu a LaTeXu

1. Nainstaluj si Git:
```
sudo apt-get instal git
```
2. Nainstaluj si LaTeX (jsou to 3Gb):
```
sudo apt-get install texlive-full
```
3. Nainstaluj si TeXmaker:
```
sudo apt-get install texmaker
```
4. Pokud jsi fajnšmekr, stačí ti místo texmakeru sudo apt-get install vim.
5. Stáhni si repozitář tak, že pomocí cd dojdeš do složky, kde ho chceš mít,
a pak napíšeš
```
git clone https://github.com/JindrazPrahy/DvojkarskyZpevnik
```

### Používání Gitu

Vždy, když chceš něco udělat, dodržuj toto schéma:

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
git add *
```
5. Commit je balíček, po kterém se do repozitáře uploadují změny.
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

## Používání LaTeXu

LaTeX je tzv. značkovací jazyk, něco jako html. V jazyku se napíše kód, ten se
pak přeloží LaTeXem, a vznikne pdf. Základní znalosti LaTeXu lze nabýt třeba
zde: https://www.overleaf.com/learn/latex/Learn_LaTeX_in_30_minutes. Zastáváme
názor, že se jedná o intuitivní záležitost.

Nyní předpokládáme, že víš, jak LaTeX funguje, a dokážeš napsat a zkompilovat
nějaký jednoduchý dokument.


### Jak funguje zpěvník?

Zaměřme se na to, jak funguje zpěvník ve složce Cely_zpevnik. Ostatní zpěvníky
fungují analogicky.

Bylo by neefektivní mít všechny písničky vypsané v jednom souboru.
Máme tedy adresář se jménem songy, ve kterém jsou jednotlivá těla písniček.

Songy mají nějaký formát, který je vysvětlen v souboru
songy/00Songtemplate.tex.
Je to celkem intuitivní formát, máte-li otázky, pište na email vlastníkovi
repozitáře.

Když chcete vidět, jak song vypadá v pdf, tak nemůžete zkompilovat samotný
song, musíte použít soubor Generator/generator.tex.
Do argumentu příkazu input předposledního řádku napíšete jméno songu,
načež můžete kompilovat tento soubor a vyjde pdf daného songu.
Pozor, musíte však kompilovat v nonstopmodu. Na Linuxu a~pro
powerusery Windowsu se to udělá takto:
```
pdflatex -interaction=nonstopmode jméno souboru
```

Chcete-li kompilovat celý zpěvník, můžete rovnou zkompilovat relevantní soubor
celého zpěvníku opět v nonstopmodu.
Chcete-li zkompilovat všechny songy jednotlivě, tak je na to bashový skript,
který funguje tak, že pouze `./skript.sh` zkompiluje všechno a `./skript.sh -f
song` zkompiluje jen jeden song. Můžete buď kompilovat do formátu txt skriptem
ve složce txt, nebo do formátu pdf skriptem ve složce Generator.

# Orientace v jednotlivých branchích

- **master** - zde najdete všechny písničky v pdf, txt a táborový zpěvník Pražské Dvojky
- **Wakan** - zde najdete táborový zpěvník Wakanů
- **Ucebni** - tohle je branch pro redukovaný zpěvník pro ty, co se učí na kytaru
- **Vanocni** - Zpěvník s koledami



