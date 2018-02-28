# Start with Ubuntu 16.04 LTS.
FROM ubuntu:16.04

MAINTAINER Tatsuo Nagamatsu <nagamatu@gmail.com>

RUN apt-get update
RUN apt-get install -y curl
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
RUN apt-get install -y git-lfs
RUN git lfs install

ADD mount.sh /mount.sh
ADD /home/circleci/.ssh /

ENTRYPOINT [ "sh", "/mount.sh" ]
