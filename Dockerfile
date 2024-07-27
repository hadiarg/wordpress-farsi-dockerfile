FROM wordpress:latest
RUN apt-get update && apt-get install -y wget unzip

RUN wget -O /tmp/latest-fa_IR.zip https://fa.wordpress.org/latest-fa_IR.zip && \
    unzip /tmp/latest-fa_IR.zip -d /tmp && \
    rm -rf /usr/src/wordpress && \
    mv /tmp/wordpress /usr/src/wordpress && \
    rm -rf /var/www/html && \
    mv /usr/src/wordpress /var/www/html && \
    rm /tmp/latest-fa_IR.zip

RUN chown -R www-data:www-data /var/www/html

RUN apt-get install -y locales && \
    locale-gen fa_IR.UTF-8 && \
    dpkg-reconfigure --frontend=noninteractive locales
ENV LANG fa_IR.UTF-8
ENV LANGUAGE fa_IR:fa
ENV LC_ALL fa_IR.UTF-8

EXPOSE 80

CMD ["apache2-foreground"]
