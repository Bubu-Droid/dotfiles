# Ricing your setup with my dotfiles

> **_NOTE:_** Before you start, make sure you are using your own user and not
> the root one. You can check that by using `whoami`.

## Changing the shell

We first install `zsh` by using

```bash
sudo pacman -S zsh
```

Then enter the zshell by using

```bash
zsh
```

After entering, if it asks to configure zsh and stuff, just pick the option to
create the .zshrc file and quit the configure wizard.

Then we change the default shell to zsh by using

```bash
chsh -s $(which zsh)
```

After having done these steps, MAKE SURE to reboot the system in order for the
shell change to take effect.

## Cloning my dotfiles

Before we start, install `git` by using

```bash
sudo pacman -S git
```

Firstly, we fetch all our dotfiles from my GitHub using

```bash
cd ~
```

then

```bash
git clone --bare <git-repo-url> $HOME/.dotfiles
```

then

```bash
alias dots='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
```

then

```bash
dots checkout
```

then

```bash
dots config --local status.showUntrackedFiles no
```

Now you should be able to notice a lot of stuff in your `~` by using the `ls`.

We should also change the remote URLs from HTTPS to SSH. Follow
[this](https://docs.github.com/en/get-started/getting-started-with-git/managing-remote-repositories#switching-remote-urls-from-https-to-ssh)
tutorial for doing so.

## Installing the packages

Run

```bash
cd ~
```

then

```bash
sudo pacman -Syu --needed - < ~/pacman-Qneq.txt
```

Now we install `yay` by running

```bash
sudo pacman -Syyu
```

then

```bash
sudo pacman -S --needed base-devel git
```

then

```bash
git clone https://aur.archlinux.org/yay-git.git
```

then

```bash
cd yay-git
```

then

```bash
makepkg -si
```

You can check if `yay` was installed successfully by using `yay --version`.

Then install the other packages by using

```bash
sudo yay -Sua --needed - < ~/pacman-Qmeq.txt
```

After having done these steps, refresh the system and the changes should've
been updated.

## Installing zsh-autosuggestions and zsh-syntaxhighlighting

Run

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
```

then

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
```

After having done all of these, run

```bash
source ~/.zshrc
```

and finally reboot the system if needed.

## A few extra commands which need to be run to make everything run perfectly fine

These are a few commands that I come across while installing applications.
I'll keep updating these as I discover them.

```bash
sudo modprobe v4l2loopback
```

```bash
sudo rmmod v4l2loopback
```

Run

```bash
systemctl enable --now cups
```

```bash
sudo usermod -aG lp <user_name>
```

then check if the user has been added using

```bash
groups <user_name>
```

Install the processor drivers if needed (as in my case, the drivers that come
with the kernel for AMD are said to be pretty bad, so yeah).

> **_NOTE:_** Use `tlmgr install <package>` to install packages for LaTeX if
> not installed already.

Yoo, I totally forgot about fonts, here is a list of them (if I am not missing
some). Make a directory named `.fonts` inside `~` and install the following fonts.

- [meslo-lgs-nerd-font](https://github.com/romkatv/powerlevel10k/blob/master/font.md)
- [jetbrains-mono-nerd-font](https://www.nerdfonts.com/font-downloads)
- [noto-fonts-emoji](https://github.com/googlefonts/noto-emoji/releases)
- [iosevka-nerd-font](https://www.nerdfonts.com/font-downloads)

To download specific language fonts, search for `noto-sans-<language>`
font online and download them. Do not download the entire `noto-fonts`
package as it is very bloated otherwise. Also, try to use the `sans`
font instead of the `serif` one which decreases the readability of
the font.

I have the following downloaded, `japanese`, `korean`.

Run

```bash
systemctl start bluetooth.service
```

then

```bash
systemctl enable bluetooth.service
```

Do `nvim /etc/bluetooth/main.conf` and then uncomment the `AutoEnable=true` line.

Using `sudo vim /etc/pacman.conf` uncommnet the following lines

```ini
#Color
```

and add in the following line at the end of the paragraph

```ini
ILoveCandy
```

Now we need to make sure that numlock is turned on every time we boot in. We
can do this by running `sudo vim /etc/lightdm/lightdm.conf`
and then change the line

```ini
# [Seat:*] <bla bla bla>
```

to

```ini
[Seat:*]
greeter-setup-script=/usr/bin/numlockx on
```

Now we are going to set a cool theme for our login screen. To do this
follow [this](https://github.com/iamsubhranil/Rice/blob/master/lightdm-webkit2-greeter_executive.md)
link till the rebooting part and you should have a cool theme for
your login screen.

## INSTALLING REQUIRED NODE PLUGINS

```sh
sudo npm install -g tree-sitter-cli
sudo npm install -g live-server
sudo npm install -g stylelint --save-dev
sudo npm install -g stylelint-config-standard --save-dev
```

## SET THE GLOBAL .GITIGNORE

```git
git config --global core.excludesfile ~/.gitignore_global
dots config core.excludesfile ~/.gitignore-global
```

This can be verified with `git config --global --get core.excludesfile`
and `dots config core.excludesfile`.

## WE ARE DONE
