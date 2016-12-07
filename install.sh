#!/bin/bash

#####################################################################################
#####################################################################################

#		VARIABLES

#####################################################################################
#####################################################################################

os_version='openSUSE_Leap_42.2'

# Git email address
echo 'Git e-mail address:'
read git_mail

# Name
user_name='bkessels'
full_name=$(getent passwd $user_name | cut -d: -f5 | cut -d, -f1)

# Folder
home='/home/'$user_name
sync_folder=$home/'bk-cloud'

# Export for apm package installation
export USER=$user_name
export HOME=$home

#####################################################################################
#####################################################################################

#		Repositories

#####################################################################################
#####################################################################################

# Development
zypper ar http://download.opensuse.org/repositories/server:/database/$os_version/ Database
zypper ar http://download.opensuse.org/repositories/editors/$os_version/ Editors
zypper ar http://download.opensuse.org/repositories/server:/php:/applications/$os_version/ php:applications
zypper ar http://download.opensuse.org/repositories/devel:/languages:/php/$os_version/ php7:applications

# Display Server
zypper ar http://download.opensuse.org/repositories/X11:/Utilities/$os_version/ X11:Utils

# Education
zypper ar http://download.opensuse.org/repositories/Education/$os_version/ Education

# Multimedia
zypper ar http://ftp.gwdg.de/pub/linux/packman/suse/$os_version/ Packman
zypper ar http://opensuse-guide.org/repo/$os_version/ libdvdcss
zypper ar http://download.opensuse.org/repositories/multimedia:/apps/$os_version/ Multimedia:apps
zypper ar http://download.opensuse.org/repositories/multimedia:/libs/$os_version/ Multimedia:libs

# Other
zypper ar http://download.opensuse.org/repositories/KDE:/Extra/$os_version/ KDE:Extra
zypper ar http://download.opensuse.org/repositories/graphics/$os_version/ Graphics

zypper --gpg-auto-import-keys ref

#####################################################################################
#####################################################################################

#		FOLDERS

#####################################################################################
#####################################################################################

rmdir $home/bin
rmdir $home/Documents
rmdir $home/Downloads
rmdir $home/Music
rmdir $home/Pictures
rmdir $home/Public
rmdir $home/Videos

mkdir $sync_folder
mkdir $home/Git-projects
mkdir $home/public_html

ln -sf $sync_folder/Documenten $home/Documents
ln -sf $sync_folder/Muziek $home/Music
ln -sf $sync_folder/Afbeeldingen $home/Pictures
ln -sf $sync_folder/Videos $home/Videos
ln -sf $sync_folder/Backups $home/Backups
ln -sf $sync_folder/Boeken $home/Books
ln -sf $sync_folder/ISOs $home/ISOs
ln -sf $sync_folder/Notities $home/Notes
ln -sf $sync_folder/School $home/School
ln -sf $sync_folder/Software $home/Software
ln -sf $sync_folder/Tabs $home/Tabs
ln -sf $sync_folder/Werk $home/Work

#####################################################################################
#####################################################################################

#		SETTINGS

#####################################################################################
#####################################################################################

# SDDM
printf '\n\n[General]\nNumlock=on\n' >> /etc/sddm.conf
printf '\n[General]\nbackground=/usr/share/wallpaper.png\n\n' > /usr/share/sddm/themes/breeze-openSUSE/theme.conf.user
printf '\n[General]\nbackground=/usr/share/wallpaper.png\n\n' > /usr/share/sddm/themes/breeze-openSUSE/theme.conf

# virtualbox
printf 'vboxdrv' > /etc/modules-load.d/virtualbox.conf

# Shell
zypper in -y zsh docker-zsh-completion
git clone https://github.com/robbyrussell/oh-my-zsh.git /home/$user_name/.oh-my-zsh
usermod -s /bin/zsh $user_name

# Dolphin plugins
zypper in -y dolphin-plugins

# Codecs
zypper in -y vlc-codecs ffmpeg lame libmpeg3-utils gstreamer-fluendo-mp3

# Fonts
zypper in -y bitstream-vera-fonts google-inconsolata-fonts ubuntu-fonts linux-libertine-fonts noto-emoji
ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d

# Inotify
printf '# Increase inofity watch limit\nfs.inotify.max_user_watches = 1000000' > /etc/sysctl.d/90-inotify.conf
printf '\n\n# Increase inofity watch limit\nfs.inotify.max_user_watches = 1000000' >> /usr/lib/sysctl.d/50-default.conf

# Git
printf "[user]\nemail='$git_mail'\nname='$full_name'\n[diff]\ntool = meld\n[push]\ndefault=simple" > /home/$user_name/.gitconfig

# Sudoers
printf '\nDefaults env_reset,insults\n' >> /etc/sudoers

#####################################################################################
#####################################################################################

#		SOFTWARE

