#!/bin/sh

# Možnost, že se kompilátor zavolá s jedním konkrétním songem
# např.: ./kompilace.sh -f ../songy/Amerika.tex
# Další optiony jde přidat pomocí ... elif test; then ... else ... fi nebo použít switch
if [ "$1" -eq "-f" ]; then
    if [ "$#" -ne "2" ]; then
        echo "Missing file arg."
    else    
        cat generator.tex | sed s/\\input{..\/songy\/.*.tex}/\\input{$2}/ > /tmp/generator.tex
        pdflatex -synctex=1 -interaction=batchmode /tmp/generator.tex
        mv generator.pdf ../pdf/$2.pdf
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
