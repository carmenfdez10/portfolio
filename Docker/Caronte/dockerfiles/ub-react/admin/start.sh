#!/bin/bash

preparar_proyecto() {
    echo "--- Entrando en pokeAPI para compilar ---"
    # Entramos donde está el package.json de tu PokeAPI
    cd /var/www/html/pokeAPI

    # 1. Instalación de dependencias
    echo "--- Instalando paquetería ---"
    npm install

    # 2. Generar el Build (Esto crea la carpeta 'dist')
    echo "--- Ejecutando npm run build ---"
    npm run build
    npm run dev -- --host 0.0.0.0 &
    # 3. Limpieza y Despliegue (Paso Crucial)
    echo "--- Limpiando archivos antiguos y desplegando build ---"
    # Borramos el index.html de 615 bytes y archivos basura
    rm -rf /var/www/html/index.html
    rm -rf /var/www/html/package.json
    rm -rf /var/www/html/package-lock.json
    
    # Movemos el contenido de 'dist' a la raíz
    if [ -d "dist" ]; then
        # Borramos el index.html base de Nginx y otros fuentes para que no estorben
        rm -f /var/www/html/index.html
        rm -f /var/www/html/package.json
        
        cp -r dist/* /var/www/html/
        echo "--- Build desplegado con éxito ---"
    else
        echo "--- ERROR: No se encontró la carpeta dist. Revisa el build ---"
    fi

    # 4. Permisos finales
    chown -R www-data:www-data /var/www/html
    chmod -R 755 /var/www/html
}

config_nginx() {
    echo "--- Iniciando Nginx ---"
    nginx 
}

main(){
    preparar_proyecto
    config_nginx
    # Mantenemos el contenedor vivo
    tail -f /dev/null
}

main