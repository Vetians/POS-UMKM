FROM php:8.3-fpm

# System dependencies
RUN apt-get update && apt-get install -y \
    libicu-dev \
    libzip-dev \
    unzip \
    nginx \
    supervisor \
    gettext-base \
    && rm -rf /var/lib/apt/lists/*

# PHP extensions
RUN docker-php-ext-install \
    pdo_mysql \
    bcmath \
    intl \
    zip

# Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

# Composer dependencies
COPY composer.json composer.lock ./

RUN composer install \
    --no-dev \
    --no-scripts \
    --optimize-autoloader

# Laravel application
COPY . .

# Run Composer Laravel scripts
RUN composer run-script post-autoload-dump

# Permissions
RUN chown -R www-data:www-data \
    storage \
    bootstrap/cache

# Nginx
COPY docker/nginx/nginx.conf.template /etc/nginx/templates/default.conf.template

# Supervisor
COPY docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 8080

CMD ["/usr/bin/supervisord", "-n"]