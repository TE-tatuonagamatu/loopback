#!/bin/sh -x

BRANCH_NAME=$(date "+%Y%m%d%H%M")
CI_REMOTE_REPOSITORY="git@github.com:${CIRCLE_PROJECT_USERNAME}/${CIRCLE_PROJECT_REPONAME}.git"

echo "${CI_PROJECT_USERNAME}"
echo "${CI_PROJECT_REPONAME}"
echo "${CI_REMOTE_REPOSITORY}"

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
touch /mnt/"${BRANCH_NAME}"
echo "unmount"
umount /mnt
losetup -d "${LOOPDEV}"

echo "create new branch ${BRANCH_NAME}"
cd loopback
git checkout -b "${BRANCH_NAME}"
git add .
git status
echo "push to server"
git commit -m "[auto] branch (${BRANCH_NAME})"
git push "${CI_REMOTE_REPOSITORY}" "${BRANCH_NAME}"
