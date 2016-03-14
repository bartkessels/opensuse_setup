#####################################################################################
#####################################################################################

#		VARIABELS

#####################################################################################
#####################################################################################

# Username
user_name='bart'

# Full name
full_name=$(getent passwd $user_name | cut -d: -f5 | cut -d, -f1)

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

# Server
zypper addrepo http://download.opensuse.org/repositories/server:/php:/applications/$os_version/ php:applications

#####################################################################################
#####################################################################################

#		DEFAULT FOLDERS

#####################################################################################
#####################################################################################

# Create folders inside home dir
mkdir /home/$user_name/Desktop
mkdir /home/$user_name/Downloads
mkdir /home/$user_name/Documents
mkdir /home/$user_name/Music
mkdir /home/$user_name/Pictures
mkdir /home/$user_name/Videos

# Create folders inside /etc/skel dir
mkdir /etc/skel/Desktop
mkdir /etc/skel/Downloads
mkdir /etc/skel/Documents
mkdir /etc/skel/Music
mkdir /etc/skel/Pictures
mkdir /etc/skel/Videos

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

# Increase inotify
printf '# Increase inofity watch limit\nfs.inotify.max_user_watches = 1000000' > /etc/sysctl.d/90-inotify.conf
printf '\n\n# Increase inofity watch limit\nfs.inotify.max_user_watches = 1000000' >> /usr/lib/sysctl.d/50-default.conf

# Aliases
printf '\nalias zf=zf.sh' >> /home/$user_name/.bashrc

# Export paths
printf '\nexport PATH="~/.composer/vendor/bin:$PATH"' >> /home/$user_name/.bashrc
printf '\nexport PATH="./vendor/bin:$PATH"' >> /home/$user_name/.bashrc

#####################################################################################
#####################################################################################

#		SET UP GIT

#####################################################################################
#####################################################################################

# Ask for e-mail address
echo 'Git e-mail address:'
read git_mail

# Write git config
printf '[user]\nemail='$git_mail'\nname='$full_name'\n[diff]\ntool = meld' > /home/$user_name/.gitconfig

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
zypper remove -u libkdepim

# Akonadi
zypper remove -u akonadi-server

# Openssh askpass
zypper remove -u openssh-askpass

#####################################################################################
#####################################################################################

#		INSTALL SOFTWARE

#####################################################################################
#####################################################################################

# Utilities
zypper install git gitg nano whois unetbootin kfind krename luckybackup

# LaTex
zypper install kile

# Audio
zypper install clementine audacity ardour

# Image
zypper install calligra-krita gimp kdegraphics-thumbnailers

# Video
zypper install blender simplescreenrecorder kdenlive k3b kaffeine

# Development
zypper install tmux vim geany geany-plugins libqt5-creator kate kdevelop5 kdevelop5-plugin-php kdevelop5-pg-qt kuiviewer nodejs-npm kdewebkit-devel java-1_7_0-openjdk-devel

# Install Atom
wget -O atom.rpm https://atom.io/download/rpm
zypper install atom.rpm
rm atom.rpm

# Development extra
zypper install dia umbrello meld mysql-workbench qgit

# Web
zypper install chromium qbittorrent evolution filezilla

# Office
zypper install aspell-nl planner libreoffice-l10n-nl

# Virtualization
zypper install virtualbox docker

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

# Install PHP
zypper install php-ZendFramework php-composer

# Install laravel installer
composer global require --working-dir=/home/$user_name/.composer "laravel/installer"

# Allow url rewriting
sed -i 's|AllowOverride None|AllowOverride All|g' /etc/apache2/default-server.conf
sed -i 's|Options None|Options Indexes FollowSymLinks|g' /etc/apache2/default-server.conf
a2enmod rewrite

# Enable php module
a2enmod php5

# Set PHP display_errors to on
sed -i 's|display_errors = Off|display_errors = On|g' /etc/php5/apache2/php.ini

# Install Rails
zypper install ruby2.1-rubygem-rails-4_2

# Read/write access for users in htdocs
chown -R :users /srv/www/htdocs
chmod 777 /srv/www/htdocs

#####################################################################################
#####################################################################################

#		COPY DOCKER FILES

#####################################################################################
#####################################################################################

# Create docker dir
mkdir -p /home/$user_name/docker-files

# Copy docker files
cp -r dockerfiles/* /home/$user_name/docker-files/.

#####################################################################################
#####################################################################################

#		START SERVICES ON BOOT

#####################################################################################
#####################################################################################

# Apache
systemctl enable apache2

# Mysql
systemctl enable mysql

# Docker
systemctl enable docker

#####################################################################################
#####################################################################################

#		ADD USER TO GROUPS

#####################################################################################
#####################################################################################

# Virtualbox
usermod -a -G vboxusers $user_name

# Docker
usermod -a -G docker $user_name

#####################################################################################
#####################################################################################

#		COPY FILES/SETTINGS

#####################################################################################
#####################################################################################

# Settings
cp -r configs/. /home/$user_name/.
cp -r configs/. /etc/skel/.

# Wallpaper
cp -r wallpapers/. /usr/share

#####################################################################################
#####################################################################################

#		SET FILE PERMISSIONS

#####################################################################################
#####################################################################################

# Home folder
chown $user_name -R /home/$user_name

#####################################################################################
#####################################################################################

#		FINISH

#####################################################################################
#####################################################################################

# Clear screen
clear

# Tell user to logout and login
echo 'Please logout and login again for the settings to be applied'
