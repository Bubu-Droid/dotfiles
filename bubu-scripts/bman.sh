#!/usr/bin/env bash

if [[ $1 == 'linux' ]]; then
  less "$HOME/bubu-scripts/bman-docs/linux-comms.txt"

elif [[ $1 == 'bash' ]]; then
  less "$HOME/bubu-scripts/bman-docs/bash-comms.txt"

elif [[ $1 == 'git' ]]; then
  less "$HOME/bubu-scripts/bman-docs/git-comms.txt"

elif [[ $1 == 'gitpdf' ]]; then
  zathura "$HOME/bubu-scripts/bman-docs/git-comms-pdf.pdf"

else
  echo "Incorrect argument. Choose one from 'linux' or bash' or 'git' or 'gitpdf'."
fi
