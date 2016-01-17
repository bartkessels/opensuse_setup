# Partitioning
parted /dev/sda mklabel msdos
parted /dev/sda mkpart primary ext4 1 100
parted /dev/sda set 1 boot on
parted /dev/sda mkpart primary ext4 100 100%
printf '\nPartitions created\n'

# Set up the encryption
cryptsetup --verbose --cipher aes-xts-plain64 --key-size 512 --hash sha512 --iter-time 5000 --use-random luksFormat /dev/sda2
printf "\nPlease re-enter the same password:\n"
cryptsetup open --type luks /dev/sda2 cryptroot

# Create the filesystem
mkfs.ext4 /dev/sda1
mkfs.ext4 /dev/mapper/cryptroot

# Mount everything
mount -t ext4 /dev/mapper/cryptroot /mnt
mkdir -p /mnt/boot
mount -t ext4 /dev/sda1 /mnt/boot

# Install base system
pacstrap /mnt base base-devel
printf '\nBase system installed\n'

# Copy specific files
cp -r /etc/skel /mnt/etc
cp -r /usr/share/arch_linux-wallpaper-1920x1080.jpg /mnt/usr/share
printf '\nFiles copied'

# Generate filesystem table
genfstab -U -p /mnt >> /mnt/etc/fstab
printf '\nFilesystem table generated\n'

# Copy install files to new environment
cp -r /root/encrypt-chroot-install.sh /mnt
clear
printf 'Please execute encrypt-chroot-install.sh (bash encrypt-chroot-install.sh)\n'

# Chroot into environment
arch-chroot /mnt /bin/bash

# Remove install file
rm -rf /mnt/encrypt-chroot-install.sh

# Exit
umount -R /mnt/boot
umount -R /mnt
cryptsetup close cryptroot
reboot now


