#!/bin/bash
set -e

echo "Starting newrelic"
newrelic-install install

echo "Starting fpm"
service php-fpm start

echo "Starting nginx"
exec nginx -g 'daemon off;'
