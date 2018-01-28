#!/bin/sh
#Konvertuj všechny pdfka do txt souborů timhle řádkem:

for f in ../pdf/*.pdf;do TEMP="${f%%.*}" && less $TEMP.pdf &> txt/$TEMP.txt;done && sed -i '$d' *.txt

#ten for loop to konvertuje, ten sed maže poslední řádek souboru, jelikož ten
#se nějak zaplní něčím, co nechceme

