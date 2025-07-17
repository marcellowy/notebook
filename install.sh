#!/bin/sh

WORKDIR="/app/notebook"
cd $WORKDIR

rm -rf source
git clone https://github.com/marcellowy/notebook.git source
cd source
hugo
cp -rp public/* /app/nginx-proxy-manager/www/blog.wyi.hk/
cd .. && rm -rf source

# crontab
# * * * * * /app/notebook/install.sh