## Installation Gnosis archive node with Nethermind client.
![Copy of Copy of Staking is live  (1)](https://user-images.githubusercontent.com/90826754/204135088-2741821a-0987-4810-8dc7-250b166f9d58.png)

## Link
- official Github page Nethermind [here](https://github.com/NethermindEth/nethermind)

## Node Specs

|      | Minimum       | Recommended    | Maxed out         |
| :---:|     :---:     |      :---:     |      :---:        |
| CPUs | 16 vcore      | 32 vcore       | 64 vcore          |
| RAM  | 32 G          | 64 GB          | 128 GB            |
| SSD  | 3 TB SATA SSD |5 TB NVME       | 5 TB NVME RAID 10	|
	

## Installation Nethermind client 1.14.6
```
wget -O startup.sh https://raw.githubusercontent.com/papadritta/Gnosis_archive/main/box/startup.sh && chmod +x startup.sh && ./startup.sh
```
>Tested on Ubuntu 21.04, 20.04 and 18.04 LTS and 21.10

***NOTE!: If you CLI version less than 1.14.1 you mast to update for the Merge >>>***
## Update Nethermind client
>works only if you use installation script above with different version of Nethermind
```
wget -O
```
## Check status & logs Nethermind

```
sudo systemctl status nethermind
sudo journalctl -fu nethermind
```

## Delete Nethermind
```
wget -O delete.sh https://raw.githubusercontent.com/papadritta/Gnosis_archive/main/box/delete.sh && chmod +x delete.sh && ./delete.sh

```
## Do you need a server?
- Use the links with referal programm <a href="https://www.vultr.com/?ref=8997131"><img width="200" src="https://user-images.githubusercontent.com/90826754/200262610-b6251a9b-36a9-44f7-be30-fa691e7238de.png" /></a>
            <a href="https://www.digitalocean.com/?refcode=87b8b298c106&utm_campaign=Referral_Invite&utm_medium=Referral_Program&utm_source=badge"><img src="https://web-platforms.sfo2.cdn.digitaloceanspaces.com/WWW/Badge%201.svg" alt="DigitalOcean Referral Badge" /></a>

**NOTE!: use a referal link & you will get 100$ to your server provider account**

ALL DONE!
