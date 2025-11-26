#!/bin/bash

mkdir -p /tmp/Animales
mkdir -p /tmp/Animales/Agua
mkdir -p /tmp/Animales/Tierra/Mamiferos
mkdir -p /tmp/Animales/Oviparos

echo "" > /tmp/animales.txt

archivo="$1"

while IFS=';' read -r animal habitat; do

    if [[ -z "$animal" ]] || [[ "$animal" =~ ^# ]]; then
        continue
    fi

    fecha="$(date +%Y%m%d)"
    linea="$fecha - animal: $animal - habitat: $habitat"

    echo "$linea" >> /tmp/animales.txt

    case "$habitat" in
        AG)
            echo "$linea" >> "/tmp/Animales/Agua/${animal}.txt"
            ;;
        TM)
            echo "$linea" >> "/tmp/Animales/Tierra/Mamiferos/${animal}.txt"
            ;;
        TO)
            echo "$linea" >> "/tmp/Animales/Oviparos/${animal}.txt"
            ;;
    esac

done < "$archivo"

