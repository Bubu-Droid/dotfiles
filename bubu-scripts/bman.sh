#!/bin/bash

if [ $1 == 'linux' ]
then
  cat ~/.bubu-scripts/bman-docs/linux-comms.txt | less

elif [ $1 == 'bash' ]
then
  cat ~/.bubu-scripts/bman-docs/bash-comms.txt | less

else
  echo "Incorrect argument"
fi  

