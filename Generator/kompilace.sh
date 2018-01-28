#!/bin/sh
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
