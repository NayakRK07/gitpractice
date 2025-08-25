FROM php:8.2-apache

# Copy your static site files to Apache's root
COPY DevOps-Portfolio-master/ /var/www/html/

# Give proper permissions
RUN chown -R www-data:www-data /var/www/html

# Enable SSL + rewrite modules
RUN a2enmod ssl && a2enmod rewrite

# Copy SSL certs
COPY ./certs/selfsigned.crt /etc/ssl/certs/selfsigned.crt
COPY ./certs/selfsigned.key /etc/ssl/private/selfsigned.key

# Copy Apache SSL config
COPY ./ssl.conf /etc/apache2/sites-available/ssl.conf

# Enable the SSL site
RUN a2ensite ssl.conf

# Expose both ports
EXPOSE 80 443

