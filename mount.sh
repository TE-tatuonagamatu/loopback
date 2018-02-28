#!/bin/sh

BNAME=$(date "+%Y%m%d%H%M")

# Install git-lfs
#curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
#apt-get install -y git-lfs
#git lfs install

git clone https://github.com/TE-tatuonagamatu/loopback.git

if [ ! -d /mnt ]; then
    mkdir /mnt
fi
LOOPDEV=$(losetup -f)
losetup "${LOOPDEV}" loopback/Ubuntu_armhf_nopkg.img
mount "${LOOPDEV}" /mnt
touch /mnt/"${BNAME}"
umount /mnt
losetup -d "${LOOPDEV}"

git checkout -b "${BNAME}"
git add .
git push -u origin master
