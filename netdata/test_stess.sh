#!/bin/bash

# WEB SERVER STRESS
# apt install apache2-utils

ab -n 500 -c 10 <server>
