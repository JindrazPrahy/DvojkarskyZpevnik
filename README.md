# DvojkarskyZpevnik

Toto je vývojový repozitář pro velký Dvojkařský Zpěvník. Všechny songy jsou zde
psány pomocí *LaTeX*u. Zpěvník je uzpůsoben pro kroužkovou vazbu (songů už je
hodně) - umožňuje tak do starších zpěvníků přidávat nové songy, jenž zde
přibývají.

[Přehled songů, wishlist a issues](https://docs.google.com/spreadsheets/d/1LpMYBsuo7ckZdFUrUSbS-KfDMcok-b69g1qXbS1utjo/edit?usp=sharing)

## Stažení

### Celý zpěvník

Celý zpěvník v pdf je v [*releases*](https://github.com/JindrazPrahy/DvojkarskyZpevnik/releases).
Odtud stáhni z nejnovější z verze soubor `Zpevnik.pdf`.

### Jednotlivé písničky

1. Přejdi na `pdf`, pokud chceš písničky stáhnout v PDF formátu, přejdi na 
`txt`, pokud chceš písničky stahovat v textovém formátu.
2. Vyber si soubor s požadovaným songem. Písničku stáhneš tlačítkem *Download*
v horním pravém rohu.

*Pro stahování jednotlivých písní bude brzy spuštěn speciální web.*

## Vývoj

Chceš-li pomoci se stavbou zpěvníku, kontaktuj nás. Informace jsou taktéž v souboru
[CONTRIBUTE.md](https://github.com/JindrazPrahy/DvojkarskyZpevnik/blob/master/CONTRIBUTE.md).


## Orientace v jednotlivých branchích

- **master** - zde najdete všechny písničky v pdf, txt a táborový zpěvník Pražské Dvojky
- **Wakan** - zde najdete táborový zpěvník Wakanů
- **Ucebni** - tohle je branch pro redukovaný zpěvník pro ty, co se učí na kytaru
- **Vanocni** - Zpěvník s koledami
- **test** - branch pro testy, zejména continuous integration

Popišme ještě strukturu branche master.

- Cely_zpevnik - složka s celým zpěvníkem
- pdf - pdf jednotlivých songů
- songy - LaTeXové zdrojové soubory písniček

