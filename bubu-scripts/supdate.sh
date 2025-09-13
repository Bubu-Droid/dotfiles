#!/usr/bin/env bash

sudo pacman -Syu
yay
sudo updatedb
nvim --headless -c ":TSUpdate all" -c qall
nvim --headless -c ":MasonToolsClean" -c qall
nvim --headless -c ":MasonToolsUpdateSync" -c qall
nvim --headless -c ":Lazy sync" -c qall

echo ""
cat "$HOME/Desktop/.gitignore"
echo "DOWNLOADS"
echo "DESKTOP"
echo "DOCUMENTS"
echo "Update all the git stuff here"
echo "Update the ublock saves"
