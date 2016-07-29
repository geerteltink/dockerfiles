#!/bin/sh
set -e

if ! [ -e /app/public/index.php -a -e /app/public/wp-includes/version.php ]; then
    echo "WordPress not found, downloading the latest version..."
    curl -so wordpress.tar.gz -SL https://wordpress.org/wordpress-latest.tar.gz
    echo "Extracting wordpress..."
    tar -xzf wordpress.tar.gz -C /tmp/
    echo "Copying wordpress..."
    cp -a /tmp/wordpress/. /app/public/
    echo "Setting permissions..."
    chown -R www-data:www-data /app
fi

if [ ! -e /app/public/wp-config.php ]; then
    echo "WordPress config not found, creating one for you..."
    cp -a /app/wp-config.php /app/public/wp-config.php
    chown www-data:www-data /app/public/wp-config.php
fi

echo "Job's done!"
