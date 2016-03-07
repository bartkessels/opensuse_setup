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

# Virtualbox module
printf 'vboxdrv' > /etc/modules-load.d/virtualbox.conf

# Themes
zypper install gtk3-metatheme-numix gtk3-metatheme-ambiance

# Cursors
zypper install breeze5-cursors

# Icons
zypper install breeze5-icons libreoffice-icon-theme-breeze

# Configuration
zypper install gconf-editor dconf-editor

# Fonts
zypper install bitstream-vera-fonts google-inconsolata-fonts ubuntu-fonts linux-libertine-fonts
ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d
mkfontscale
mkfontdir

# Codecs
zypper install celt flac libdv speex wavpack k3b-codecs ffmpeg lame phonon-backend-vlc phonon4qt5-backend-vlc vlc-codecs gstreamer-0_10-fluendo-mp3 gstreamer-0_10-plugins-ffmpeg gstreamer-0_10-plugins-good

# Increase inotify
printf '# Increase inofity watch limit\nfs.inotify.max_user_watches = 1000000' > /etc/sysctl.d/90-inotify.conf
printf '\n\n# Increase inofity watch limit\nfs.inotify.max_user_watches = 1000000' >> /usr/lib/sysctl.d/50-default.conf

# Aliases
printf '\nalias zf=zf.sh' >> /home/$user_name/.bashrc

# Export paths
printf '\nexport PATH="~/.composer/vendor/bin:$PATH"' >> /home/$user_name/.bashrc
printf '\nexport PATH="./vendor/bin:$PATH"' >> /home/$user_name/.bashrc

# Bookmarks
user_name='bart'
printf 'file:///home/'$user_name'/Documents\nfile:///home/'$user_name'/Music\nfile:///home/'$user_name'/Pictures\nfile:///home/'$user_name'/Videos\nfile:///home/'$user_name'/Downloads\nfile:///home/'$user_name'/bk-cloud\nfile:///srv/www/htdocs' > /home/$user_name/.config/gtk-3.0/bookmarks

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

#####################################################################################
#####################################################################################

#		REMOVE SOFTWARE

#####################################################################################
#####################################################################################

# Remove ssh-askpass
zypper remove openssh-askpass openssh-helpers

#####################################################################################
#####################################################################################

#		INSTALL SOFTWARE

#####################################################################################
#####################################################################################

# Utilities
zypper install git gitg nano whois unetbootin luckybackup

# LaTex
zypper install kile

# Audio
zypper install clementine audacity ardour

# Image
zypper install gimp

# Video
zypper install blender simplescreenrecorder kdenlive

# Development
zypper install tmux vim geany geany-plugins libqt5-creator nodejs-npm java-1_7_0-openjdk-devel

# Install Atom
wget -O atom.rpm https://atom.io/download/rpm
zypper install atom.rpm
rm atom.rpm

# Development extra
zypper install dia umbrello meld

# Web
zypper install chromium qbittorrent filezilla

# Office
zypper install aspell-nl planner libreoffice-l10n-nl okular

# Virtualization
zypper install virtualbox docker

# Financial
zypper install kmymoney

# Games
zypper install supertuxkart supertux2

# Other
zypper install tuxguitar

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
cp wallpapers/background.jpg /usr/share/background.jpg

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
