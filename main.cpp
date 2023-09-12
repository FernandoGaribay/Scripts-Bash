#include <iostream>
#include <cstdlib>
#include <cstdio>

using namespace std;

int main() {
    int opcion;

    while (true) {
        //system("clear");
        cout << "\033[2J\033[1;1H"; 

        cout << "╔═════════════════════════════════════════════════════════════════════════════╗" << endl;
        cout << "║                              Menú de Opciones                               ║" << endl;
        cout << "╚═════════════════════════════════════════════════════════════════════════════╝" << endl;
        cout << "   1. Mostrar información actual de las conexiones de red." << endl;
        cout << "   2. Mostrar contenido del archivo de configuración de las interfaces de red." << endl;
        cout << "   3. Mostrar todos los usuarios existentes en tu sistema operativo." << endl;
        cout << "   4. Agregar o eliminar un usuario en específico." << endl;
        cout << "   5. Mostrar lista de todos los procesos en ejecución." << endl;
        cout << "   6. Eliminar/Detener un proceso en específico." << endl;
        cout << "   7. Cambiar permisos de un archivo o directorio en específico." << endl;
        cout << "   8. Cambiar propietario y/o grupo de un archivo o directorio en específico." << endl;
        cout << "   9. Actualizar paquetes instalados y el sistema operativo." << endl;
        cout << "  10. Salir de la aplicación." << endl;
        cout << "═══════════════════════════════════════════════════════════════════════════════" << endl;
        cout << "  ▶ Ingrese el número de la opción deseada: ";
        cin >> opcion;


        switch (opcion) {
            case 1:
                system("bash ../conexionesRed.sh");
                break;
            case 2:
                system("bash ../interfacesRed.sh");
                break;
            case 3:
                system("bash ../usuarios.sh");
                break;
            case 4:
                system("bash ../editarUsuarios.sh");
                break;
            case 5:
                system("bash ../listaProcesos.sh");
                break;
            case 6:
                system("bash ../detenerProceso.sh");
                break;
            case 7:
                system("bash ../cambiarPermisos.sh");
                break;
            case 8:
                
                break;
            case 9:
                system("bash ../actualizarPaquetes.sh");
                break;
            case 10:
                cout << "\n";
                return 0;
        }
    }

    return 0;
}
