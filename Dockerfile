FROM webdevops/php-apache:8.2-alpine

ENV APP_DIR=/app
ENV PHP_CONF_DIR=/opt/docker/etc/php
ENV HTTPD_CONF_DIR=/opt/docker/etc/httpd

# Cria as pastas necessárias
RUN mkdir -p ${APP_DIR} ${PHP_CONF_DIR} ${HTTPD_CONF_DIR} && \
    chown -R application:application ${APP_DIR}

# Cria php.ini personalizado
RUN echo "date.timezone = America/Sao_Paulo\n\
display_errors = Off\n\
memory_limit = 256M\n\
max_execution_time = 60\n\
post_max_size = 256M\n\
upload_max_filesize = 128M" > ${PHP_CONF_DIR}/php.ini

# Cria vhost.conf personalizado
RUN echo "<VirtualHost *:80>\n\
  ServerAlias *\n\
  DocumentRoot \"/app/\"\n\
</VirtualHost>" > ${HTTPD_CONF_DIR}/vhost.conf

# Copia o app para /app
COPY . ${APP_DIR}

# Ajusta permissões
RUN chown -R application:application ${APP_DIR}

EXPOSE 80
