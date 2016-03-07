# Copy all config files
cp -r /home/$USER/.atom configs/.
cp -r /home/$USER/.config configs/.
cp -r /home/$USER/.composer configs/.
cp -r /home/$USER/.dia configs/.
cp -r /home/$USER/.gimp-2.8 configs/.
cp -r /home/$USER/.kde4 configs/.
cp -r /home/$USER/.local configs/.
cp -r /home/$USER/.icons configs/.
cp -r /home/$USER/.mozilla configs/.
cp -r /home/$USER/.gtkrc-2.0 configs/.
cp -r /home/$USER/.gtkrc-2.0-kde4 configs/.
cp -r /home/$USER/.vimrc configs/.

# Remove kwallet content
rm -rf configs/.local/share/kwalletd/*

# Remove evolution data
rm -rf configs/.local/share/evolution
rm -rf configs/.config/evolution
