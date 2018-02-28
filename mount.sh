#!/bin/sh
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
