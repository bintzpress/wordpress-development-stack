FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

# Install the required packages
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

# Setup phpdoc
RUN curl -L https://phpdoc.org/phpDocumentor.phar -o phpDocumentor.phar && \
    mv phpDocumentor.phar /usr/local/bin/phpdoc && \
    chmod +x /usr/local/bin/phpdoc

# Setup wp-cli for the system
RUN curl -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    chmod +x /usr/local/bin/wp && \
    wp cli update && \
    curl -L https://raw.githubusercontent.com/wp-cli/wp-cli/v2.5.0/utils/wp-completion.bash -o wp-completion.bash && \
    mv wp-completion.bash /etc/profile.d/wp_completion.sh

# Setup developer user
RUN useradd -m -d /home/developer -s /bin/bash -u 1000 developer && \
    usermod -aG sudo developer && \
    usermod -aG www-data developer && \
    echo "developer:developer" | chpasswd && \
    echo "source /etc/profile.d/bash_completion.sh" >> /home/developer/.bashrc

# Setup wp-cli for the developer user
RUN echo "source /etc/profile.d/wp_completion.sh" >> /home/developer/.bashrc && \
    su - developer -c "wp package install wp-cli/restful" && \
    echo "path: /var/www/html" >> /home/developer/.wp-cli/config.yml && \
    chown developer:developer /home/developer/.wp-cli/config.yml

# Setup Node.JS
RUN cd /home/developer && \
    curl -L https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh -o install.sh && \
    chown developer:developer install.sh && \
    chmod ug+x install.sh && \
    su - developer -c "/home/developer/install.sh && \
                       [ -s /home/developer/.nvm/nvm.sh ] && \
                       \. /home/developer/.nvm/nvm.sh && \
                       nvm install lts/dubnium && \
                       npm install --global grunt-cli && \
                       npm install --global grunt-init && \
                       npm install --global jshint" && \
    rm /home/developer/install.sh

COPY bin/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod a+rx /usr/local/bin/entrypoint.sh

ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]
