FROM ubuntu:18.04
RUN apt update && apt install -y --no-install-recommends wget locales libglib2.0-0 libnss3 libgtk-3-0 libx11-xcb1 libxss1 libasound2 libxtst6 -y && rm -rf /var/lib/apt/lists/* && rm -rf /var/cache/apk/* && apt-get autoremove
RUN locale-gen zh_CN.UTF-8
ENV LANG zh_CN.UTF-8
RUN wget http://issuecdn.baidupcs.com/issue/netdisk/LinuxGuanjia/baidunetdisk_linux_2.0.1.deb -O baidunetdisk.deb && apt install -y ./baidunetdisk.deb && rm -rf /var/lib/apt/lists/* && rm -rf /var/cache/apk/* && apt-get autoremove
RUN groupadd --gid 1000 user
RUN useradd --home-dir /home/user --gid 1000 --create-home --uid 1000 user
USER user
CMD ["baidunetdisk"]
