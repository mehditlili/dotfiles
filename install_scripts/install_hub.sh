#!/bin/sh

if [ -f $HOME/.local/bin/hub ]; then
  exit 0
elif [ "$(uname)" = "Darwin" ]; then
  exit 1
fi

url="https://github.com/github/hub/releases/download/v2.2.2/hub-linux-amd64-2.2.2.tgz"
wget $url -O /tmp/hub-linux-amd64-2.2.2.tgz
cd /tmp
tar zxvf hub-linux-amd64-2.2.2.tgz
cp hub-linux-amd64-2.2.2/bin/hub $HOME/.local/bin/hub
sudo cp hub-linux-amd64-2.2.2/etc/hub.bash_completion.sh /etc/bash_completion.d/hub.bash_completion.sh
sudo cp hub-linux-amd64-2.2.2/etc/hub.zsh_completion /usr/local/share/zsh/site-functions/_hub
sudo cp hub-linux-amd64-2.2.2/share/man/man1/hub.1 /usr/local/share/man/man1/hub.1
