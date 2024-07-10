FROM php:8.2.21-fpm
RUN apt update
RUN apt -y install  gcc             \
                    make            \
                    autoconf        \
                    libc-dev        \
                    pkg-config      \
                    wget            \
                    libssh2-1-dev   \
                    bash            \
                    openssh-client  \
                    sshpass         \
                    zlib1g-dev

RUN pecl install grpc

## Protobuf and GRPC
#ENV PROTOBUF_VERSION "3.25.1"
#RUN pecl channel-update pecl.php.net
#RUN pecl install protobuf-${PROTOBUF_VERSION} grpc \
 #   && docker-php-ext-enable protobuf grpc

# Install Temporal CLI
#COPY --from=temporalio/admin-tools /usr/local/bin/tctl /usr/local/bin/tctl
# Wait for Temporal service to star up
#COPY wait-for-temporal.sh /usr/local/bin
#RUN chmod +x /usr/local/bin/wait-for-temporal.sh

COPY src/develop/php-build/install-php-extensions  /usr/local/bin/install-php-extensions
COPY src/develop/php-build/install-php-extensions /usr/bin/install-php-extensions

RUN install-php-extensions gd
RUN install-php-extensions exif
RUN install-php-extensions pcntl
RUN install-php-extensions pgsql
RUN install-php-extensions bcmath
RUN install-php-extensions sockets
RUN install-php-extensions openssl
RUN install-php-extensions pdo_pgsql
RUN install-php-extensions intl-3.0.0
RUN install-php-extensions pierrejoye/php_zip@1.22.2

RUN docker-php-ext-enable gd
RUN docker-php-ext-enable zip
RUN docker-php-ext-enable exif
RUN docker-php-ext-enable intl
RUN docker-php-ext-enable grpc
RUN docker-php-ext-enable pcntl
RUN docker-php-ext-enable bcmath
RUN docker-php-ext-enable sodium
RUN docker-php-ext-enable sockets
RUN docker-php-ext-enable mongodb
RUN docker-php-ext-enable pdo_pgsql