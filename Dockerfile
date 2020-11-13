from php:7.2-apache
run apt-get update && docker-php-ext-install pdo_mysql mysqli pdo

workdir /var/www/html/

copy . .
