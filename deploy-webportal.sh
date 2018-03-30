#!/bin/bash

# Copyright (c) Microsoft Corporation
# All rights reserved.
#
# MIT License
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
# documentation files (the "Software"), to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and
# to permit persons to whom the Software is furnished to do so, subject to the following conditions:
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED *AS IS*, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
# BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
# DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

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
