#!/bin/bash
set -e
 
echo "Enabling Newrelic APM metrics"
newrelic-install install
 
exec "php-fpm"
