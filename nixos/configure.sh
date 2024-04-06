#!/bin/sh

read -p "Hostname: " hostname
read -p "Full username: " fullUsername
read -p "Nickname: " nickname

read -p 'Support for Minecraft server (via docker. also disables sleep on lid close) (true/false): ' enableMcServer
read -p 'Support for Valheim server (via docker. also disables sleep on lid close) (true/false): ' enableValheimServer
read -p 'Bluetooth headphones support (audio sink) (true/false): ' enableBtHeadphones
read -p 'Setup GNOME remote access readiness (open port and disable sleep on lid close) (true/false): ' enableGnomeRemoting
read -p 'Are you using AMD GPU (enable drivers) (true/false): ' amdGpu
read -p 'Is AMD GPU your main GPU (enable kernel module) (true/false): ' amdKernelModule

echo "Saving generated files to /output"

rm -rf output
mkdir output
cp -R ./**/*.nix output/ --parents
cp ./*.nix output/
cd output

sed -i "s/%HOST_NAME%/$hostname/g" ./*.nix
sed -i "s/%HOST_NAME%/$hostname/g" ./**/*.nix

sed -i "s/%FULL_USERNAME%/$fullUsername/g" ./*.nix
sed -i "s/%FULL_USERNAME%/$fullUsername/g" ./**/*.nix

sed -i "s/%USER_NICK%/$nickname/g" ./*.nix
sed -i "s/%USER_NICK%/$nickname/g" ./**/*.nix

if ! [ -z $enableMcServer ] && { [ "${enableMcServer,,}" = "true" ] || [ $enableMcServer = "1" ] || [ "${enableMcServer,,}" = "yes" ]; }; then
  sed -i "s/\"%ENABLE_MC_SERVER%\"/true/g" ./*.nix
  sed -i "s/\"%ENABLE_MC_SERVER%\"/true/g" ./**/*.nix
else
  sed -i "s/\"%ENABLE_MC_SERVER%\"/false/g" ./*.nix
  sed -i "s/\"%ENABLE_MC_SERVER%\"/false/g" ./**/*.nix
fi

if ! [ -z $enableValheimServer ] && { [ "${enableValheimServer,,}" = "true" ] || [ $enableValheimServer = "1" ] || [ "${enableValheimServer,,}" = "yes" ]; }; then
  sed -i "s/\"%ENABLE_VALHEIM_SERVER%\"/true/g" ./*.nix
  sed -i "s/\"%ENABLE_VALHEIM_SERVER%\"/true/g" ./**/*.nix
else
  sed -i "s/\"%ENABLE_VALHEIM_SERVER%\"/false/g" ./*.nix
  sed -i "s/\"%ENABLE_VALHEIM_SERVER%\"/false/g" ./**/*.nix
fi

if ! [ -z $enableBtHeadphones ] && { [ "${enableBtHeadphones,,}" = "true" ] || [ $enableBtHeadphones = "1" ] || [ "${enableBtHeadphones,,}" = "yes" ]; }; then
  sed -i "s/\"%BLUETOOTH_AUDIOSINK_SUPPORT%\"/true/g" ./*.nix
  sed -i "s/\"%BLUETOOTH_AUDIOSINK_SUPPORT%\"/true/g" ./**/*.nix
else
  sed -i "s/\"%BLUETOOTH_AUDIOSINK_SUPPORT%\"/false/g" ./*.nix
  sed -i "s/\"%BLUETOOTH_AUDIOSINK_SUPPORT%\"/false/g" ./**/*.nix
fi

if ! [ -z $enableGnomeRemoting ] && { [ "${enableGnomeRemoting,,}" = "true" ] || [ $enableGnomeRemoting = "1" ] || [ "${enableGnomeRemoting,,}" = "yes" ]; }; then
  sed -i "s/\"%ENABLE_REMOTE_ACCESS%\"/true/g" ./*.nix
  sed -i "s/\"%ENABLE_REMOTE_ACCESS%\"/true/g" ./**/*.nix
else
  sed -i "s/\"%ENABLE_REMOTE_ACCESS%\"/false/g" ./*.nix
  sed -i "s/\"%ENABLE_REMOTE_ACCESS%\"/false/g" ./**/*.nix
fi

if ! [ -z $amdGpu ] && { [ "${amdGpu,,}" = "true" ] || [ $amdGpu = "1" ] || [ "${amdGpu,,}" = "yes" ]; }; then
  sed -i "s/\"%AMD_GPU_SUPPORT%\"/true/g" ./*.nix
  sed -i "s/\"%AMD_GPU_SUPPORT%\"/true/g" ./**/*.nix
else
  sed -i "s/\"%AMD_GPU_SUPPORT%\"/false/g" ./*.nix
  sed -i "s/\"%AMD_GPU_SUPPORT%\"/false/g" ./**/*.nix
fi

if ! [ -z $amdKernelModule ] && { [ "${amdKernelModule,,}" = "true" ] || [ $amdKernelModule = "1" ] || [ "${amdKernelModule,,}" = "yes" ]; }; then
  sed -i "s/\"%USE_AMD_GPU_KERNEL_MODULE%\"/true/g" ./*.nix
  sed -i "s/\"%USE_AMD_GPU_KERNEL_MODULE%\"/true/g" ./**/*.nix
else
  sed -i "s/\"%USE_AMD_GPU_KERNEL_MODULE%\"/false/g" ./*.nix
  sed -i "s/\"%USE_AMD_GPU_KERNEL_MODULE%\"/false/g" ./**/*.nix
fi

echo "Complete."
exit 0
