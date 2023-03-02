#!/bin/bash

main () {
  ARGS=$1
  POKEAPI_BASE_URL="https://pokeapi.co/api/v2/pokemon/"

  if [ $# -ne 1 ] || [ $# -eq 0 ]; then
    echo "Usage: pokescript.sh <name|id>"
    exit 1
  fi

  request="${POKEAPI_BASE_URL}${ARGS}"
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
}

main "$@"

