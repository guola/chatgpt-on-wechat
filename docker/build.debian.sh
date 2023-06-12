#!/bin/bash

# fetch latest release tag
CHATGPT_ON_WECHAT_TAG=`curl -sL "https://api.github.com/repos/guola/chatgpt-on-wechat/releases/latest" | \
     grep '"tag_name":' | \
     sed -E 's/.*"([^"]+)".*/\1/'`

# build image
docker build -f Dockerfile.debian \
             --build-arg CHATGPT_ON_WECHAT_VER=$CHATGPT_ON_WECHAT_TAG \
             -t guola/chatgpt-on-wechat .

# tag image
docker tag guola/chatgpt-on-wechat guola/chatgpt-on-wechat:debian
docker tag guola/chatgpt-on-wechat guola/chatgpt-on-wechat:$CHATGPT_ON_WECHAT_TAG-debian