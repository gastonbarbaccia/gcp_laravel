#!/bin/sh

# Copiamos el archivo del secreto montado

echo "Contenido de /secrets:"
ls -la /secrets

# Copiamos el archivo del secreto montado
if [ -f /secrets/laravel_env ]; then
  echo "Secreto encontrado, copiando a .env"
  cp /secrets/laravel_env /var/www/.env
else
  echo "Secreto NO encontrado en /secrets/laravel_env"
fi

# Ejecutamos el servidor embebido de Laravel
exec php -S 0.0.0.0:8080 -t public
