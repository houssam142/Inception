#!/bin/bash

mkdir -p /var/www/html

curl -L -o /var/www/html/adminer.php https://www.adminer.org/latest.php

mv adminer.php index.php

exec php -S 0.0.0.0:8080 -t /var/www/html/
