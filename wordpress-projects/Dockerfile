FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    locales \
    gettext \
    build-essential \
    bash-completion \
    sudo \
    mysql-client \
    php-fpm \
    php-xml \
    php-symfony-framework-bundle \
    php-mysql \
    sass \
    minify \
    curl \
    git \
    vim-tiny

RUN curl -L https://phpdoc.org/phpDocumentor.phar -o phpDocumentor.phar && \
    mv phpDocumentor.phar /usr/local/bin/phpdoc && \
    chmod +x /usr/local/bin/phpdoc

RUN curl -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    chmod +x /usr/local/bin/wp && \
    wp cli update && \
    curl -L https://raw.githubusercontent.com/wp-cli/wp-cli/v2.5.0/utils/wp-completion.bash -o wp-completion.bash && \
    mv wp-completion.bash /etc/profile.d/wp_completion.sh

RUN useradd -s /bin/bash -u 1000 developer && \
    usermod -aG sudo developer && \
    usermod -aG www-data developer && \
    echo "developer:developer" | chpasswd 

COPY bin/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod a+rx /usr/local/bin/entrypoint.sh

ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]
