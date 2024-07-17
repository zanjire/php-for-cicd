FROM ubuntu:22.04


RUN apt update
RUN export DEBIAN_FRONTEND=noninteractive && apt install -y python3         
RUN export DEBIAN_FRONTEND=noninteractive && apt install -y  software-properties-common 
RUN export DEBIAN_FRONTEND=noninteractive && apt install -y  libonig-dev     
RUN export DEBIAN_FRONTEND=noninteractive && apt install -y  libpq-dev       
RUN export DEBIAN_FRONTEND=noninteractive && apt install -y  gcc             
RUN export DEBIAN_FRONTEND=noninteractive && apt install -y  make            
RUN export DEBIAN_FRONTEND=noninteractive && apt install -y  autoconf        
RUN export DEBIAN_FRONTEND=noninteractive && apt install -y  libc-dev        
RUN export DEBIAN_FRONTEND=noninteractive && apt install -y  pkg-config      
RUN export DEBIAN_FRONTEND=noninteractive && apt install -y  wget            
RUN export DEBIAN_FRONTEND=noninteractive && apt install -y  libssh2-1-dev   
RUN export DEBIAN_FRONTEND=noninteractive && apt install -y  libssl-dev      
RUN export DEBIAN_FRONTEND=noninteractive && apt install -y  bash           
RUN export DEBIAN_FRONTEND=noninteractive && apt install -y  sshpass         
RUN export DEBIAN_FRONTEND=noninteractive && apt install -y  zlib1g-dev      
RUN export DEBIAN_FRONTEND=noninteractive && apt install -y  nginx           
RUN export DEBIAN_FRONTEND=noninteractive && apt install -y  openssh-server  
RUN export DEBIAN_FRONTEND=noninteractive && apt install -y  micro           
RUN export DEBIAN_FRONTEND=noninteractive && apt install -y  unzip          
RUN export DEBIAN_FRONTEND=noninteractive && apt install -y  libjpeg-dev     
RUN export DEBIAN_FRONTEND=noninteractive && apt install -y  libxml2-dev     
RUN export DEBIAN_FRONTEND=noninteractive && apt install -y  libfreetype6-dev
RUN export DEBIAN_FRONTEND=noninteractive && apt install -y  supervisor      
RUN export DEBIAN_FRONTEND=noninteractive && apt install -y  tini            
RUN export DEBIAN_FRONTEND=noninteractive && apt install -y  python3-launchpadlib 
RUN export DEBIAN_FRONTEND=noninteractive && apt install -y  composer

RUN add-apt-repository ppa:ondrej/php
RUN apt-get update
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt install -y php8.2 php8.2-fpm             
RUN apt install -y    php8.2-curl            
RUN apt install -y    php8.2-cli            
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
RUN apt install -y    php8.2-dev        
RUN apt install -y    php8.2-dom        
RUN apt install -y    php8.2-opcache        
RUN apt install -y    composer        


COPY --from=php:8.2-fpm /usr/local/bin/docker-php-ext-enable /usr/local/bin/docker-php-ext-enable
COPY --from=php:8.2-fpm /usr/local/bin/docker-php-ext-install /usr/local/bin/docker-php-ext-install
COPY --from=php:8.2-fpm /usr/local/bin/docker-php-source /usr/local/bin/docker-php-source
COPY --from=php:8.2-fpm /usr/local/bin/docker-php-ext-configure /usr/local/bin/docker-php-ext-configure
COPY --from=php:8.2-fpm /usr/local/bin/docker-php-entrypoint /usr/local/bin/docker-php-entrypoint
COPY --from=php:8.2-fpm /usr/src/php.tar.xz /usr/src/php.tar.xz

RUN /usr/local/bin/docker-php-ext-install pdo  >> /dev/null 2>&1 || true
RUN /usr/local/bin/docker-php-ext-enable pdo  >> /dev/null 2>&1 || true

RUN /usr/local/bin/docker-php-ext-install pdo_mysql >> /dev/null 2>&1 || true
RUN /usr/local/bin/docker-php-ext-enable pdo_mysql >> /dev/null 2>&1 || true



