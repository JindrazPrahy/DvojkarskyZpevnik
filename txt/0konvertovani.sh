#!/bin/sh
#Konvertování pdf do formátu txt

if [ "$1" = "-f" ]; then   #Pozn. -eq porovnává integery, = porovnává stringy
    if [ "$#" != "2" ]; then #Podobně -ne a !=
        echo "Missing file arg."
    else
	echo "Kompilace písně $2:"
	eachfile=$2
    	eachfile="${eachfile%.pdf}" #Dostání pouze jména souboru bez přípony
	eachfile="${eachfile#../pdf/}"
	rm ${eachfile}.txt
	less ../pdf/${eachfile}.pdf >> ./${eachfile}.txt
	head -n -1 ${eachfile}.txt > temp.txt ; mv temp.txt ${eachfile}.txt #Odstranění posl. řádku
	echo Alles gute
    fi
else
	yourfilenames=`ls ../pdf/*.pdf`
	pocet=1
	for eachfile in $yourfilenames
	do
	   echo "Kompilace souboru ${eachfile} č. ${pocet}"
	   pocet=$((pocet+1))
	   eachfile="${eachfile#../pdf/}"
	   eachfile="${eachfile%.pdf}" #Dostání pouze jména souboru bez přípony
	   rm ${eachfile}.txt
	   less ../pdf/${eachfile}.pdf >> ./${eachfile}.txt
	   sed -i '$ d' ./${eachfile}.txt  #Odstranění posl. řádku
	done
	echo Alles gute
fi
