#fdisk /dev/sda
#mkswap /dev/sda1
#swapon /dev/sda1
#mkfs.ext4 /dev/sda2
#mkfs.ext4 /dev/sda3
#mount /dev/sda2 /mnt
#mkdir /mnt/home
#mount /dev/sda3 /mnt/home
###After mount
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
rankmirrors -n 5 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist
pacstrap /mnt base
pacstrap /mnt base-devel
genfstab -U -p /mnt >> /mnt/etc/fstab
arch-chroot /mnt
