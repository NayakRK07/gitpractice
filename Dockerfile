# Use official PHP + Apache image
FROM php:8.2-apache

# Copy project files to Apache web root
COPY . /var/www/html/

# Give permissions to Apache
RUN chown -R www-data:www-data /var/www/html

# Expose port 80
EXPOSE 80

# Apache will start automatically
