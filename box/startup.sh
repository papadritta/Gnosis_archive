#!/bin/bash

exists()
{
  command -v "$1" >/dev/null 2>&1
}
if exists curl; then
  echo ''
else
  sudo apt update && sudo apt install curl -y < "/dev/null"
fi
bash_profile=$HOME/.bash_profile
if [ -f "$bash_profile" ]; then
    . $HOME/.bash_profile
fi

source <(curl -s https://raw.githubusercontent.com/papadritta/scripts/main/main.sh)

printLogo

printCyan "Updating packages..." && sleep 1
apt update -y && apt upgrade -y && apt autoremove -y


printCyan "Installing dependencies..." && sleep 1
sudo apt-get update && apt-get install -y git clang llvm ca-certificates curl build-essential binaryen protobuf-compiler libssl-dev pkg-config libsnappy-dev libgflags-dev libclang-dev libc6-dev libc6 cmake jq unzip
                                                                                                   
printCyan "Installing Nethermind..." && sleep 1
cd $HOME
wget https://github.com/NethermindEth/nethermind/releases/download/1.14.6/nethermind-linux-amd64-1.14.6-6aea772-20221121.zip
unzip nethermind-linux-amd64-1.14.6-6aea772-20221121.zip -d nethermind
cd $HOME
chmod +rwx nethermind
sudo rm -r nethermind-linux-amd64-1.14.6-6aea772-20221121.zip

printCyan "Create data dir Nethermind..." && sleep 1
cd $HOME
sudo mkdir /root/nethermind/gnosis
sudo mkdir /root/nethermind/gnosis/data

printCyan "Create systemd Nethermind..." && sleep 1
sudo tee /etc/systemd/system/nethermind.service > /dev/null <<EOF
[Unit]
Description=Nethermind Node
Documentation=https://docs.nethermind.io
After=network.target

[Service]
User=root
WorkingDirectory=/root/nethermind/gnosis
Restart=on-failure
LimitNOFILE=1000000

ExecStart=/root/nethermind/Nethermind.Runner \
  --config xdai_archive.cfg \
  --datadir /root/nethermind/gnosis/data \
  --Network.P2PPort=30304 \
  --Network.DiscoveryPort=30304 \
  --JsonRpc.Host 0.0.0.0 \
  --JsonRpc.Port 8555 \
  --JsonRpc.EngineHost 0.0.0.0 \
  --JsonRpc.EnginePort 8551

[Install]
WantedBy=default.target
EOF

printCyan "Starting Nethermind..." && sleep 1
cd $HOME
sudo systemctl daemon-reload
sudo systemctl enable nethermind
sudo systemctl start nethermind.service

printLine

printCyan "Check Nethermind status..." && sleep 1
if [[ `service nethermind status | grep active` =~ "running" ]]; then
  echo -e "Your nethermind \e[32m. installed and works\e[39m!"
  echo -e "You can check node status by the command \e[7m.sudo systemctl status nethermind\e[0m"
  echo -e "Press \e[7mQ\e[0m for exit from status menu"
  echo -e "You can check logs by the command \e[7m.sudo journalctl -fu nethermind\e[0m"
else
  echo -e "Your nethermind \e[31m. was not installed correctly\e[39m, please reinstall."
fi
