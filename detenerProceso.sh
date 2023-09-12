#!/bin/bash

while true; do
    cuadroDialogo=$(whiptail --title "Eliminar un proceso especifico." --inputbox "Ingrese el PID del proceso a elimiar: " 10 40 3>&1 1>&2 2>&3)

    if [ $? -ne 0 ]; then 
        exit 0
    fi

    if [ -n "$cuadroDialogo" ]; then
        if kill -kill "$cuadroDialogo"; then
            whiptail --title "Proceso eliminado" --msgbox "El proceso con PID $cuadroDialogo ha sido eliminado." 10 40
        else
            whiptail --title "Error" --msgbox "No se pudo eliminar el proceso con PID $cuadroDialogo." 10 40
        fi
    fi
done