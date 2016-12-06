#!/bin/bash

# Atom
mkdir -p skel/.atom
cp -r /home/$USER/.atom/config.cson skel/.atom/.
cp -r /home/$USER/.atom/keymap.cson skel/.atom/.
cp -r /home/$USER/.atom/snippets.cson skel/.atom/.

# Config
cp -r /home/$USER/.config skel/.
rm -rf skel/.config/Atom
rm -rf skel/.config/chromium
rm -rf skel/.config/google-chrome

# Gimp
cp -r /home/$USER/.gimp-* skel/.

# KDE
cp -r /home/$USER/.kde* skel/.

# Local
cp -r /home/$USER/.local skel/.

rm -rf skel/.local/share/kwalletd/*
rm -rf skel/.local/share/kwalletd/.*
rm -rf skel/.local/share/keyrings/*
rm -rf skel/.local/share/keyrings/.*
rm -rf skel/.local/share/Trash/files/*
rm -rf skel/.local/share/Trash/files/.*
rm -rf skel/.config/kwalletmanager5rc
rm -rf skel/.config/kwalletrc

# LuckyBackup
cp -r /home/$USER/.luckyBackup skel/.

# LibreOffice
cp -r /home/$USER/.libreoffice-templates skel/.

# Tuxguitar
cp -r /home/$USER/.tuxguitar-* skel/.

# Shell
cp -r /home/$USER/.zshrc skel/.
cp -r /home/$USER/.bashrc skel/.

# Gtk
cp -r /home/$USER/.gtkrc-* skel/.

# Vim
cp -r /home/$USER/.vimrc skel/.

# Offline Imap
cp -r /home/$USER/.offlineimaprc skel/.

clear
printf 'Copying files done!\n'
