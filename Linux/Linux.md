# Debian
w1. dpkg is the package manager for Debian

2. readlink - print resolved symbolic links or canonical file names

   readlink -f $(which cc) $(which gcc) $(which g++) /usr/bin/gcc-5 /usr/bin/gcc-5 /usr/bin/g++-5

   g++ will link libstdc++ by default, while gcc won't.

3. remove zsh
   `sudo apt-get --purge remove zsh`

4. change default shell
   `chsh -s /bin/bash YOURNAME`


## Install nodejs version 10 in linux
``` bash
sudo apt update
sudo apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates
curl -sL https://deb.nodesource.com/setup_10.x | sudo bash
or
curl -sL https://deb.nodesource.com/setup_12.x | sudo bash
```
```
sudo apt update
sudo apt -y install gcc g++ make
sudo apt -y install nodejs
```

## Install ripgreb in ubuntu
```
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb

## Install fzf

sudo dpkg -i ripgrep_12.1.1_amd64.deb
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
1. Yum Commands

[Yum Commands](yum_cheatsheet.pdf)

2. How to mount disk in Linux and automatically enable when reboot

```bash
fdisk -l                      # check disks available
df -h                         # check mounted disks
mkfs.ext4 /dev/vdb            # reset 
mount /dev/vdb /u01           # mount /u01
blkid                         # get uuid, use uuid to mount
vim /etc/fstab                # mount，template is UUID=********** /u01  ext4  defaults  1
```

# CentOS
## How to install ripgreb in Centos
```
yum install yum-utils
yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
yum install ripgrep
```
