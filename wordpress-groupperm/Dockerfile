ARG WORDPRESS_TAG

FROM wordpress:${WORDPRESS_TAG}

COPY bin/custom-docker-entrypoint.sh /usr/local/bin/custom-docker-entrypoint.sh
RUN chmod a+rx /usr/local/bin/custom-docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/custom-docker-entrypoint.sh", "apache2-foreground"]
