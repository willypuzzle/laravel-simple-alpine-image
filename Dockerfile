FROM php:8.0.17-fpm-alpine3.15

RUN apk --update add wget \
  curl \
  git \
  grep \
  build-base \
  libmemcached-dev \
  libmcrypt-dev \
  libxml2-dev \
  imagemagick-dev \
  oniguruma-dev \
  pcre-dev \
  libtool \
  make \
  autoconf \
  g++ \
  cyrus-sasl-dev \
  libgsasl-dev \
  supervisor \
  nginx \
  unzip

RUN pear upgrade --force
RUN docker-php-ext-install mysqli mbstring pdo pdo_mysql tokenizer xml
RUN pecl channel-update pecl.php.net \
    && pecl install redis \
    && pecl install imagick \
    && docker-php-ext-enable redis \
    && docker-php-ext-enable imagick

RUN rm /var/cache/apk/* && \
    mkdir -p /var/www

COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord-app.conf /etc/supervisord.conf

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer

ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
