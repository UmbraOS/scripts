parted -s /dev/sda mklabel msdos
parted -s /dev/sda mkpart primary ext4 $1MiB 100%
parted -s /dev/sda set 1 boot on
parted -s /dev/sda mkpart primary linux-swap 1MiB $1MiB

mkfs.ext4 /dev/sda1
mkswap /dev/sda2
swapon /dev/sda2
mount /dev/sda1 /mnt
