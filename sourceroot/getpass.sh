#!/bin/sh

device=$1

setfont fonts/ter-v32b.psf.gz

dialog --backtitle "ENCRYPTED DISK" --title "Passphrase required" --passwordbox "Enter passphrase for ${device}" 8 65 2>/run/initramfs-passwd

setfont fonts/`readlink fonts/default`

#passphrase=`cat /tmp/initramfs-passwd`
#rm /tmp/initramfs-passwd

#dialog --backtitle "ENCRYPTED DISK" --msgbox "Passphrase entered: ${passphrase}" 8 50
