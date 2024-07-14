FROM ubuntu:22.04


RUN apt update --fix-missing

RUN apt install -y                  \
                    python3         \
                    software-properties-common \
                    gcc             \
                    make            \
                    autoconf        \
                    libc-dev        \
                    pkg-config      \
                    wget            \
                    libssh2-1-dev   \
                    libssl-dev      \
                    bash            \
                    sshpass         \
                    zlib1g-dev      \
                    nginx           \
                    openssh-server  \
                    micro           \
                    unzip           \
                    libjpeg-dev     \
                    libxml2-dev     \
                    libfreetype6-dev\
                    supervisor      \
                    python3-launchpadlib

RUN add-apt-repository ppa:ondrej/php
RUN apt-get update
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt install -y    \
    php8.2-fpm           \
    php8.2-gd            \
    php8.2-exif          \
    php8.2-curl          \
    php8.2-pcntl         \
    php8.2-pgsql         \
    php8.2-mysql         \
    php8.2-bcmath        \
    php8.2-sockets       \
    php8.2-fileinfo      \
    php8.2-openssl       \
    php8.2-mbstring      \
    php8.2-pdo_pgsql     \
    php8.2-pdo_mysql     \
    php8.2-int           \
    php8.2-zip           \
    php8.2-swoole        \   
    php8.2-mongodb       \   
    php8.2-grpc        

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* >> /dev/null 2>&1 || true
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
