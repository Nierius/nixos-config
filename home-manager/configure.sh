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

echo "Complete."
exit 0
