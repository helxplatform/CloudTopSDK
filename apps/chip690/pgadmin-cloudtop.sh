#!/bin/bash
set -x \
  cat /etc/apt/sources.list.d/ \
  && cat /etc/apt/sources.list \
  && apt update \
  && apt-get -y install lsb-release \
  && curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg \
  && cat /etc/os-release \
  && sh -c 'curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add && echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(dpkg --status tzdata|grep Provides|cut -f2 -d'-') pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update' \
  && cat /etc/apt/sources.list.d/pgadmin4.list \
  && apt update \
  && apt-get -y install pgadmin4 pgadmin4-desktop
 #&& /usr/pgadmin4/bin/setup-web.sh
