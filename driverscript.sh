#!/bin/sh
make clean
sudo rmmod char_simple
sudo rm -rf /dev/mychardriver

make
sudo insmod char_simple.ko
dmesg | grep "mknod /dev/mychardriver" | tail -1
sudo mknod /dev/mychardriver c 247 0
sudo chmod a+w /dev/mychardriver

echo "x" > /dev/mychardriver
cat /dev/mychardriver
