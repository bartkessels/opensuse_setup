#!/bin/bash

#####################################################################################
#####################################################################################

#		VARIABELS

#####################################################################################
#####################################################################################

# Username
user_name='bkessels'

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
zypper ar http://download.opensuse.org/repositories/multimedia:/libs/$os_version/ multimedia:libs
zypper ar http://download.opensuse.org/repositories/multimedia:/apps/$os_version/ multimedia:apps

# Graphics
zypper ar http://download.opensuse.org/repositories/graphics/$os_version/ graphics

# Network
zypper ar http://download.opensuse.org/repositories/network/$os_version/ network

# Games
zypper ar http://download.opensuse.org/repositories/games/$os_version/ games
zypper ar http://download.opensuse.org/repositories/games:tools/$os_version/ games:tools

# Packman
zypper ar http://ftp.gwdg.de/pub/linux/misc/packman/suse/$os_version/ Packman-repository

# Education
zypper ar http://download.opensuse.org/repositories/Education/$os_version/ education

# PHP
zypper ar http://download.opensuse.org/repositories/server:/php:/applications/$os_version/ php:applications
zypper ar http://download.opensuse.org/repositories/devel:/languages:/php/$os_version/ php7:applications

# Editors
zypper ar http://download.opensuse.org/repositories/editors/$os_version/ editors

# Virtualization
zypper ar http://download.opensuse.org/repositories/Virtualization/$os_version/ virtualization

# Refresh REPO list
zypper --gpg-auto-import-keys ref

#####################################################################################
#####################################################################################

#		DEFAULT FOLDERS

#####################################################################################
#####################################################################################

# Remove default created folders
rm -r /home/$user_name/bin

# Create folders inside home dir
mkdir -p /home/$user_name/bk-cloud
mkdir -p /home/$user_name/Desktop
mkdir -p /home/$user_name/.development/docker-instances
mkdir -p /home/$user_name/Downloads
# mkdir -p /home/$user_name/Documents
mkdir -p /home/$user_name/Git-projects
# mkdir -p /home/$user_name/Music
# mkdir -p /home/$user_name/Pictures
mkdir -p /home/$user_name/public_html
# mkdir -p /home/$user_name/Videos

# Delete folders
rm -r /home/$user_name/Documents
rm -r /home/$user_name/Music
rm -r /home/$user_name/Pictures
rm -r /home/$user_name/Public
rm -r /home/$user_name/Templates
rm -r /home/$user_name/Videos

# Create folders inside /etc/skel dir
mkdir -p /etc/skel/Desktop
mkdir -p /etc/skel/Downloads
mkdir -p /etc/skel/Documents
mkdir -p /etc/skel/Git-projects
mkdir -p /etc/skel/Music
mkdir -p /etc/skel/Pictures
mkdir -p /etc/skel/public_html
mkdir -p /etc/skel/Videos

#####################################################################################
#####################################################################################

#		CREATE DEFAULT SYMLINKS

#####################################################################################
#####################################################################################

# Default folders
ln -sf /home/$user_name/bk-cloud/Documenten /home/$user_name/Documents
ln -sf /home/$user_name/bk-cloud/Muziek /home/$user_name/Music
ln -sf /home/$user_name/bk-cloud/Afbeeldingen /home/$user_name/Pictures
ln -sf /home/$user_name/bk-cloud/Videos /home/$user_name/Videos

# Other folders
ln -sf /home/$user_name/bk-cloud/Backups /home/$user_name/Backups
ln -sf /home/$user_name/bk-cloud/Boeken /home/$user_name/Books
ln -sf /home/$user_name/bk-cloud/ISOs /home/$user_name/ISOs
ln -sf /home/$user_name/bk-cloud/Notities /home/$user_name/Notes
ln -sf /home/$user_name/bk-cloud/School /home/$user_name/School
ln -sf /home/$user_name/bk-cloud/Software /home/$user_name/Software
ln -sf /home/$user_name/bk-cloud/Tabs /home/$user_name/Tabs
ln -sf /home/$user_name/bk-cloud/Werk /home/$user_name/Work

#####################################################################################
#####################################################################################

#		SETTINGS

#####################################################################################
#####################################################################################

# Virtualbox module
printf 'vboxdrv' > /etc/modules-load.d/virtualbox.conf

# Settings
zypper in dconf-editor

# Fonts
zypper in bitstream-vera-fonts google-inconsolata-fonts ubuntu-fonts linux-libertine-fonts noto-emoji
ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d

# Codecs
zypper in celt flac libdv speex wavpack k3b-codecs ffmpeg lame phonon-backend-vlc phonon4qt5-backend-vlc vlc-codecs libdvdcss2 chromium-ffmpeg

# ZSH
zypper in zsh
usermod -s /bin/zsh $user_name

# Increase inotify
printf '# Increase inofity watch limit\nfs.inotify.max_user_watches = 100000000' > /etc/sysctl.d/90-inotify.conf
printf '\n\n# Increase inofity watch limit\nfs.inotify.max_user_watches = 100000000' >> /usr/lib/sysctl.d/50-default.conf

# Cursors
zypper in breeze5-cursors
sed -i 's|X_MOUSE_CURSOR=".*"|X_MOUSE_CURSOR="breeze_cursors"|g' /etc/sysconfig/windowmanager

