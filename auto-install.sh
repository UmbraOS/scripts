parted -s /dev/sda mklabel msdos
parted -s /dev/sda mkpart primary ext4 1MiB 100%
parted -s /dev/sda set 1 boot on

mkfs.ext4 /dev/sda1
mount /dev/sda1 /mnt
