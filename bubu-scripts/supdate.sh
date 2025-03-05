#!/bin/bash

sudo pacman -Syu
yay
sudo pacman -Qneq >~/pacman-Qneq.txt
sudo pacman -Qmeq >~/pacman-Qmeq.txt
sudo updatedb
nvim --headless -c ":TSUpdate all" -c qall
nvim --headless -c ":MasonToolsClean" -c qall
nvim --headless -c ":MasonToolsUpdateSync" -c qall

echo ""
cat /home/bubu/Desktop/.gitignore
echo "DOWNLOADS"
echo "DESKTOP"
echo "DOCUMENTS"
echo "Update all the git stuff here"
echo "Update the ublock saves"
