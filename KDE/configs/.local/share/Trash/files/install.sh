# Partitioning
parted /dev/sda mklabel msdos
parted /dev/sda mkpart primary ext4 1 100%
parted /dev/sda set 1 boot on
printf '\nPartitions created\n'

# Generate filesystem
mkfs.ext4 /dev/sda1
printf '\nFilesystem created\n'

# Mount everything
mount /dev/sda1 /mnt

# Install base system
pacstrap /mnt base base-devel
printf '\nBase system installed\n'

# Copy specific files
cp -r /etc/skel /mnt/etc
cp -r /usr/share/arch_linux-wallpaper-1920x1080.jpg /mnt/usr/share
printf '\nFiles copied'

# Generate filesystem table
genfstab /mnt > /mnt/etc/fstab
cat /mnt/etc/fstab
printf '\nFilesystem table generated\n'

# Copy install files to new environment
cp -r /root/chroot-install.sh /mnt
clear
printf 'Please execute chroot-install.sh (bash chroot-install.sh)\n'

# Chroot into environment
arch-chroot /mnt /bin/bash

# Remove install file
rm -rf /mnt/chroot-install.sh

# Exit
umount -R /mnt
reboot now


