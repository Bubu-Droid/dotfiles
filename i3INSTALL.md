# i3 INSTALLATION

This is just a short summary of the `After a Minimal Linux Install' video
by Luke Smith.

# Adding a user

Add a user by using

```
useradd -m -g wheel <user_name>
```

then set the password by using

```
passwd <user_name>
```

# Giving the user sudo access

Give sudo access to the user by using

```
vim /etc/sudoers
```

and then uncomment the line

```
#%wheel ALL=(ALL) NOPASSWD: ALL
```

and fix the indent. Then a bit below this line, add the line

```
Defaults !tty_tickets
```

# Switching the user

Switch to your newly created user by using

```
su <user_name>
```

and then entering the password.

# Installing Xorg

Run the command

```
sudo pacman -S xorg-server xorg-xinit
```

# Installing i3 and adding it to the .xinitrc

Run the command

```
sudo pacman -S i3-wm rxvt-unicode dmenu
```

and then run

```
vim ~/.xinitrc
```

and add the line

```
exec i3
```

into the file.

After having done these steps, start i3 by running the command

```
startx
```

# Setting up a display login manager

Run

```
sudo pacman -S lightdm lightdm-gtk-greeter
```

and then run

```
sudo systemctl enable lightdm.service
```

# Reboot

Run

```
reboot
```

and check if everything works as it should.

# WE ARE DONE!
