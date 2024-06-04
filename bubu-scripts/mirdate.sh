#!/bin/bash

# check https://www.reddit.com/r/archlinux/comments/3e7lq6/do_you_use_reflector_to_manage_your_mirror_list/
# for further references

# change the -l (latest) argument to some lesser value >= 20 to fasten up the
# process, but the ideology is to run the command with -l 200 (which might 
# take quite a bit of time) for one single time and never run it again

reflector --verbose -l 20 -n 20 -p http,https --sort rate --save /etc/pacman.d/mirrorlist