#####################################################################################
#####################################################################################

# Utils GUI / CLI
zypper in -y krdc ghostwriter luckybackup yakuake partitionmanager
zypper in -y whois pandoc nmap offlineimap

# LaTeX Editors / Packages
zypper in -y kile
zypper in -y texlive-crossreference texlive-upquote texlive-sourcesanspro

# Audio Editors / Players
zypper in -y ardour
zypper in -y amarok

# Video Editors / Recorders / Players / Other
zypper in -y kdenlive blender
zypper in -y simplescreenrecorder
zypper in -y vlc
zypper in -y k3b

# Image Editors
zypper in -y gimp krita

# Development Editors / DB / Other / SDKs / Atom / Atom Packages
zypper in -y vim nano kate
zypper in -y mysql-workbench sqlitebrowser
zypper in -y umbrello pencil dia meld
zypper in -y java-1_7_0-openjdk-devel java-1_8_0-openjdk-devel

wget https://atom.io/download/rpm -O atom.rpm
zypper in atom.rpm
rm atom.rpm

apm install atom-material-ui atom-material-syntax file-icons language-blade blade-snippets minimap

# Web / Google Chrome
zypper in -y filezilla qbittorrent
zypper in -y chromium qupzilla youtube-dl

rpm --import https://dl-ssl.google.com/linux/linux_signing_key.pub
zypper in -y https://dl.google.com/linux/direct/google-chrome-stable_current_$(uname -i).rpm

# Virtualization
zypper in -y virtualbox

# Password Managers / Other
zypper in -y keepassx
zypper in -y ksshaskpass5

# Other
zypper in -y tuxguitar

# Office
zypper in -y aspell-nl ispell-dutch myspell-nl_NL

# Development
zypper in -y git-cola

#####################################################################################
#####################################################################################

#		SET UP WEBSERVER

#####################################################################################
#####################################################################################

# Set up database
zypper in -f mariadb sqlite3 sqlite3-devel
chown -R mysql:mysql /var/lib/mysql

systemctl start mysql

mysqladmin -u root password "root"
mysql -u root -p"root" -e "UPDATE mysql.user SET Password=PASSWORD('root') WHERE User='root'"
mysql -u root -p"root" -e "DELETE FROM mysql.user WHERE user='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1')"
mysql -u root -p"root" -e "DELETE FROM mysql.user WHERE User=''"
mysql -u root -p"root" -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%'"
mysql -u root -p"root" -e "FLUSH PRIVILEGES"

# Install phpmyadmin
zypper in phpmyadmin
sed -i -e '1iAlias /phpmyadmin /srv/www/htdocs/phpMyAdmin\' /etc/apache2/conf.d/phpMyAdmin.conf

# Install PHP
zypper in php7 php7-fileinfo php5-ZendFramework php-composer

# Install laravel installer
composer global require --working-dir=/home/$user_name/.composer "laravel/installer"
composer global require --working-dir=/home/$user_name/.composer "laravel/lumen-installer"

# Allow url rewriting
sed -i 's|AllowOverride None|AllowOverride All|g' /etc/apache2/default-server.conf
sed -i 's|Options None|Options Indexes FollowSymLinks|g' /etc/apache2/default-server.conf
a2enmod rewrite

# Enable php module
a2enmod php7

# Set PHP display_errors to on
sed -i 's|display_errors = Off|display_errors = On|g' /etc/php5/apache2/php.ini
sed -i 's|display_errors = Off|display_errors = On|g' /etc/php7/apache2/php.ini

# Read/write access for user in own html folder
ln -s /home/$user_name/public_html /srv/www/htdocs/$user_name

chown -R $user_name /home/$user_name/public_html

#####################################################################################
#####################################################################################

#		SERVICES

#####################################################################################
#####################################################################################

# Enable services
systemctl enable apache2 mysql

#####################################################################################
#####################################################################################

#		GROUPS

#####################################################################################
#####################################################################################

usermod -aG vboxusers $user_name

#####################################################################################
#####################################################################################

#		FILES

#####################################################################################
#####################################################################################

# Settings
cp -r skel/. $home/.
cp -r skel/. /etc/skel/.

# Wallpapers
cp -r wallpapers/. /usr/share/.

chown -R $user_name:users $home

#####################################################################################
#####################################################################################

#		BINARIES

#####################################################################################
#####################################################################################

# Markdown to PDF
cp scripts/md2pdf.sh /usr/bin/md2pdf
chmod +x /usr/bin/md2pdf

# Mail backup
cp scripts/mailbackup.sh /usr/bin/mailbackup
chmod +x /usr/bin/mailbackup

#####################################################################################
#####################################################################################

#		FINISH

#####################################################################################
#####################################################################################

clear

echo 'Your computer is set up! The system will reboot within one minute...'

shutdown -r +1
