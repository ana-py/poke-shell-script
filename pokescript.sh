#!/bin/bash

if [ -z $1 ]; then	
	echo "Es necesario un parámetro"
	exit 1
fi

response=$(curl -s -f  "https://pokeapi.co/api/v2/pokemon/$1" ) 


if [ $? -ne 0 ]; then	
	echo "No se pudo obtener la información de la PokeApi"
	exit 1
fi

echo "$response" |jq -r '"\(.name) (No. \(.game_indices[3].game_index))\nId = \(.order)\nWeight = \(.weight)\nHeight = \(.height)"'


