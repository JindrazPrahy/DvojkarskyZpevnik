#!/bin/sh
yourfilenames=`ls ../songy/*.tex`
for eachfile in $yourfilenames
do
   head -n -1 Generátor.tex > temp.txt ; mv temp.txt Generátor.tex 
   head -n -1 Generátor.tex > temp.txt ; mv temp.txt Generátor.tex #Odstranění posl. dvou řádků
   echo "\input{${eachfile}}" >> Generátor.tex  
   echo "\end{document}" >> Generátor.tex  #Úprava tex souboru pro kompilaci individuálních písní
   pdflatex -synctex=1 -interaction=batchmode Generátor.tex #kompilace
   eachfile="${eachfile#../songy/}"
   eachfile="${eachfile%.tex}" #Dostání pouze jména souboru bez přípony
   mv Generátor.pdf ../pdf/${eachfile}.pdf #Přesun hotového pdf do nové složky
done
