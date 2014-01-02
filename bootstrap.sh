#!/usr/bin/env bash

apt-get update
apt-get install -y build-essential
apt-get install -y erlang-base erlang-dev erlang-nox erlang-eunit
apt-get install -y libmozjs185-dev libicu-dev libcurl4-gnutls-dev libtool
apt-get install -y curl
cd /usr/local/src
# choose one of these, DL couch from the net or copy from local vagrant folder
curl -O http://apache.mirrors.tds.net/couchdb/source/1.3.1/apache-couchdb-1.3.1.tar.gz
#cp /vagrant/apache-couchdb-1.3.1.tar.gz /usr/local/src/apache-couchdb-1.3.1.tar.gz
tar xvzf apache-couchdb-1.3.1.tar.gz
cd apache-couchdb-1.3.1
./configure
make && make install
adduser --disabled-login --disabled-password --no-create-home  --gecos name,room,work,home couchdb
chown -R couchdb:couchdb /usr/local/var/log/couchdb /usr/local/var/lib/couchdb /usr/local/var/run/couchdb
ln -s /usr/local/etc/init.d/couchdb  /etc/init.d
update-rc.d couchdb defaults
cp /vagrant/default.ini /usr/local/etc/couchdb/default.ini
service couchdb start
sleep 10
curl -X PUT http://127.0.0.1:5984/test_results
