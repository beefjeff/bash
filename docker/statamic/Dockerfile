FROM php:7.4-cli

RUN apt-get update; \
    apt-get install -y software-properties-common

RUN add-apt-repository ppa:ondrej/php; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        bash \
        coreutils \
        git \
        make \
        mercurial \
        openssh-client \
        patch \
        subversion \
        tini \
        unzip \
        libxml2-dev \ 
        zip \
        libssh2-1 \
        libssh2-1-dev 



RUN echo "Updating $PHP_INI_DIR/php-cli.ini"; \
    printf "# composer php cli ini settings\ndate.timezone=UTC\nmemory_limit=-1\n" > $PHP_INI_DIR/php-cli.ini

RUN useradd -d /home/statamic -m statamic

ENV COMPOSER_HOME /tmp
ENV COMPOSER_VERSION 2.0.8
ENV COMPOSER_AUTH ${COMPOSER_AUTH}

RUN mkdir /app
RUN chown statamic: /tmp /app



RUN set -eux; \
  curl --silent --fail --location --retry 3 --output /tmp/installer.php --url https://raw.githubusercontent.com/composer/getcomposer.org/cb19f2aa3aeaa2006c0cd69a7ef011eb31463067/web/installer; \
  php -r " \
    \$signature = '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5'; \
    \$hash = hash('sha384', file_get_contents('/tmp/installer.php')); \
    if (!hash_equals(\$signature, \$hash)) { \
      unlink('/tmp/installer.php'); \
      echo 'Integrity check failed, installer is either corrupt or worse.' . PHP_EOL; \
      exit(1); \
    }"; \
  php /tmp/installer.php --no-ansi --install-dir=/usr/bin --filename=composer --version=${COMPOSER_VERSION}; \
  composer --ansi --version --no-interaction; \
  rm -f /tmp/installer.php; \
  find /tmp -type d -exec chmod -v 1777 {} +

USER statamic

WORKDIR /app

RUN composer global require statamic/cli

ENTRYPOINT ["/tmp/vendor/bin/statamic"]
