#!/bin/bash

if [ $(nmcli radio wifi | grep "enabled" | wc -c) -eq 0 ]
then
  nmcli radio wifi on
else
  nmcli radio wifi off
fi
