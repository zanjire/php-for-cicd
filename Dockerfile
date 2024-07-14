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
    && apt install -y php8.2-fpm             
RUN apt install -y    php8.2-gd            
RUN apt install -y    php8.2-exif          
RUN apt install -y    php8.2-curl                  
RUN apt install -y    php8.2-pgsql         
RUN apt install -y    php8.2-mysql         
RUN apt install -y    php8.2-bcmath        
RUN apt install -y    php8.2-amqp        
RUN apt install -y    php8.2-uuid        
RUN apt install -y    php8.2-sockets       
RUN apt install -y    php8.2-mcrypt       
RUN apt install -y    php8.2-fileinfo             
RUN apt install -y    php8.2-mbstring          
RUN apt install -y    php8.2-intl           
RUN apt install -y    php8.2-zip           
RUN apt install -y    php8.2-swoole         
RUN apt install -y    php8.2-mongodb         
RUN apt install -y    php8.2-grpc        


COPY --from=php:8.2-fpm /usr/local/bin/docker-php-ext-enable /usr/local/bin/docker-php-ext-enable
COPY --from=php:8.2-fpm /usr/local/bin/docker-php-ext-install /usr/local/bin/docker-php-ext-install

RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-enable pdo pdo_mysql



RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
