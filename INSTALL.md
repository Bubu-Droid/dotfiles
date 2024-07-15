# Ricing your setup with my dotfiles

> **_NOTE:_** Before you start, make sure you are using your own user and not
> the root one. You can check that by using `whoami`.

## Changing the shell

We first install `zsh` by using

```
sudo pacman -S zsh
```

Then enter the zshell by using

```
zsh
```

After entering, if it asks to configure zsh and stuff, just pick the option to
create the .zshrc file and quit the configure wizard.

Then we change the default shell to zsh by using

```
chsh -s $(which zsh)
```

After having done these steps, MAKE SURE to reboot the system in order for the
shell change to take effect.

## Cloning my dotfiles

Before we start, install `git` by using

```
sudo pacman -S git
```

Firstly, we fetch all our dotfiles from my GitHub using

```
cd ~
```

then

```
git clone --bare <git-repo-url> $HOME/.dotfiles
```

then

```
alias dots='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
```

then

```
dots checkout
```

then

```
dots config --local status.showUntrackedFiles no
```

Now you should be able to notice a lot of stuff in your `~` by using the `ls`.

We should also change the remote URLs from HTTPS to SSH. Follow
[this](https://docs.github.com/en/get-started/getting-started-with-git/managing-remote-repositories#switching-remote-urls-from-https-to-ssh)
tutorial for doing so.

## Installing the packages

Run

```
cd ~
```

then

```
sudo pacman -Syu --needed - < ~/pacman-Qneq.txt
```

Now we install `yay` by running

```
sudo pacman -Syyu
```

then

```
sudo pacman -S --needed base-devel git
```

then

```
git clone https://aur.archlinux.org/yay-git.git
```

then

```
cd yay-git
```

then

```
makepkg -si
```

You can check if `yay` was installed successfully by using `yay --version`.

Then install the other packages by using

```
sudo yay -Sua --needed - < ~/pacman-Qmeq.txt
```

After having done these steps, refresh the system and the changes should've
been updated.

## Installing zsh-autosuggestions and zsh-syntaxhighlighting

Run

```
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
```

then

```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
```

After having done all of these, run

```
source ~/.zshrc
```

and finally reboot the system if needed.

## A few extra commands which need to be run to make everything run perfectly fine

These are a few commands that I come across while installing applications.
I'll keep updating these as I discover them.

```
sudo modprobe v4l2loopback
```

```
sudo rmmod v4l2loopback
```

Run

```
systemctl enable --now cups
```

```
sudo usermod -aG lp <user_name>
```

then check if the user has been added using

```
groups <user_name>
```

Install the processor drivers if needed (as in my case, the drivers that come
with the kernel for AMD are said to be pretty bad, so yeah).

> **_NOTE:_** Use `tlmgr install <package>` to install packages for LaTeX if
> not installed already.

Yoo, I totally forgot about fonts, here is a list of them (if I am not missing
some). Make a directory named `.fonts` inside `~` and install the following fonts.

```
[meslo-lgs-nerd-font](https://www.nerdfonts.com/font-downloads)
[jetbrains-mono-nerd-font](https://www.nerdfonts.com/font-downloads)
[noto-fonts-emoji](https://github.com/googlefonts/noto-emoji/releases)
[noto-fonts](https://github.com/notofonts/notofonts.github.io/releases)
[iosevka-nerd-font](https://www.nerdfonts.com/font-downloads)
```

Run

```
systemctl start bluetooth.service
```

then

```
systemctl enable bluetooth.service
```

Do `nvim /etc/bluetooth/main.conf` and then uncomment the `AutoEnable=true` line.

Using `sudo vim /etc/pacman.conf` uncommnet the following lines

```
#Color
```

and add in the following line at the end of the paragraph

```
ILoveCandy
```

Now we need to make sure that numlock is turned on every time we boot in. We
can do this by running `sudo vim /etc/lightdm/lightdm.conf`
and then change the line

```
# [Seat:*] <bla bla bla>
```

to

```
[Seat:*]
greeter-setup-script=/usr/bin/numlockx on
```

# WE ARE DONE!
