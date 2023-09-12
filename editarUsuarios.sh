#!/bin/bash

agregar_usuario() {
    usuario=$(whiptail --inputbox "Ingrese el nombre del nuevo usuario:" 10 40 3>&1 1>&2 2>&3)
    if [ $? -eq 0 ]; then
        su -c "useradd -m $usuario"
        whiptail --title "Usuario Agregado" --msgbox "El usuario $usuario ha sido agregado." 10 40
    else
        whiptail --title "Operación Cancelada" --msgbox "La operación ha sido cancelada." 10 40
    fi
}

eliminar_usuario() {
    usuario=$(whiptail --inputbox "Ingrese el nombre del usuario que desea eliminar:" 10 40 3>&1 1>&2 2>&3)
    if [ $? -eq 0 ]; then
        su -c "userdel -r $usuario"
        whiptail --title "Usuario Eliminado" --msgbox "El usuario $usuario ha sido eliminado." 10 40
    else
        whiptail --title "Operación Cancelada" --msgbox "La operación ha sido cancelada." 10 40
    fi
}

while true; do
    opcion=$(whiptail --title "Agregar, Eliminar Usuario o Salir" --menu "Seleccionar una opción:" 15 60 3 \
        "1" "Agregar Usuario" \
        "2" "Eliminar Usuario" \
        "3" "Salir" 3>&1 1>&2 2>&3)

    if [ $? -ne 0 ]; then
        exit 0
    fi

    case $opcion in
        "1")
            agregar_usuario
            ;;
        "2")
            eliminar_usuario
            ;;
    esac
done
