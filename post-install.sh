rsync -a /run/archiso/sfs/airootfs/ /mnt/
cp /run/archiso/bootmnt/arch/boot/x86_64/vmlinuz /mnt/boot/vmlinuz-linux

sed -i 's/volatile/persistent/g' /mnt/etc/systemd/journald.conf

arch-chroot /mnt /bin/bash -c "systemctl enable dhcpcd"
arch-chroot /mnt /bin/bash -c "mkinitcpio -p linux"
arch-chroot /mnt /bin/bash -c "grub-install /dev/sda && grub-mkconfig -o /boot/grub/grub.cfg"

genfstab -U /mnt >> /mnt/etc/fstab
