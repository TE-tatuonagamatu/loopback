#!/bin/sh

# Install git-lfs
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
apt-get install -y git-lfs
git lfs install

if [ ! -d /mnt ]; then
    mkdir /mnt
fi
LOOPDEV=$(losetup -f)
losetup "${LOOPDEV}" Ubuntu_armhf_nopkg.img
mount -t ext4 "${LOOPDEV}" /mnt
df
ls -Rl /mnt
umount /mnt
losetup -d "${LOOPDEV}"
