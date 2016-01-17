#####################################################################################
#####################################################################################

#		SETTINGS

#####################################################################################
#####################################################################################

# Add packman repository to zypper
zypper addrepo -f http://packman.inode.at/suse/openSUSE_Leap_42.1/ packman

# fonts
zypper --non-interactive install bitstream-vera-fonts google-inconsolata-fonts ubuntu-fonts linux-libertine-fonts
ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d
mkfontscale
mkfontdir

# Settings
zypper --non-interactive install kwayland-integration kwrited5 plasma5-workspace-wallpapers kdeclarative-tools krandr libKF5Screen6-32bit plasma5-workspace-libs-32bit kdm patterns-openSUSE-rest_cd_kde plasma5-openSUSE

# Codecs
zyper --non-interactive install celt flac libdv speex wavpack k3b-codecs ffmpeg lame phonon-backend-vlc phonon4qt5-backend-vlc vlc-codecs libdvdcss2

# Remove gstreamer
zypper --non-interactive remove phonon-backend-gstreamer phonon4qt5-backend-gstreamer

#####################################################################################
#####################################################################################

#		AUTHENTICATION

#####################################################################################
#####################################################################################

# Give wheel group root rights
sed -i 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/g' /etc/sudoers

# Set insults on after wrong password
printf '\nDefaults env_reset,insults\n' >> /etc/sudoers

# Add user to wheel group
useradd -m -g users -G wheel -s /bin/bash $USER

# Make KDESU authenticate with sudo $USER instead of root
printf '[super-user-command]\nsuper-user-command=sudo' > /etc/skel/.config/kdesurc
printf '[super-user-command]\nsuper-user-command=sudo' > /home/$USER/.config/kdesurc

# Set background for SDDM
printf '\n[General]\nbackground=/usr/share/arch_linux-wallpaper-1920x1080.jpg\n\n' > /usr/share/sddm/themes/breeze/theme.conf.user

#####################################################################################
#####################################################################################

#		INSTALL SOFTWARE

#####################################################################################
#####################################################################################

# Utilities
zypper --non-interactive install git nano whois unetbootin openssh kfind krename

# LaTex
zypper --non-interactive install kile

# Audio
zypper --non-interactive install clementine audacity

# Image
zypper --non-interactive install calligra-krita gimp kdegraphics-thumbnailers

# Video
zypper --non-interactive install blender simplescreenrecorder kdenlive k3b

# Development
zypper --non-interactive install tmux vim geany geany-plugins qt-creator kate

# Development extra
zypper --non-interactive install dia umbrello

# Web
zypper --non-interactive install chromium qbittorrent kmail

# Office
zypper --non-interactive install aspell-nl

# Virtualization
zypper --non-interactive install virtualbox virtualbox-guest-utils

# Financial
zypper --non-interactive install kmymoney

# Games
zypper --non-interactive install supertuxkart

# Other
zypper --non-interactive install kaccounts-providers

#####################################################################################
#####################################################################################

#		SET UP WEBSERVER

#####################################################################################
#####################################################################################

# Set up mysql
zypper --non-interactive install -f mariadb
chown -R mysql:mysql /var/lib/mysql
systemctl start mysql
mysql_secure_installation

# Install phpmyadmin
zypper --non-interactive install phpmyadmin
sed -i -e '1iAlias /phpmyadmin /srv/www/htdocs/phpMyAdmin\' /etc/apache2/conf.d/phpMyAdmin.conf

# Make apache start on boot
systemctl enable apache2

# Enable php module
a2enmod php5

#####################################################################################
#####################################################################################

#		COPY FILES/SETTINGS

#####################################################################################
#####################################################################################

# Settings
cp -r configs/. /home/$USER/.
cp -r configs/. /etc/skel/.

# Wallpaper
cp wallpapers/d5esSs4.jpg /usr/share/arch_linux-wallpaper-1920x1080.jpg

#####################################################################################
#####################################################################################

#		FINISH

#####################################################################################
#####################################################################################

# Clear screen
clear

# Tell user to logout and login
echo 'Please logout and login again for the settings to be applied'