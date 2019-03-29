#!/usr/bin/env bash

curl -O https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz
sha256sum=$(sha256sum go1.10.3.linux-amd64.tar.gz | cut -f1 -d' ')
if [[ ${sha256sum} != "fa1b0e45d3b647c252f51f5e1204aba049cde4af177ef9f2181f43004f901035" ]]; then
    echo "Tar file sha256sum mismatch. Corrupted download or tainted source. Exiting."
    exit 127
fi

tar xf go1.10.3.linux-amd64.tar.gz

sudo chown -R root:root ./go
sudo mv go /usr/local

echo Installed go to /usr/local/go/*

if [[ -e ~/.paths.d ]]; then
    echo "/usr/local/go/bin" >~/.paths.d/_usr_local_go.path
else
    echo "Missing ~/.paths.d folder. Set up GO to path manually."
fi

if [[ -e ~/.env.d ]]; then
    echo "export GOPATH=$HOME/go_work" >~/.env.d/go.sh
else
    echo "Missing ~/.env.d folder. Set up GO env manually."
fi

utils_sirkkalap::block "Evaluate your profile or restart shell to use go"

