FROM php:8.2-apache

# Copy your static site files to Apache's root
COPY DevOps-Portfolio-master/ /var/www/html/

# Give proper permissions
RUN chown -R www-data:www-data /var/www/html

# Expose port 80
EXPOSE 80
