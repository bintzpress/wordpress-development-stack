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
      php-curl \
      sass \
      minify \
      curl \
      git \
      vim-tiny \
      ca-certificates && \
    apt-get clean

# Setup locales
RUN locale-gen en && \
    update-locale LANG=en_US.UTF-8 && \
    update-locale LANGUAGE=en && \
    update-locale LC_ALL=en_US.UTF-8

# Setup curl certs
RUN curl -L https://curl.haxx.se/ca/cacert.pem -o cacert.crt && \
    mv cacert.crt /usr/local/share/ca-certificates/ && \
    update-ca-certificates

RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null && \
    apt update && \
    apt install gh && \
    apt-get clean

RUN curl -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    wp cli update && \
    curl -L https://raw.githubusercontent.com/wp-cli/wp-cli/v2.5.0/utils/wp-completion.bash -o wp-completion.bash && \
    mv wp-completion.bash /etc/profile.d/wp_completion.sh
    
# Setup developer user
RUN useradd -m -d /home/developer -s /bin/bash -u 1000 developer && \
    usermod -aG sudo developer && \
    usermod -aG www-data developer && \
    echo "developer:developer" | chpasswd && \
    echo "source /etc/profile.d/bash_completion.sh" >> /home/developer/.bashrc && \
    echo "source /etc/profile.d/wp_completion.sh" >> /home/developer/.bashrc

COPY bin/developer_setup.sh /home/developer/
RUN chown developer:developer /home/developer/developer_setup.sh && \
    chmod 770 /home/developer/developer_setup.sh && \
    su - developer -c "/home/developer/developer_setup.sh" && \
    rm /home/developer/developer_setup.sh
    
COPY bin/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod a+rx /usr/local/bin/entrypoint.sh

ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]
