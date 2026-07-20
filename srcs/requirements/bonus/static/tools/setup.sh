#!/bin/bash

mkdir components

mv index.html components
mv style.css components

npx http-server ./components -a 0.0.0.0 -p 5500
