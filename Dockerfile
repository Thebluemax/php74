FROM php:7.4-fpm

RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim \
    optipng \
    pngquant \
    gifsicle \
    vim \
    unzip \
    git \
    curl \
    libzip-dev \
    zip \
    libpng-dev \
    libxml2-dev \
    mcrypt \
    nodejs \
    npm

RUN  docker-php-ext-install mysqli \
pdo_mysql \
zip  \
gd \
calendar \
soap

RUN pecl install -o -f redis \
    xdebug-3.0.1 \
    &&  rm -rf /tmp/pear \
    &&  docker-php-ext-enable redis \
    xdebug

COPY ./conf/dev/xdebug.ini /usr/share/etc/php/conf.d/xdebug.ini
COPY ./conf/dev/extras.ini /usr/share/etc/php/conf.d/extras.ini
# Install dependencies

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

