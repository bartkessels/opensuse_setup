# Partitioning (EFI)
parted /dev/sda mklabel gpt
parted /dev/sda mkpart ESP fat32 1 513
parted /dev/sda set 1 boot on
parted /dev/sda mkpart primary ext4 513 100%
printf '\nPartitions created\n'

# Set the encryption
cryptsetup --verbose --cipher aes-xts-plain64 --key-size 512 --hash sha512 --iter-time 5000 --use-random luksFormat /dev/sda2
printf "\nPlease re-enter the same password:\n"
cryptsetup open --type luks /dev/sda2 lvm

# Create filesystem
mkfs.vfat /dev/sda1
pvcreate /dev/mapper/lvm
vgcreate vol0 /dev/mapper/lvm

# Set swap
lvcreate --name lv_swap -L 6GB vol0
lvcreate --name lv_root -l 100%FREE vol0
mkswap /dev/mapper/vol0-lv_swap
swapon /dev/mapper/vol0-lv_swap
mkfs.ext4 /dev/mapper/vol0-lv_root

# Mount
mount /dev/mapper/vol0-lv_root /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

# Install base system
pacstrap /mnt base base-devel

# Copy specific files
cp -r /etc/skel /mnt/etc
cp -r /usr/share/arch_linux-wallpaper-1920x1080.jpg /mnt/usr/share
printf '\nFiles copied'

# Generate file system table
genfstab -U -p /mnt >> /mnt/etc/fstab

# Copy install files to new environment
cp -r /root/encrypt-chroot-install-efi.sh /mnt
clear
printf "Please execute encrypt-chroot-install-efi.sh (bash encrypt-chroot-install-efi.sh)\n"

# Chroot into environment
arch-chroot /mnt /bin/bash

# Remove install file
rm -rf /mnt/encrypt-chroot-install-efi.sh

# Unmount
umount /mnt/boot
umount /mnt
reboot now
