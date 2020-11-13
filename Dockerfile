from php:7.2-apache
run docker-php-ext-install pdo pdo_mysql

workdir /var/www/html

copy . .
