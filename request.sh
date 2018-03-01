#!/bin/sh

# copy Ubuntu_armhf_nopkg.img here, then execute me

wait_branch () {
  echo "waiting ..."
  while : ; do
    if (git branch --remote | grep "origin/$1" > /dev/null 2>&1); then
      break
    fi
    echo "."
    sleep 5
    git pull > /dev/null 2>&1
  done
  echo "found branch: $1"
}

BRANCH_NAME=$(date "+%Y%m%d%H%M%S")
git checkout master
git pull
echo "$BRANCH_NAME" > BRANCH_NAME
rm Ubuntu_armhf_nopkg.???
sh split.sh
git add .
git commit -m "[auto] request for branch: $BRANCH_NAME"
git push -u origin master

wait_branch "$BRANCH_NAME"

git checkout "$BRANCH_NAME"
cat Ubuntu_armhf_nopkg.??? > Ubuntu_armhf_nopkg.img
git checkout master
git push --delete origin "$BRANCH_NAME"

echo DONE
