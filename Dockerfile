FROM php:8.2-fpm

# Instala dependencias del sistema
RUN apt-get update && apt-get install -y \
    git curl libpng-dev libonig-dev libxml2-dev zip unzip \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Instala Composer
COPY --from=composer:2.5 /usr/bin/composer /usr/bin/composer

# Crea y configura directorios
WORKDIR /var/www

# Copia la aplicación al contenedor
COPY . .

# Copia el archivo de configuración
COPY docker-entrypoint.sh /usr/local/bin/

# Copia el archivo de configuración de PHP
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Instala dependencias de PHP
RUN composer install --no-dev --optimize-autoloader

# Cambia permisos
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache

# Expone el puerto para el servidor embebido de Laravel
EXPOSE 8080

# Comando para correr Laravel con servidor embebido
ENTRYPOINT ["docker-entrypoint.sh"]
