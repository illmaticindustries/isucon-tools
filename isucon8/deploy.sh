#!/bin/bash
set -ex
IPADDR=$1

ssh vagrant@$IPADDR "echo 'deploying...' | /home/vagrant/notify.sh && cd /home/vagrant/isucon-tools && git pull && sudo su - isucon && /home/isucon/local/ruby/bin/bundle && sudo systemctl restart mariadb.service && sudo systemctl restart torb.ruby && sudo systemctl restart h2o.service && sudo sysctl -p && sudo su - vagrant && echo 'deploy done' | /home/vagrant/notify.sh"
