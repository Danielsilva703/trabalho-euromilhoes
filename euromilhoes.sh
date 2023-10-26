#!/bin/bash

repetir="s"

while [ "$repetir" == "s" ]; do
  echo "Gerando uma chave para o EuroMilhões:"

  echo "Números (1-45):"
  for ((i=1; i<=5; i++)); do
    numero=$((1 + RANDOM % 45))
    echo -n "$numero "
  done

  echo -e "\nEstrelas (1-12):"
  for ((i=1; i<=2; i++)); do
    estrela=$((1 + RANDOM % 12))
    echo -n "$estrela "
  done

  read -p "Deseja gerar outra chave? (s/n): " repetir
done

