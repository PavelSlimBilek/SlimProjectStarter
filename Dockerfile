FROM php:8.2.0-fpm

WORKDIR /app

RUN apt-get update
RUN apt-get -y install git zip libpq-dev
RUN docker-php-ext-install pdo pdo_pgsql pgsql
RUN curl -sL https://getcomposer.org/installer | php -- --install-dir /usr/bin --filename composer
RUN pecl install xdebug
# Install PostgreSQL client tools
RUN apt-get update && \
    apt-get install -y postgresql-client && \
    rm -rf /var/lib/apt/lists/*

CMD ["php-fpm"]