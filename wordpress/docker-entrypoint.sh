#!/bin/sh
set -e

if ! [ -e /app/public/index.php -a -e /app/public/wp-includes/version.php ]; then
    echo "WordPress not found, downloading the latest version..."
    curl -so wordpress.tar.gz -SL https://wordpress.org/wordpress-latest.tar.gz
    echo "Extracting wordpress..."
    tar -xzf wordpress.tar.gz -C /tmp/
    echo "Copying wordpress..."
    cp -a /tmp/wordpress/. /app/public/
    echo "Job's done!"
fi
