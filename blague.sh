#!/bin/bash

#https://api.chucknorris.io/jokes/random

blagueRandom=$(curl -s https://api.chucknorris.io/jokes/random | jq -r '.value')

echo $blagueRandom