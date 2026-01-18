# Ricing your setup with my Dotfiles

> [!IMPORTANT]
> Before you start, make sure you are using your own user and not
> the root one. You can check that by using `whoami`.

- Change the default shell to `zsh`.

- Reboot.

- Install fonts into `$HOME/.fonts/`.
  Here are a few shortlisted fonts.
  You may find a comprehensive list at the [Arch Wiki page
  dedicated for fonts][archwikifonts].
  - [meslo-lgs-nerd-font (patched for p10k)][meslolgs]
  - [jetbrains-mono-nerd-font][nerdfonts]
  - [iosevka-nerd-font][nerdfonts]
  - [inter][inter]
  - [noto-fonts-emoji][notocolemoji]
  - [noto-sans-japanese][notosansjp]

- Follow [Arch Wiki Dotfiles manual][archwikidotfiles]
  instructions to fetch my Dotfiles.

- Install `yay`.

- Install necessary AUR packages from [pacman-qmeq.txt](pacman-qmeq.txt).

- Install necessary pacman packages from [pacman-qneq.txt](pacman-qneq.txt).

> [!TIP]
> You may use the command
> `sudo pacman -Syu --needed - < ~/pacman-qneq.txt` to
> automate the package downloading procedure.

> [!IMPORTANT]
> Synchronize the pacman package database using
> `sudo pacman -Sy` whenever needed.

- Set up Bluetooth services by following the
  Arch Wiki [Bluetooth][bluetooth]
  and [MPRIS][mpris] pages.

- Set up printing services. Here is a beautiful
  and comprehensive YouTube tutorial for [setting up
  HP printers in Arch Linux][hpprint].

- Turn on `Color`, `ILoveCandy`, and `VerbosePkgLists`
  for pacman.
  For some other pretty changes, you may search for
  “how to prettify my pacman”.

- For other general recommendations, you may follow
  this [Arch Wiki article][archwikipostinstall]
  on post-installation general recommendations.

- Add the line `GTK_THEME=Adwaita`
  at the end of `/etc/environment`.

- Configure your login screen using Aether. You
  may follow [this][loginaether] article.

- (Optional) Set up `v4l2loopback-dkms` for virtual
  camera if you use OBS.

- (Optional) I have a few node packages installed for my neovim plugins.
  You may install them using `sudo npm install -g <package-name>`.
  Here is a shortlist of a few packages I require.
  - tree-sitter-cli
  - live-server
  - stylelint --save-dev
  - stylelint-config-standard --save-dev

  In case if any other plugin breaks, you can fix it by
  installing the plugin/package
  globally be it a python code formatter like
  `isort` or `black` or a node based linter.

- In case you encounter a firefox bug which prints colored
  page despite the print mode being chosen black & white,
  [this article][firefoxbwbug]
  might help you find a potential fix.

[archwikidotfiles]: https://wiki.archlinux.org/title/Dotfiles
[meslolgs]: https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#fonts
[nerdfonts]: https://www.nerdfonts.com/font-downloads
[notocolemoji]: https://fonts.google.com/noto/specimen/Noto+Color+Emoji
[notosansjp]: https://fonts.google.com/noto/specimen/Noto+Sans+JP
[inter]: https://fonts.google.com/specimen/Inter
[archwikifonts]: https://wiki.archlinux.org/title/Fonts
[hpprint]: https://youtu.be/dSRblSh48DM?si=ef0uAXNTo7KrJAzD
[bluetooth]: https://wiki.archlinux.org/title/Bluetooth
[mpris]: https://wiki.archlinux.org/title/MPRIS
[archwikipostinstall]: https://wiki.archlinux.org/title/General_recommendations
[loginaether]: https://github.com/iamsubhranil/Rice/blob/main/lightdm-webkit2-greeter_executive.md
[firefoxbwbug]: https://bugzilla.mozilla.org/show_bug.cgi?id=1676191#c27
