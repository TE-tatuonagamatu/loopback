#!/bin/sh

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
df
ls -Rl /mnt
umount /mnt
losetup -d "${LOOPDEV}"
dmesg | tail
od -X loopback/Ubuntu_armhf_nopkg.img | head
