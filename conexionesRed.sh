#!/bin/bash

while true; do
    opcion=$(whiptail --title "Información de Red" \
                      --menu "Selecciona una opción:" 15 60 2 \
                      "1" "Información detallada de red" \
                      "2" "Información de conexiones de red" \
                      3>&1 1>&2 2>&3)

    if [ $? -ne 0 ]; then
        exit 0
    fi

    case $opcion in
        "1")
            output=$(ip addr show)
            whiptail --title "Información detallada de red" --msgbox "$output" 20 80
            ;;
        "2")
            output=$(ss -tuln)
            whiptail --title "Información de conexiones de red" --msgbox "$output" 20 80
            ;;
    esac
done
