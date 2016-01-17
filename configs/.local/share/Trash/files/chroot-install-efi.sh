# Hostname
echo 'Computername:'
read host_name
echo $host_name > /etc/hostname
sed -i "s|localhost.localdomain   localhost|localhost.localdomain   localhost $host_name|g" /etc/hosts

# IP tables
touch /etc/iptables/iptables.rules
printf '*filter\n:INPUT DROP [0:0]\n:FORWARD DROP [0:0]\n:OUTPUT ACCEPT [0:0]\n    -A INPUT -i lo -j ACCEPT\n    -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT\n    -A OUTPUT -o lo -j ACCEPT\nCOMMIT' > /etc/iptables/iptables.rules
systemctl enable iptables

# Delete kwallet
rm -rf /etc/skel/.local/share/kwalletd/*

# Remove install scripts from skel
rm -rf /etc/skel/install.sh
rm -rf /etc/skel/chroot-install.sh
rm -rf /etc/skel/install-efi.sh
rm -rf /etc/skel/chroot-install-efi.sh
rm -rf /etc/skel/encrypt-install.sh
rm -rf /etc/skel/encrypt-chroot-install.sh
rm -rf /etc/skel/encrypt-install-efi.sh
rm -rf /etc/skel/encrypt-chroot-install-efi.sh

# Create default directories
mkdir /etc/skel/Desktop
mkdir /etc/skel/Documents
mkdir /etc/skel/Downloads
mkdir /etc/skel/Videos
mkdir /etc/skel/Pictures
mkdir /etc/skel/Music

# Set up VIM
printf '\nsyntax on \n \nset ruler \nset ttyfast \nset mouse=a \nset ttymouse=xterm2 \n \n" TABS \n \nset tabstop=2 \nset shiftwidth=2 \nset shiftround \nset expandtab\nset autoindent \nset cindent \n \n" LINE NUMBERS \n \nset number \nset numberwidth=5 \nhighlight lineNr ctermfg=black ctermbg=gray \nhighlight Normal ctermfg=gray ctermbg=black \nset background=dark \n \n" SPLIT WINDOWS \n \nset splitbelow \nset splitright \n \n" HTML \n \nset matchpairs+=<:>\nlet g:html_indent_tags="li\|p"' > /etc/skel/.vimrc

# Set up polkit
printf '[super-user-command]\nsuper-user-command=sudo' > /etc/skel/.config/kdesurc

# Add user
read -p "Username: " user_name
useradd -m -g users -G wheel -s /bin/bash $user_name
passwd $user_name
printf '\nUser created\n'

# Set locale
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
printf 'Keyboard layout set\n'

# Timezone
ln -s /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime
hwclock --systohc --utc
printf '\nTimezone set\n'

# Make computer boot with NUMlock on
printf "\n\n[General]\nNumlock=on\n" > /etc/sddm.conf

# Install yaourt
printf '\n\n[archlinuxfr]\nSigLevel = Never\nServer = http://repo.archlinux.fr/$arch' >> /etc/pacman.conf
pacman -Syy yaourt --noconfirm
printf '\nYaourt setup\n'

# Enable multilib
printf '\n\n[multilib]\nInclude = /etc/pacman.d/mirrorlist\n' >> /etc/pacman.conf

# Resync packages / Update
pacman -Syu --noconfirm

# Install GUI
pacman -S xorg xorg-xinit sddm plasma-desktop plasma plasma-meta sddm-kcm kscreen --noconfirm
printf '\n[Theme]\nCurrent=breeze\nCursorTheme=breeze_cursors\nFacesDir=/usr/share/sddm/faces\nThemeDir=/usr/share/sddm/themes\n' >> /etc/sddm.conf
systemctl enable sddm
printf '\n[General]\nbackground=/usr/share/arch_linux-wallpaper-1920x1080.jpg\n\n' > /usr/share/sddm/themes/breeze/theme.conf.user
printf '\nGUI installed\n'

# GTK support
pacman -S gtk2 gtk3 lxappearance gtk-theme-orion kde-gtk-config --noconfirm

# Systemsettings
pacman -S systemd-kcm bluedevil drkonqi kdeplasma-addons ibus scim purpose kgamma5 ksshaskpass kwayland-integration kwrited plasma-pa plasma-workspace-wallpapers user-manager partitionmanager kdeutils --noconfirm

# Install Network manager
pacman -S plasma-nm networkmanager kdenetwork --noconfirm
systemctl enable NetworkManager.service

# Install sound system
pacman -S kmix libcanberra-pulse pulseaudio pulseaudio-alsa alsa-utils --noconfirm

# Install fonts
pacman -S ttf-bitstream-vera ttf-inconsolata ttf-ubuntu-font-family ttf-dejavu ttf-freefont ttf-linux-libertine ttf-liberation ttf-droid ttf-oxygen noto-fonts noto-fonts-cjk noto-fonts-emoji --noconfirm
ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d
mkfontscale
mkfontdir

# Install Codecs
pacman -S celt faac faad2 flac libdca libdv libmpeg2 libmad libmpcdec opencore-amr opus schroedinger speex libtheora libvorbis libvpx wavpack x264 x265 xvidcore --noconfirm

# Install printer 
pacman -S cups ghostscript gsfonts libcups --noconfirm
gpasswd -a $user_name sys
systemctl enable org.cups.cupsd.service

# Install filesystem drivers
pacman -S btrfs-progs dosfstools exfat-utils ntfs-3g --noconfirm

# Install LaTeX
pacman -S kile texlive-latexextra texlive-fontsextra texlive-formatsextra texlive-plainextra texlive-publishers texlive-science --noconfirm

# Install all applications
pacman -S clementine gstreamer0.10-base-plugins gstreamer0.10-good-plugins gstreamer0.10-bad-plugins gstreamer0.10-ugly-plugins gstreamer0.10-ffmpeg wget whois kdevelop kdevelop-php kdevelop-python2 ardour tmux vim audacity blender chromium qbittorrent dia kmail filezilla geany geany-plugins firefox calligra-krita gimp umbrello  kdebase-kdepasswd libreoffice-fresh hunspell-en hunspell-nl virtualbox virtualbox-guest-utils qtcreator konsole tuxguitar unetbootin kdebase-kdialog kmymoney simplescreenrecorder kate k3b openssh ark kdeutils-kgpg print-manager gwenview kdeadmin gvfs-smb kdenlive libsamplerate sox ffmpeg vid.stab qt5-svg jack libexif frei0r-plugins movit vcdimager gnome-vfs opencv-samples eigen2 libcl dvdauthor netbeans bluefish anjuta  kdegraphics kcharselect vlc cdrdao dvd+rw-tools kcalc korganizer kaccounts-integration kaccounts-providers kdepim kwalletmanager kdewebdev dolphin zip unzip unrar kdenetwork-krdc kdebase-keditbookmarks freerdp libvncserver gst-plugins-good kwallet-pam git perl-libwww perl-term-readkey perl-mime-tools perl-net-smtp-ssl perl-authen-sasl phonon-qt5-backend --noconfirm
printf '\nApplications installed\n'

# Make sure KDEnlive won't crash
/usr/lib/vlc/vlc-cache-gen -f /usr/lib/vlc/plugins/

# Unlock wallet on login
printf 'auth            include         system-login\nauth            optional        pam_kwallet5.so\nauth            optional        pam_kwallet.so kdehome=.kde4\naccount         include         system-login\npassword        include         system-login\nsession          include         system-login\nsession         optional        pam_kwallet5.so auto_start\nsession         optional        pam_kwallet.so' > /etc/pam.d/sddm
printf '#%%PAM-1.0\n\nauth            include         system-login\nauth            optional        pam_kwallet5.so\naccount         include         system-login\npassword        include         system-login\nsession         include         system-login\nsession         optional        pam_kwallet5.so auto_start' > /etc/pam.d/kde

# Modify sudoers
sed -i 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/g' /etc/sudoers
printf '\nDefaults env_reset,insults\n' >> /etc/sudoers

# Lock account after 3 failed login attempts
sed -i 's|auth       required   pam_tally.so         onerr=succeed file=/var/log/faillog|auth       required   pam_tally.so         deny=2 unlock_time=600 onerr=succeed file=/var/log/faillog|g' /etc/pam.d/system-login

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Install bootloader
pacman -S dosfstools --noconfirm
bootctl --path=/boot install
printf 'title    BK ARCH\nlinux    /vmlinuz-linux\ninitrd    /initramfs-linux.img\noptions    root=/dev/sda2 rw' > /boot/loader/entries/arch.conf
printf 'timeout 3\ndefault arch' > /boot/loader/loader.conf
printf '\nBoot loader installed\n'
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


# Install apache
pacman -S apache --noconfirm
sed -i 's|LoadModule unique_id_module modules/mod_unique_id.so|LoadModule unique_id_module modules/mod_unique_id.so|g' /etc/httpd/conf/httpd.conf
printf '<!DOCTYPE html>\n<html>\n<head>\n<title>Welcome!</title>\n</head>\n<body>\n<h1>Welcome on the BK ARCH webserver</h1>\n<p>You can go to your <a href="phpmyadmin" target="_blank">MySQL database</a>.</p>\n<p>View <a href="info.php" target="_blank">php information</a>.</p>\n<h3>Credentials</h3>\n<p>Username: root<br>Password: &lt;empty&gt;</p>\n</body>\n</html>' > /srv/http/index.html
printf '<?php phpinfo(); ?>' > /srv/http/info.php
chown -R :http /srv/http
chmod 775 /srv/http

# Install PHP
pacman -S php php-apache --noconfirm
sed -i 's|LoadModule mpm_event_module modules/mod_mpm_event.so|LoadModule mpm_prefork_module modules/mod_mpm_prefork.so|g' /etc/httpd/conf/httpd.conf
sed -i 's|LoadModule dir_module modules/mod_dir.so|LoadModule dir_module modules/mod_dir.so\nLoadModule php7_module modules/libphp7.so|g' /etc/httpd/conf/httpd.conf
sed -i 's|#LoadModule rewrite_module modules/mod_rewrite.so|LoadModule rewrite_module modules/mod_rewrite.so|g' /etc/httpd/conf/httpd.conf
sed -i 's|    AllowOverride None|    AllowOverride All|g' /etc/httpd/conf/httpd.conf
sed -i 's|Include conf/extra/httpd-default.conf|Include conf/extra/httpd-default.conf\nInclude conf/extra/php7_module.conf|g' /etc/httpd/conf/httpd.conf
sed -i 's|display_errors = Off|display_errors = On|g' /etc/php/php.ini

# Install MySql
pacman -S mysql --noconfirm
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sed -i 's|= your_password|= root|g' /etc/mysql/my.cnf

# Install phpMyAdmin
pacman -S phpmyadmin php-mcrypt --noconfirm
sed -i 's|;extension=mysqli.so|extension=mysqli.so|g' /etc/php/php.ini
sed -i 's|;extension=mcrypt.so|extension=mcrypt.so|g' /etc/php/php.ini
sed -i 's|open_basedir = /srv/http/:/home/:/tmp/:/usr/share/pear/:/usr/share/webapps/|open_basedir = /srv/http/:/home/:/tmp/:/usr/share/pear/:/usr/share/webapps/:/etc/webapps/|g' /etc/php/php.ini
printf 'Alias /phpmyadmin "/usr/share/webapps/phpMyAdmin"\n<Directory "/usr/share/webapps/phpMyAdmin">\n    DirectoryIndex index.php\n    AllowOverride All\n    Options FollowSymLinks\n    Require local\n</Directory>' > /etc/httpd/conf/extra/phpmyadmin.conf
printf '# phpMyAdmin configuration\nInclude conf/extra/phpmyadmin.conf' >> /etc/httpd/conf/httpd.conf
sed -i 's|\['\''AllowNoPassword'\''\] = false|\['\''AllowNoPassword'\''\] = true|g' /etc/webapps/phpmyadmin/config.inc.php


# Add user to http group
usermod -a -G http $user_name

# Enable apache/mysql
systemctl enable httpd
systemctl enable mysqld

# Resync packages / Update
pacman -Syu --noconfirm

# Increase inotify
printf '# Increase inofity watch limit\nfs.inotify.max_user_watches = 1000000' > /etc/sysctl.d/90-inotify.conf
printf '\n\n# Increase inofity watch limit\nfs.inotify.max_user_watches = 1000000' >> /usr/lib/sysctl.d/50-default.conf

# Virtualbox goed laten starten
printf 'vboxdrv' > /etc/modules-load.d/virtualbox.conf


# Disable root account
passwd -l root

# Exit
clear
printf "\nPlease exit (exit)\n"




