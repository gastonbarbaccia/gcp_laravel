#!/bin/sh

# Copiamos el archivo del secreto montado
if [ -f /secrets/laravel_env ]; then
  cp /secrets/laravel_env /var/www/.env
fi

# Ejecutamos el servidor embebido de Laravel
exec php -S 0.0.0.0:8080 -t public
