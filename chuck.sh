#!/bin/bash

recommence=true
declare -a monTableau
debutpage="<html><head><title>mes blagues</title></head><body>"

finpages="</body></html>"

baliseH2Ouvrante="<h2>"
baliseH2Fermante="</h2>"


while $recommence;
    do
        echo "tu veux une blague au hasard sur chuck norris?"
        read reponse
        if [ $reponse = oui ]
            then
                blague=$(curl -s https://api.chucknorris.io/jokes/random | jq -r '.value')

            else
                echo "tiens voici la liste des catégories de blague sur chuck"
                mesCategories=$(curl -s https://api.chucknorris.io/jokes/categories | jq -r '.[]')

            for element in ${mesCategories[@]}
            do 
                echo "$element"
            done

                echo "--------------------------------"
                echo "ecrit moi la catégorie de la blague"
                read reponseCategorie
                blague=$(curl -s https://api.chucknorris.io/jokes/random?category=$reponseCategorie | jq -r '.value')
        
        fi

        echo $blague
        echo "on la garde celle la ?"
        read demandeGarderBlague
        if [ $demandeGarderBlague = oui ]
            then
            monTableau+=("$blague")
        fi


        echo "t'en veux encor une ?"
        read redemandeBlague
        if [ $redemandeBlague != oui ]
            then
            recommence=false
        fi
    
    done
    
    
     
    
    
    
    
    

    echo "ca te dirait de l'afficher sur une page web' ? oui? non?"
    read reponseFichierTxt

    if [ $reponseFichierTxt = oui ]
        then
            
            pageWeb=""
            pageWeb+=$debutpage

            for blagueChuck in "${monTableau[@]}"
                do 
                    blagueHtml=""
                    blagueHtml+=$baliseH2Ouvrante
                    blagueHtml+="$blagueChuck"
                    blagueHtml+=$baliseH2Fermante

                    pageWeb+=$blagueHtml
                done

                pageWeb+=$finpages

                echo $pageWeb > index.html
                cp index.html /var/www/html/index.html
    fi


