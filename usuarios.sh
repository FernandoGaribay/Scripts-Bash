#!/bin/bash

USUARIOS=$(cut -d: -f1 /etc/passwd)
TEMP_FILE="/tmp/informacion_usuarios.txt"

rm -f "$TEMP_FILE"

for USUARIO in $USUARIOS; do
    INFO_USUARIO=$(grep "^$USUARIO:" /etc/passwd)
    echo "$INFO_USUARIO" | awk -F: '{print "nombre_usuario:" $1 "\ncontraseña:" $2 "\nUID:" $3 "\nGID:" $4 "\ndescripcion:" $5 "\ndirectorio_home:" $6 "\nshell:" $7 "\n--------------------------------"}' >> "$TEMP_FILE"
done

nano $TEMP_FILE
rm -f "$TEMP_FILE"