#####################################################################################
#####################################################################################

#		SET UP GIT

#####################################################################################
#####################################################################################

# Ask for e-mail address
echo 'Git e-mail address:'
read git_mail

# Write git config
printf "[user]\nemail='$git_mail'\nname='$full_name'\n[diff]\ntool = meld\n[push]\ndefault=simple" > /home/$user_name/.gitconfig

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

#####################################################################################
#####################################################################################

#		INSTALL SOFTWARE

#####################################################################################
#####################################################################################

# Utilities
zypper in git gitg nano whois unetbootin ghostwriter pandoc

# LaTex
zypper in texmaker texlive-crossreference texlive-upquote

# Audio
zypper in audacity ardour calf lv2-calf ladspa clementine easytag nautilus-plugin-easytag

# Image
zypper in inkscape gimp

# Video
zypper in blender simplescreenrecorder dragonplayer

# Development
zypper in vim geany geany-plugins gnome-builder nodejs-npm java-1_7_0-openjdk-devel java-1_8_0-openjdk-devel

# Vim plugins
zypper in vim-plugin-NERDcommenter vim-plugin-NERDtree

# Install Atom
wget -O atom.rpm https://atom.io/download/rpm
zypper in atom.rpm
rm atom.rpm

# Development extra
zypper in dia umbrello meld mysql-workbench sqlitebrowser pencil planner

# Shell
zypper in tmux docker-zsh-completion

# Oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git /home/$user_name/.oh-my-zsh

# Web
zypper in chromium chromium-pepper-flash qbittorrent filezilla

# Office
zypper in aspell-nl libreoffice-l10n-nl

# Virtualization
zypper in virtualbox docker vagrant

# Games
zypper in supertuxkart supertux2 gnome-chess

# Other
zypper in tuxguitar youtube-dl offlineimap

# Password manager
zypper in keepassx

#####################################################################################
#####################################################################################

#		SET UP VAGRANT ENVIRONMENTS

#####################################################################################
#####################################################################################

# Laravel/homestead
sudo su -c 'vagrant box add laravel/homestead' $user_name

#####################################################################################
#####################################################################################

#		SET UP WEBSERVER

#####################################################################################
#####################################################################################

# Set up database
zypper in -f mariadb sqlite3 sqlite3-devel
chown -R mysql:mysql /var/lib/mysql

# Start mysql to make sure the installation can be run
systemctl start mysql
mysql_secure_installation

# Install phpmyadmin
zypper in phpmyadmin
sed -i -e '1iAlias /phpmyadmin /srv/www/htdocs/phpMyAdmin\' /etc/apache2/conf.d/phpMyAdmin.conf

# Install PHP
zypper in php7 php7-fileinfo php5-ZendFramework php-composer

# Install laravel installer
composer global require --working-dir=/home/$user_name/.composer "laravel/installer"
composer global require --working-dir=/home/$user_name/.composer "laravel/lumen-installer"

# Install phpUnit
composer global require --working-dir=/home/$user_name/.composer "phpunit/phpunit"

# Allow url rewriting
sed -i 's|AllowOverride None|AllowOverride All|g' /etc/apache2/default-server.conf
sed -i 's|Options None|Options Indexes FollowSymLinks|g' /etc/apache2/default-server.conf
a2enmod rewrite

# Enable php module
a2enmod php7

# Set PHP display_errors to on
sed -i 's|display_errors = Off|display_errors = On|g' /etc/php5/apache2/php.ini
sed -i 's|display_errors = Off|display_errors = On|g' /etc/php7/apache2/php.ini

# Install Rails
zypper in ruby2.1-rubygem-rails-4_2 ruby2.1-rubygem-json-schema ruby2.1-devel

# Install gems
gem install rails-api rdoc

# Install packages from npm
npm install -g bower typescript grunt-cli

# Read/write access for user in own html folder
ln -s /home/$user_name/public_html /srv/www/htdocs/$user_name

chown -R $user_name /home/$user_name/public_html

#####################################################################################
#####################################################################################

#		SERVICES

#####################################################################################
#####################################################################################

# Enable services
systemctl enable apache2 mysql docker

#####################################################################################
#####################################################################################

#		ADD USER TO GROUPS

#####################################################################################
#####################################################################################

# Virtualbox
usermod -aG vboxusers $user_name

# Docker
usermod -aG docker $user_name

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

#		COPY BINARIES

#####################################################################################
#####################################################################################

# Markdown to PDF
cp bin/md2pdf.sh /usr/bin/md2pdf
chmod +x /usr/bin/md2pdf

# Mail backup
cp bin/mailbackup.sh /usr/bin/mailbackup
chmod +x /usr/bin/mailbackup

#####################################################################################
#####################################################################################

#		SET FILE PERMISSIONS

#####################################################################################
#####################################################################################

# Home folder
chown $user_name:users -R /home/$user_name

#####################################################################################
#####################################################################################

#		FINISH

#####################################################################################
#####################################################################################

# Clear screen
clear

# Tell user everything is done
echo 'Applications are installed and settings are applied! The system will shutdown within 1 minute'

# Shutdown within 1 minute
shutdown -h 1
