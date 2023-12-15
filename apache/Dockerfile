# Apache8080
FROM debian:latest

LABEL author="Grupo1"
LABEL version="1.0"
LABEL title="Debian"

RUN apt-get update && \
    apt-get install -y sudo apache2 php php-mysql nano curl netcat-traditional wget && \
    chmod 600 /etc/sudoers && \
    echo 'www-data ALL=(ALL:ALL) NOPASSWD: /usr/bin/nano' >> /etc/sudoers && \
    chown -R root:www-data /var/log/ && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    echo 'flag{W€lc0m€_корень}' > /root/flag.txt 

COPY 000-default.conf /etc/apache2/sites-available/
COPY ports.conf /etc/apache2/
COPY web /var/www/html/
COPY php.ini /etc/php/8.2/apache2/

CMD ["apachectl", "-DFOREGROUND"]

EXPOSE 80