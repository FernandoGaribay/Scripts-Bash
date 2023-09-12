#!/bin/bash

validar_salida(){
	if [ $? -ne 0 ]; then 
		exit 0
	fi
}

while true; do
	cuadroDialogo=$(whiptail --title "Cambiar permisos de directorios." --inputbox "\nIngrese el directorio o archivo: " 10 80 3>&1 1>&2 2>&3)

	validar_salida

	if [ -e "$cuadroDialogo" ]; then
		archivo="$cuadroDialogo"
		
		mensajeActual="Los permisos actuales de $archivo son: $(stat -c "%a" "$archivo")"
		mensajePermisos="r (Lectura) -> 4\nw (Escritura) -> 2\nx (Ejecucion) -> 1"

		permisosNuevos=$(whiptail --title "Cambiar permisos" --inputbox "$mensajeActual\n\n$mensajePermisos\n\n\nPor favor, ingresa los nuevos permisos en formato octal (por ejemplo, 755):" 15 80 3>&1 1>&2 2>&3)

		validar_salida

		chmod "$permisosNuevos" "$archivo"

		permisosActualizados=$(stat -c "%a" "$archivo")
		mensajeActualizados="Los permisos actualizados de $archivo son: $permisosActualizados"

		whiptail --title "Resultado" --textbox <(echo -e "$mensajePermisos\n\n$mensajeActual\n\n$mensajeActualizados") 20 60
	else
		whiptail --title "Error" --msgbox "El archivo o directorio $cuadroDialogo no existe." 10 40
	fi
done
