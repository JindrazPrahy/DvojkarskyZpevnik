#!/bin/sh

# Možnost, že se kompilátor zavolá s jedním konkrétním songem
# např.: ./kompilace.sh -f Amerika
# Další optiony jde přidat pomocí ... elif test; then ... else ... fi nebo použít switch
if [ "$1" = "-f" ]; then   #Pozn. -eq porovnává integery, = porovnává stringy
    if [ "$#" != "2" ]; then #Podobně -ne a !=
        echo "Missing file arg."
    else
	echo "Kompilace písně $2:"
	eachfile=$2
    	eachfile="${eachfile%.tex}" #Dostání pouze jména souboru bez přípony
	eachfile="${eachfile#../songy/}"
	#Když je tohle na začátku, nemusí $2 být plná cesta k písničce ve složce songy
	#Stačí třeba Amerika
        #cat generator.tex | sed s/\\input{..\/songy\/.*.tex}/\\input{$2}/ > /tmp/generator.tex
        #pdflatex -synctex=1 -interaction=batchmode /tmp/generator.tex
	#Změna kódu, recykloval jsem to, co už bylo jednou použito
	head -n -1 generator.tex > temp.txt ; mv temp.txt generator.tex
	head -n -1 generator.tex > temp.txt ; mv temp.txt generator.tex #Odstranění posl. dvou řádků
	echo "\\input{../songy/${eachfile}.tex}" >> generator.tex
	echo '\\end{document}' >> generator.tex  #Úprava tex souboru pro kompilaci individuálních písní
	pdflatex -synctex=1 -interaction=batchmode generator.tex #kompilace
	mv generator.pdf ../pdf/${eachfile}.pdf #Přesun hotového pdf do nové složky
	echo "Alles gute"
    fi
else
    yourfilenames=`ls ../songy/*.tex`
    pocet=1
    for eachfile in $yourfilenames
    do
       echo "Právě kompiluji soubor jménem $eachfile č. $pocet"
       pocet=$((pocet+1))
       head -n -1 generator.tex > temp.txt ; mv temp.txt generator.tex
       head -n -1 generator.tex > temp.txt ; mv temp.txt generator.tex #Odstranění posl. dvou řádků
       echo "\\input{${eachfile}}" >> generator.tex
       echo '\\end{document}' >> generator.tex  #Úprava tex souboru pro kompilaci individuálních písní
       pdflatex -synctex=1 -interaction=batchmode generator.tex #kompilace
       eachfile="${eachfile#../songy/}"
       eachfile="${eachfile%.tex}" #Dostání pouze jména souboru bez přípony
       mv generator.pdf ../pdf/${eachfile}.pdf #Přesun hotového pdf do nové složky
       echo 
    done
    echo "Alles gute"
fi
