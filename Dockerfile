
FROM resin/rpi-raspbian:wheezy
RUN sudo apt-get build-dep qemu \
wget http://wiki.qemu-project.org/download/qemu-2.7.0.tar.bz2 \
mkdir qemu-2.7.0/build \
cd qemu-2.7.0/build \
../configure --target-list=i386-linux-user 2>&1 |tee configure.log \
make -j4 2>&1 |tee build.log \
sudo make install

RUN wget http://dl.4players.de/ts/releases/3.0.12.4/teamspeak3-server_linux_x86-3.0.12.4.tar.bz2 \
tar xjvf teamspeak3-server_linux_x86-3.0.12.4.tar.bz2 

CMD ["./ts3server_minimal_runscript.sh"]



# Expose the Standard TS3 port, for files, for serverquery

EXPOSE 9987/udp 30033 10011
