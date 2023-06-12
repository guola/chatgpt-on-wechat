#!/bin/bash

unset KUBECONFIG

cd .. && docker build -f docker/Dockerfile.latest \
             -t guola/chatgpt-on-wechat .

docker tag guola/chatgpt-on-wechat guola/chatgpt-on-wechat:$(date +%y%m%d)