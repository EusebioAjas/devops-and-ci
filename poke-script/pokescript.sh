#!/bin/bash

args=$1
declare -r POKEAPI_BASE_URL="https://pokeapi.co/api/v2/pokemon/"

if [[ -z $args ]]; then
  echo "No pokemon name is passed."
  exit 1
fi

if [[ $# -ne 1 ]]; then
  echo "Incorrect number of arguments passed. Only one argument is allowed."
  exit 1
else
  request="${POKEAPI_BASE_URL}${args}"
  response=$(curl -s -w '%{http_code}' "${request}")
  status_code=${response:(-3)}

  if [[ $status_code -eq 200 ]]; then
    pokemon_data=${response::-3}
    data=$(echo "${pokemon_data}" | jq -r '"Id=\(.id), name=\(.name), weight=\(.weight), height=\(.height), order=\(.order)"')
    echo "${data}"
  else
    echo "Pokemon not found."
    exit 1
  fi
fi

