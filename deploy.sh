#!/bin/sh
systemctl enable --now docker
docker rm -f 5gcc
docker rm -f l4g
docker rm -f nginx
docker run -d --restart=unless-stopped -p 0.0.0.0:1080:80 -v $(pwd)/5gcc.yml:/etc/XrayR/config.yml --name 5gcc misakano7545/xrayr
docker run -d --restart=unless-stopped -p 0.0.0.0:2080:80 -v $(pwd)/l4g.yml:/etc/XrayR/config.yml --name l4g misakano7545/xrayr
docker run -d --restart=unless-stopped -p 80:80 -v $(pwd)/nginx.conf:/etc/nginx/conf.d/default.conf --name nginx nginx
echo "menjmoi qua dep trai <3"
