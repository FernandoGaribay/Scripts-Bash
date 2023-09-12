#!/bin/bash

if [ -e /etc/network/interfaces ]; then
    contenido=$(cat /etc/network/interfaces)
    echo "$contenido" > /tmp/interfaces_temp.txt
    whiptail --title "Configuración de Interfaces de Red" --textbox /tmp/interfaces_temp.txt 30 140
    rm /tmp/interfaces_temp.txt
else
    whiptail --title "Error" --msgbox "El archivo de configuración de las interfaces de red no existe." 10 40
fi
