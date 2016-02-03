#####################################################################################
#####################################################################################

#		VARIABELS

#####################################################################################
#####################################################################################

# Username
user_name='bart'

# OpenSUSE version
os_version='openSUSE_Leap_42.1'

#####################################################################################
#####################################################################################

#		REPOSITORIES

#####################################################################################
#####################################################################################

# Multimedia
zypper addrepo http://download.opensuse.org/repositories/multimedia:/libs/$os_version/ multimedia:libs
zypper addrepo http://download.opensuse.org/repositories/multimedia:/apps/$os_version/ multimedia:apps

# Network
zypper addrepo http://download.opensuse.org/repositories/network/$os_version/ network

# Games
zypper addrepo http://download.opensuse.org/repositories/games/$os_version/ games
zypper addrepo http://download.opensuse.org/repositories/games:tools/$os_version/ games:tools

# Packman
zypper addrepo http://packman.inode.at/suse/$os_version/ packman

# Education
zypper addrepo http://download.opensuse.org/repositories/Education/$os_version/ education

# KDE:Extra
zypper addrepo http://download.opensuse.org/repositories/KDE:/Extra/$os_version/ KDE:extra

#####################################################################################
#####################################################################################

#		SETTINGS

#####################################################################################
#####################################################################################

# Boot with numlock
printf '\n\n[General]\nNumlock=on\n' >> /etc/sddm.conf

# Set background for SDDM
printf '\n[General]\nbackground=/usr/share/arch_linux-wallpaper-1920x1080.jpg\n\n' > /usr/share/sddm/themes/breeze/theme.conf.user

# Virtualbox module
printf 'vboxdrv' > /etc/modules-load.d/virtualbox.conf

# Fonts
zypper install bitstream-vera-fonts google-inconsolata-fonts ubuntu-fonts linux-libertine-fonts
ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d
mkfontscale
mkfontdir

# Settings
zypper install kwayland-integration kwrited5 plasma5-workspace-wallpapers kdeclarative-tools krandr libKF5Screen6-32bit plasma5-workspace-libs-32bit kdm patterns-openSUSE-rest_cd_kde plasma5-openSUSE gnome-control-center kcm_systemd

# Codecs
zypper install celt flac libdv speex wavpack k3b-codecs ffmpeg lame phonon-backend-vlc phonon4qt5-backend-vlc vlc-codecs libdvdcss2

# Remove gstreamer
zypper remove phonon-backend-gstreamer phonon4qt5-backend-gstreamer

# Use kdesu instead of ROOT user
printf '[super-user-command]\nsuper-user-command=sudo' > /home/$user_name/.config/kdesurc
chown $user_name /home/$user_name/.config/kdesurc

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
usermod -a -G wheel $user_name

# Make KDESU authenticate with sudo $USER instead of root
printf '[super-user-command]\nsuper-user-command=sudo' > /etc/skel/.config/kdesurc
printf '[super-user-command]\nsuper-user-command=sudo' > /home/$user_name/.config/kdesurc

#####################################################################################
#####################################################################################

#		REMOVE SOFTWARE

#####################################################################################
#####################################################################################

# KDE PIM suite
zypper remove -U libkdepim

#####################################################################################
#####################################################################################

#		INSTALL SOFTWARE

#####################################################################################
#####################################################################################

# Utilities
zypper install git nano whois unetbootin openssh kfind krename luckybackup

# LaTex
zypper install kile

# Audio
zypper install clementine audacity ardour

# Image
zypper install calligra-krita gimp kdegraphics-thumbnailers

# Video
zypper install blender simplescreenrecorder kdenlive k3b kaffeine

# Development
zypper install tmux vim geany geany-plugins libqt5-creator kate kdevelop5 kdevelop5-plugin-php kdevelop5-pg-qt kuiviewer 

# Development extra
zypper install dia umbrello

# Web
zypper install chromium qbittorrent evolution filezilla

# Office
zypper install aspell-nl planner libreoffice-l10n-nl

# Virtualization
zypper install virtualbox

# Financial
zypper install kmymoney

# Games
zypper install supertuxkart supertux2

# Other
zypper install kaccounts-providers tuxguitar

#####################################################################################
#####################################################################################

#		SET UP WEBSERVER

#####################################################################################
#####################################################################################

# Set up mysql
zypper install -f mariadb
chown -R mysql:mysql /var/lib/mysql

# Start mysql to make sure the installation can be run
systemctl start mysql
mysql_secure_installation

# Install phpmyadmin
zypper install phpmyadmin
sed -i -e '1iAlias /phpmyadmin /srv/www/htdocs/phpMyAdmin\' /etc/apache2/conf.d/phpMyAdmin.conf

# Enable php module
a2enmod php5

# Set PHP display_errors to on
sed -i 's|display_errors = Off|display_errors = On|g' /etc/php5/apache2/php.ini

# Start services on boot
systemctl enable apache2
systemctl enable mysql

# Read/write access for users in htdocs
chown -R :users /srv/www/htdocs
chmod 777 /srv/www/htdocs

#####################################################################################
#####################################################################################

#		ADD USER TO GROUPS

#####################################################################################
#####################################################################################

# Virtualbox
usermod -a -G vboxusers $user_name

#####################################################################################
#####################################################################################

#		COPY FILES/SETTINGS

#####################################################################################
#####################################################################################

# Settings
cp -r configs/. /home/$user_name/.
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