#!/bin/bash

debutpage="<html><head><title>mes blagues</title></head><body>"

finpages="</body></html>"

baliseH2Ouvrante="<h2>"
baliseH2Fermante="</h2>"

blagues="chuck Norris can cut a knife with butter"

blagueDansUnH2=$baliseH2Ouvrante$blagues$baliseH2Fermante


echo $debutpage$blagueDansUnH2$finpages > index.html
firefox index.html

