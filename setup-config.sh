# $1 :: Language
# $2 :: Keyboard layout
# $3 :: Time zone

achroot() {
  arch-chroot /mnt /bin/bash -c $1
}

# Set the language
achroot "sed -i 's/#$1/$1/g' /etc/locale.gen"
achroot "locale-gen"
achroot "echo 'LANG=$1' > /etc/locale.conf"

# Set the keyboard layout
achroot "echo 'KEYMAP=$2' > /etc/vconsole.conf"

# Set the time zone
achroot "ln -sf /usr/share/zoneinfo/$3 /etc/localtime"
