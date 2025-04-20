#!/bin/sh

set -e

APP_DIR="/var/www"

# Copiar el secreto a .env
if [ -f /secrets/laravel_env ]; then
  echo "[entrypoint] Copiando secreto laravel_env a $APP_DIR/.env"
  cp /secrets/laravel_env "$APP_DIR/.env"
else
  echo "[entrypoint] No se encontró el archivo /secrets/laravel_env"
fi

# Ejecutamos el servidor embebido de Laravel
exec php -S 0.0.0.0:8080 -t public
