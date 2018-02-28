#!/bin/sh
mkdir /mnt
LOOPDEV=$(losetup -f)
losetup "${LOOPDEV}" Ubuntu_armhf_nopkg.img
mount "${LOOPDEV}" /mnt
df
ls -Rl /mnt
umount /mnt
losetup -d "${LOOPDEV}"
