#!/bin/bash

while true; do
    opcion=$(whiptail --title "Mostrar y eliminar procesos" --menu "Seleccionar una opción:" 15 60 2 \
        "1" "Mostrar procesos del usuario actual" \
        "2" "Mostrar todos los procesos del sistema" 3>&1 1>&2 2>&3)

	if [ $? -ne 0 ]; then
		exit 0
	fi

    case $opcion in
        "1")
            ps aux | grep $(whoami) > /tmp/procesos_usuario.txt
            nano /tmp/procesos_usuario.txt
            ;;
        "2")
            ps aux > /tmp/procesos_sistema.txt
            nano /tmp/procesos_sistema.txt
            ;;
    esac
done
