# Copy all config files
cp -r /home/$USER/.atom configs/.
cp -r /home/$USER/.config configs/.
cp -r /home/$USER/.dia configs/.
cp -r /home/$USER/.gimp-2.8 configs/.
cp -r /home/$USER/.gnome2 configs/.
cp -r /home/$USER/.local configs/.
cp -r /home/$USER/.icons configs/.
cp -r /home/$USER/.mozilla configs/.
cp -r /home/$USER/.themes configs/.
cp -r /home/$USER/.vimrc configs/.

# Remove kwallet content
rm -rf configs/.local/share/keyrings/*

# Remove evolution data
rm -rf configs/.local/share/evolution
rm -rf configs/.config/evolution

# Remove bookmarks
cat /dev/null > configs/.config/gtk-3.0/bookmarks
