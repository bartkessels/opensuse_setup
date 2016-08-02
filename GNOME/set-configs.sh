# Folders
cp -r /home/$USER/.atom configs/.
cp -r /home/$USER/.config configs/.
cp -r /home/$USER/.composer configs/.
cp -r /home/$USER/.dia configs/.
cp -r /home/$USER/.gimp-2.8 configs/.
cp -r /home/$USER/.gnome configs/.
cp -r /home/$USER/.gnome2 configs/.
cp -r /home/$USER/.icons configs/.
cp -r /home/$USER/.libreoffice-templates configs/.
cp -r /home/$USER/.local configs/.
cp -r /home/$USER/.mozilla configs/.
cp -r /home/$USER/.themes configs/.

# Files
cp -r /home/$USER/.bashrc configs/.
cp -r /home/$USER/.vimrc configs/.
cp -r /home/$USER/.zshrc configs/.

# Remove gnome keyring content
rm -rf configs/.local/share/keyrings/*

# Remove evolution data
rm -rf configs/.local/share/evolution
rm -rf configs/.config/evolution
