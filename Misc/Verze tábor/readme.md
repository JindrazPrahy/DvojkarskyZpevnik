#Dvojkaøský zpìvník

Bude to megazpìvník!!!
Prosím, pro záležitosti, které je potøeba vyøešit ètìte issues. (Hodí se pøeèíst si i ty Closed.)

Filesystem prozatím vyøešen tak, že máme soubory:
- main.tex
    - sem se vkládají adresy jednotlivých songù (je potøeba mít to seøazené)
- test.tex
    - zde se testují jednotlivé songy (asi po jednom)
    - existuje proto, že to nejde testovat pøímo v tìch jednotlivých souborech daný song
- songy
    - složka obsahující jednotlivé songy
    - je zvykem pojmenovávat ty soubory bez mezer a zaèátek každého slova mít velkým písmenem

Když chcete pøidat nový song, tak musíte:
1) Založit nový latex soubor ve složce songy.
2) Vyplnit obsah souboru
2*) Je možno ho testovat pomocí test.tex
3) Pøidat (podle abecedního poøádku) odkaz na soubor v main.tex pomocí tagu \subfile{}