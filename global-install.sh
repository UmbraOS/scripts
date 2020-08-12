achroot() {
  arch-chroot /mnt /bin/bash -c $1
}

rsync -a /run/archiso/sfs/airootfs/ /mnt/
cp /run/archiso/bootmnt/arch/boot/x86_64/vmlinuz /mnt/boot/vmlinuz-linux

# Make logs persistent
sed -i 's/volatile/persistent/g' /mnt/etc/systemd/journald.conf

achroot "systemctl enable dhcpcd"
achroot "mkinitcpio -p linux"
achroot "grub-install /dev/sda && grub-mkconfig -o /boot/grub/grub.cfg"

genfstab -U /mnt >> /mnt/etc/fstab
