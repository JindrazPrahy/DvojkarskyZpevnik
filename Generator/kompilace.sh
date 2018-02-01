#!/bin/sh

# Možnost, že se kompilátor zavolá s jedním konkrétním songem
# např.: ./kompilace.sh -f ../songy/Amerika.tex
# Další optiony jde přidat pomocí ... elif test; then ... else ... fi nebo použít switch
echo "$1"
echo "$2"
if [ "$1" = "-f" ]; then   #Pozn. -eq porovnává integery, = porovnává stringy
    if [ "$#" != "2" ]; then #Podobně -ne a !=
        echo "Missing file arg."
    else    
        #cat generator.tex | sed s/\\input{..\/songy\/.*.tex}/\\input{$2}/ > /tmp/generator.tex
        #pdflatex -synctex=1 -interaction=batchmode /tmp/generator.tex
	#Změna kódu, recykloval jsem to, co už bylo jednou použito
	eachfile=$2
	head -n -1 generator.tex > temp.txt ; mv temp.txt generator.tex 
	head -n -1 generator.tex > temp.txt ; mv temp.txt generator.tex #Odstranění posl. dvou řádků
	echo "\input{${eachfile}}" >> generator.tex  
	echo "\end{document}" >> generator.tex  #Úprava tex souboru pro kompilaci individuálních písní
	pdflatex -synctex=1 -interaction=batchmode generator.tex #kompilace
	eachfile="${eachfile#../songy/}"
	eachfile="${eachfile%.tex}" #Dostání pouze jména souboru bez přípony
	mv generator.pdf ../pdf/${eachfile}.pdf #Přesun hotového pdf do nové složky
    fi 
else
    yourfilenames=`ls ../songy/*.tex`
    for eachfile in $yourfilenames
    do
       echo $eachfile
       head -n -1 generator.tex > temp.txt ; mv temp.txt generator.tex 
       head -n -1 generator.tex > temp.txt ; mv temp.txt generator.tex #Odstranění posl. dvou řádků
       echo "\input{${eachfile}}" >> generator.tex  
       echo "\end{document}" >> generator.tex  #Úprava tex souboru pro kompilaci individuálních písní
       pdflatex -synctex=1 -interaction=batchmode generator.tex #kompilace
       eachfile="${eachfile#../songy/}"
       eachfile="${eachfile%.tex}" #Dostání pouze jména souboru bez přípony
       mv generator.pdf ../pdf/${eachfile}.pdf #Přesun hotového pdf do nové složky
    done
fi
