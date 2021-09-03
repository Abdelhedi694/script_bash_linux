#!/bin/bash

echo "coucou"
echo "Comment tu t'appelles ?"
read prenom
if [ $prenom = jo ]
then
    echo "bonjour $prenom"
else
    echo "non je sais que c'est pas toi"
    bash test.sh
fi