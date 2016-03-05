# Partitioning
parted /dev/sda mklabel gpt
parted /dev/sda mkpart ESP fat32 1 513
parted /dev/sda set 1 boot on
parted /dev/sda mkpart primary ext4 513 100%
printf '\nPartitions created\n'

# Generate filesystem
mkfs.ext4 /dev/sda2
mkfs.vfat -F32 /dev/sda1
printf '\nFilesystem created\n'

# Mount everything
mount /dev/sda2 /mnt
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot

# Install base system
pacstrap /mnt base base-devel
printf '\nBase system installed'

# Copy specific files
cp -r /etc/skel /mnt/etc
cp -r /usr/share/arch_linux-wallpaper-1920x1080.jpg /mnt/usr/share
printf '\nFiles copied'

# Generate filesystem table
genfstab /mnt > /mnt/etc/fstab
cat /mnt/etc/fstab
printf '\nFilesystem table generated\n'

# Copy install files to new environment
cp -r /root/chroot-install-efi.sh /mnt
clear
printf 'Please execute chroot-install-efi.sh (bash chroot-install-efi.sh)\n'

# Chroot into environment
arch-chroot /mnt /bin/bash

# Remove install file
rm -rf /mnt/chroot-install-efi.sh

# Exit
umount -R /mnt
reboot now


