#!/bin/sh -x

BNAME=$(date "+%Y%m%d%H%M")

# Install git-lfs
#curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
#apt-get install -y git-lfs
#git lfs install

echo "git clone"
git clone https://github.com/TE-tatuonagamatu/loopback.git

echo "mount image"
if [ ! -d /mnt ]; then
    mkdir /mnt
fi
LOOPDEV=$(losetup -f)
losetup "${LOOPDEV}" loopback/Ubuntu_armhf_nopkg.img
mount "${LOOPDEV}" /mnt
echo "update image"
touch /mnt/"${BNAME}"
echo "unmount"
umount /mnt
losetup -d "${LOOPDEV}"

echo "push to server"
cd loopback
git config user.name "Tatsuo Nagamatsu"
git config user.email "nagamatu@gmail.com"
git checkout -b "${BNAME}"
git add .
git push -u origin master
