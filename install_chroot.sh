read -p 'hostname:' HN
echo $HN > /etc/hostname
echo '127.0.1.1 '$HN'.localdomain '$HN > /etc/hosts
ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime
locale-gen
echo LANG="fr_FR.UTF-8" > /etc/locale.conf
export LANG=fr_FR.UTF-8
echo KEYMAP=fr-pc > /etc/vconsole.conf
mkinitcpio -p linux
passwd
pacman -S grub os-prober
grub-install --target=i386-pc --no-floppy --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
echo "[archlinuxfr]" >> /etc/pacman.conf
echo "SigLevel = Never" >> /etc/pacman.conf
echo "Server = http://repo.archlinux.fr/$arch" >> /etc/pacman.conf
pacman -Syyu --noconfirm
pacman -S yaourt
exit

