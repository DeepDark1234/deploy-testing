# ใช้ PHP 8.1 image จาก Docker Hub
FROM php:8.1-fpm

# ติดตั้ง dependencies ที่จำเป็น
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev zip git

# ติดตั้ง Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# ตั้งค่า working directory
WORKDIR /var/www

# คัดลอกไฟล์โปรเจคของคุณไปที่ Docker container
COPY . .

# ติดตั้ง PHP dependencies ด้วย Composer
RUN composer install --optimize-autoloader --no-dev

# ตั้งค่าเริ่มต้นให้บริการ Laravel
CMD php artisan serve --host=0.0.0.0 --port=80
