#!/bin/bash
#Este script es para darle arranque a rails en el inicio del servidor, desde rc.local

bundle exec rails s -b 192.168.0.57 &
touch /home/fwadmin/entro.txt
