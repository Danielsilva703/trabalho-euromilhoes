#!/bin/bash

numeros=($(seq 1 50))
estrelas=($(seq 1 12))
numeros_sorteados="numeros_sorteados.txt"

if [ ! -e "$numeros_sorteados" ]; then
    touch "$numeros_sorteados"
fi

numeros_sorteados=($(<"$numeros_sorteados"))

gerar_chave_euromilhoes() {
    echo "Gerando chave do Euro-Milhões:"
    
    for numero in "${numeros_sorteados[@]}"; do
        numeros_possiveis=(${numeros_possiveis[@]/$numero})
    done

    for ((i=0; i<5; i++)); do
        numero_aleatorio=${numeros_possiveis[$((RANDOM % ${#numeros_possiveis[@]}))]}
        echo "Número: $numero_aleatorio"
        numeros_sorteados+=("$numero_aleatorio")
    done

    for ((i=0; i<2; i++)); do
        estrela_aleatoria=${estrelas_possiveis[$((RANDOM % ${#estrelas_possiveis[@]}))]}
        echo "Estrela: $estrela_aleatoria"
    done

    echo "${numeros_sorteados[@]}" > "$numeros_sorteados"
}

while true; do
    gerar_chave_euromilhoes
    read -p "Deseja gerar outra chave? (s/n): " resposta
    if [ "$resposta" != "s" ]; then
        break
    fi
done
