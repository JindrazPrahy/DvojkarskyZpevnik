#!/bin/sh

#Konvertování pdf do formátu txt
yourfilenames=`ls ../pdf/*.pdf`
for eachfile in $yourfilenames
do
   eachfile="${eachfile#../pdf/}"
   eachfile="${eachfile%.pdf}" #Dostání pouze jména souboru bez přípony
   less ../pdf/${eachfile}.pdf &> ./${eachfile}.txt
   sed -i '$ d' ./${eachfile}.txt  #Odstranění posl. řádku
done
