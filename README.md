# DvojkarkyZpevnik

Toto je vývojový repozitář pro velký Dvojkařský Zpěvník. Všechny songy jsou zde psány pomocí *LaTeX*u.
Zpěvník je uzpůsoben pro kroužkovou vazbu (songů už je hodně) - umožňuje tak do starších zpěvníků přidávat nové songy, jenž zde přibývají.

[Přehled písní ve zpěvníku](https://docs.google.com/spreadsheets/d/1ej4QIp3_96SE3kHn7L9kaiDOEUqHb9XJ2Mvoauu2prE/edit#gid=0) - přidávejte sem nové návrhy!


# Instalace

**Možnost A:** Chci jen zpěvník nebo specifické *pdf* se songem

Potom si na *GitHub*u najdi požadované *pdf*. Po jeho otevření je vpravo nahoře tlačítko Download.

**Možnost B:** Chci si stáhnout všechno a pracovat na vývoji zpěvníku

Protože je nepravděpodobně pravděpodobné, že se někdo další zapojí do vývoje, proto je zpěvník vyvíjen na OS Windows...

1. Nainstaluj si nějaký Git client - třeba [TortoiseGit](https://tortoisegit.org/download/)
2. Clonuj zpěvník: V exploreru dojdi tam, kde chceš mít zpěvník, pravé tlačítko -> Git Clone -> do URL zadej https://github.com/8ToThePowerOfMol/DvojkarkyZpevnik.git
3. Nainstaluj si Ubuntu shell pro Windows, návod na [stránkách Microsoftu](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
4. Otevři si česrvý shell (bash) a nainstaluj zde v Ubuntu *LateX*ový překladač: `sudo apt-get install texlive-latex-base` hotovo.
5. Nainstaluj si *LateX*ový překladač ve Windows - třeba [MikTeX](https://miktex.org/download)
 


# Orientace v Repozitáři

- **Misc** - zde najdete starou verzi zpěvníku, handout s koledami a i šablonu na sázení písní po jedné, spíše jen zbytky
- **songy** - tady jsou *LaTeX*ové zdrojáky pro výstup v *pdf*
- **Celý zpěvník** - zde je 1 *pdf* s aktuálním kompletním zpěvníkem
- **pdf** - *pdf* jednotlivých písní
- **Generator** - obsahuje skript `kompilace.sh`, který zkompiluje vše, co je v adresáři *songy* do jednotlivých *pdf* i do celého zpěvníku 


# Jak se zapojit do vývoje

**Možnost A:** Nechci si nic instalovat, ale rád něco opravím

V tomoto případě napiš do [tabulky s přehledem písní](https://docs.google.com/spreadsheets/d/1ej4QIp3_96SE3kHn7L9kaiDOEUqHb9XJ2Mvoauu2prE/edit#gid=0),
u čeho vidíš chybu a jak ji opravit.

Nebo udělej *printscreen* v *pdf*ku chybného songu, něco tam namaluj a pošli na albert@dvojka.cz

Jinak obecné návrhy spíše směřuj na jd@mamlasinky.com


**Možnost B:** Podařilo se mi vše nainstalovat

Potom tedy před každou úpravou proveď *pull*, tím se ti stáhnou poslední úpravy k tobě na počítač: uvnitř rootu zpěvníku: pravé tlačítko -> TortoiseGit -> Pull...

V MikTexu piš do zdrojáků v adresáři *songy*. Výsledné *pdf* zobrazíš pomocí *kompilace.sh* nastavením optionu na specifický song pomocí bashe: 
```
8ToThePowerOfMol@Obvious:~/zpevnik$ cd Generator/
8ToThePowerOfMol@Obvious:~/zpevnik/Generator$ ./kompilace.sh -f BoziVlak
Kompilace písně BoziVlak:
This is pdfTeX, Version 3.14159265-2.6-1.40.16 (TeX Live 2015/Debian) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode

SyncTeX written on generator.synctex.gz.Alles gute
```

Výsledný song se uložil do adresáře *pdf*.

Až dokončíš úpravu nějakého songu, proveď *commit* - záchytný bod úprav, který lze v logu zobrazit a lze se do tohoho stavu vrátit.
pravé tlačítko -> TortoiseGit -> Commit...

Až dokončíš všechny úpravy a doděláš si commity, proveď *push*, kterým nahraješ všechny změny do centrálního repozitáře na *GitHub*u:
pravé tlačítko -> TortoiseGit -> Push... 

