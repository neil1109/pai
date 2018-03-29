#!/bin/bash

set -o nounset
set -o errexit
set -o pipefail

mkdir -p /usr/src/app
cp -r -f ./pai-fs /usr/src/
cp -r -f ./job-tutorial /usr/src/
cp -r -f ./webportal /usr/src/
cp -r -f ./webportal/* /usr/src/app

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

apt-get install -y nodejs

export SERVER_PORT=8080
export GRAFANA_URI=http://10.190.148.125:30676
export K8S_DASHBOARD_URI=http://10.190.148.125:30099/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/
export REST_SERVER_URI=http://10.190.148.125:9186
export PROMETHEUS_URI=http://10.190.148.125:32231
export K8S_API_SERVER_URI=http://10.190.148.125:30099
export EXPORTER_PORT=9100
export SERVER_PORT=8080
export NODE_ENV=production

cd /usr/src/app

npm install yarn
npm run yarn install
npm start
