#!/bin/sh

if [ "$(id -u)" -eq 0 ]; then
	echo "This script should not be run as root."
	exit 1
fi

echo "Saving generated files to /output"

rm -rf output
mkdir output
# cp -R ./**/*.nix output/ --parents # Include this once home-manager split to multiple directories
cp ./*.{nix,lock} output/
cd output

sed -i "s/%USER_NICK%/$USER/g" ./*.nix
# sed -i "s/%USER_NICK%/$nickname/g" ./**/*.nix # Include this once home-manager split to multiple directories

echo "Symlinkg to ~/.config/home-manager"
ln -sfn $PWD $HOME/.config/home-manager

cd ..
read -p 'Create dotconfig symlinks for nvim/, waybar/ and hypr/? (THIS WILL OVERWRITE CURRENT DOTCONFIGS!) (yes/no): ' dotConfigOverrides

if ! [ -z $dotConfigOverrides ] && { [ "${dotConfigOverrides,,}" = "yes" ] || [ $dotConfigOverrides = "1" ] || [ "${dotConfigOverrides,,}" = "y" ]; }; then
  echo "Creating dotconfig symlinks..."
  rm -rf $HOME/.config/waybar
  ln -sfn $PWD/waybar $HOME/.config/waybar
  rm -rf $HOME/.config/hypr
  ln -sfn $PWD/hypr $HOME/.config/hypr
  rm -rf $HOME/.config/nvim
  ln -sfn $PWD/nvim $HOME/.config/nvim
  rm -rf $HOME/.config/rofi
  ln -sfn $PWD/rofi $HOME/.config/rofi
fi

echo "Complete."
exit 0
