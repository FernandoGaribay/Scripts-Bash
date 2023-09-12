#!/bin/bash

opcion=$(whiptail --title "Actualizar los paquetes del sistema" \
                    --menu "Selecciona una opción:" 15 60 2 \
                    "1" "Actualizar paquetes del sistema" \
                    "2" "Eliminar paquetes obsoletos y cache" \
                    3>&1 1>&2 2>&3)

if [ $? -ne 0 ]; then
    exit 0
fi

case $opcion in
    "1")
        echo -e "apt-get update ----------------\n"
        su -c "apt-get update"

        echo -e "\napt-get upgrade ----------------\n"
        su -c "apt-get upgrade -y"

        whiptail --title "Actualizacion Completada" --msgbox "Los paquetes del Sistema Operativo se han actualizado correctamente." 10 50
        ;;
    "2")
        echo -e "apt-get autoremove -y ----------------\n"
        sudo apt-get autoremove -y

        echo -e "\napt-get clean ----------------\n"
        sudo apt-get clean

        whiptail --title "Limpieza Completada" --msgbox "Se han eliminado los paquetes obsoletos y cache de los paquetes" 10 50
        ;;
esac
