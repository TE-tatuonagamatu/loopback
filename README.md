# loopback

1. update output branch name value for BRANCH_NAME
2. copy Ubuntu_armhf_nopkg.img
3. run sh split.sh
4. git add .
5. git commit
6. git push -u origin master
7. wait for creation of BRANCH_NAME
8. git checkout $(cat BRANCH_NAME)
9. cat Ubuntu_armhf_nopkg.? > Ubuntu_armhf_nopkg.img
10. git push --delete origin $(cat BRANCH_NAME)
