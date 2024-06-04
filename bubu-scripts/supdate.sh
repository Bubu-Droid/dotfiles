#!/bin/bash

sudo pacman -Syu
yay -Sua
sudo pacman -Qneq > ~/pacman-Qneq.txt
sudo pacman -Qmeq > ~/pacman-Qmeq.txt
sudo updatedb

cat /home/bubu/Desktop/.gitignore
echo "DOWNLOADS"
echo "DESKTOP"
echo "Update all the git stuff here"
