#!/bin/bash

if [[ $1 == 'linux' ]]
then
  cat ~/bubu-scripts/bman-docs/linux-comms.txt | less

elif [[ $1 == 'bash' ]]
then
  cat ~/bubu-scripts/bman-docs/bash-comms.txt | less

elif [[ $1 == 'git' ]]
then
  cat ~/bubu-scripts/bman-docs/git-comms.txt | less

elif [[ $1 == 'gitpdf' ]]
then
  zathura ~/bubu-scripts/bman-docs/git-comms-pdf.pdf

else
  echo "Incorrect argument"
fi  

