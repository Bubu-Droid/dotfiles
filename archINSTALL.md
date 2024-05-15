## MANUALLY INSTALL ARCH LINUX

The current tutorial is specifically for those who have UEFI mode enabled and
use GPT partition.

# PRE-INSTALLATION

Download an ARCH iso and its signature file from the official ARCH website.

Now we are going to verify its authenticity using gpg key via a linux based
terminal. You can use git-bash if you don't have one.

First we check the authenticity of the .sig file using the following command

```
gpg --decrypt <path_to_sig_file>
```

Now take the EDDSA key from here and go to the ARCH download page. You can
hover over the PGP fingerprint to check the EDDSA key and verify it.

Now we verify the authenticity of the ARCH iso using the following command

```
gpg --keyserver-options auto-key-retrieve --verify <path_to_sig_file>
```

This will ensure us whether the iso file is genuine or not.

> **_NOTE:_** I am assuming that the .sig and the iso file are in the same
> directory.

# CREATING A BOOTABLE INSTALLATION MEDIUM

> **_NOTE:_** Make sure you have secure boot turned off before starting this
> step.

Follow [this](https://wiki.archlinux.org/title/USB_flash_installation_medium).

# INSTALLATION

Firstly enter the boot menu and boot using the flash drive.

Now before we start the actual installation, verify the boot mode using

```
cat /sys/firmware/efi/fw_platform_size
```

It should print out 64 or 32. If the file does not exist, the system may
be booted in BIOS (or CSM). In this case, I'm not sure if you shoulf follow
this tutorial.

## Set keyboard layout

List the keyboard layouts using

```
localectl list-keymaps
```

Now set the layout using

```
loadkeys <layout_name>
```

## Connect to the internet

I am assuming that you are using ethernet while installing ARCH (recommended).
If not, you can connect to some wifi using iwctl (search for the tutorial
online).

Check your connection using

```
ping archlinux.org
```

## Setting up the clock

List the available timezones using

```
timedatectl list-timezones
```

Now pick your favorable time zone and set it by using

```
timedatectl set-timezone <timezone>
```

Now we turn on NTP sync using

```
timedatectl set-ntp true
```

Verify the changes using

```
timedatectl status
```

## Partition the disks

Type in `fdisk -l` to list the available drives. VERY CAREFULLY select the ones
that you want to parition. The disks are assigned to a block device such
as /dev/sda, /dev/nvme0n1 or /dev/mmcblk0. I will refer to these disks as
block-device from hereon.

Results ending in rom, loop or airootfs may be ignored. mmcblk\* devices
ending in rpbm, boot0 and boot1 can be ignored.

I am assuming that you also have two block-devices, one for the /root and the
other for the users. If you have only one, then you can follow the same steps and
just make an extra partition in your block-device for the /home directory.

> **_NOTE:_** If you already have accidentally created some unnecessary partitions
> or have some redundant files in your block-device, you can format them using ext4
> format before partitioning them again.

We partition the disks by using GPT label type by the command

```
cfdisk <block_device>
```

For the first block-device, create two partitions, one for /efi and the other
for /root. For the second block-device create one parition for /home. You can
check the suggested sizes from the ARCH wiki.

> **_NOTE:_** I do not create the swap parition because I already have a decent
> amount of ram. The swap partition is not that fast either anyways.

## Format the partitions

We first format the /efi partition using FAT32 by the command

```
mkfs.fat -F 32 /dev/<efi_sys_partition>
```

Now format the other paritions using ext4 by the command

```
mkfs.ext4 /dev/<other_partitions>
```

## Mount the file systems

We first mount the /root parition using

```
mount /dev/<root_parition> /mnt
```

Now we mount the /efi parition using

```
mount --mkdir /dev/<efi_system_partition> /mnt/efi
```

Now we mount the /home parition using

```
mount --mkdir /dev/<home_partition> /mnt/home
```

## Install essential packages

Install the packages using

```
pacstrap -K /mnt base linux linux-firmware vim base-devel networkmanager man-db
```

## Generate Fstab

Use the command

```
genfstab -U /mnt >> /mnt/etc/fstab
```

Check if the results are fine by running

```
cat /mnt/etc/fstab
```

## Enter chroot

arch-chroot /mnt

## Set the time zone

Set the time zone using

```
ln -sf /usr/share/zoneinfo/<region>/<city> /etc/localtime
```

> **_NOTE:_** If unsure, type till /zoneinfo and then just press tab a few
> times to get recommendations.

Run hclock using

```
hwclock --systohc
```

## Localization

Edit the file using

```
vim /etc/locale.gen
```

and uncomment `en_US.UTF-8 UTF-8` and other needed UTF-8 locales.

Generate the locales by running

```
locale-gen
```

Create the local.conf file by using

```
vim /etc/locale.conf
```

and type in the file the LANG you want to use such as

```
LANG=en_US.UTF-8
```

## Set the hostname

Set the hostname by using

```
vim /etc/hostname
```

and enter in there

```
archlinux
```

## Set the root password

Set the root password by using

```
passwd
```

## Enable time sync using systemctl

Run

```
systemctl start systemd-timesyncd.service
```

## Set up networkmanager and grub

Before we start this, first make sure you install efibootmgr and grub by using

```
pacman -S efibootmgr grub
```

Now we set up networkmanager by running

```
systemctl enable NetworkManager
```

Now we set up grub by running

```
grub-install --efi-directory=/efi
```

## Reboot

Reboot by using

```
reboot
```

and after successfully rebooting into the arch-chroot again, you can remove
the installation medium.

# WE ARE DONE!
