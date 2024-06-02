#!/bin/bash
set -euo pipefail

# Enable the multilib repository
cat << EOM >> /etc/pacman.conf
[multilib]
Include = /etc/pacman.d/mirrorlist
EOM

pacman -Syu --noconfirm --needed base-devel jq

# Makepkg does not allow running as root
# Create a new user `builder`
# `builder` needs to have a home directory because some PKGBUILDs will try to
# write to it (e.g. for cache)
useradd builder -m
# When installing dependencies, makepkg will use sudo
# Give user `builder` passwordless sudo access
echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Give all users (particularly builder) full access to these files
chmod -R a+rw .

cd build

# Insert signing cert
# mkdir /home/builder/.gnupg
# cp -r /github/home/.gnupg/* /home/builder/.gnupg
# chown -R builder /home/builder/.gnupg

# Do not build debug packages
sed -i 's/debug/!debug/g' /etc/makepkg.conf

# Sign packages
echo "PACKAGER=\"Luke Skywalker <skywalker.lukemech@gmail.com>\"" >> /etc/makepkg.conf
# echo "GPGKEY=\"145370436A715D37\"" >> /etc/makepkg.conf

# Install dependencies from AUR
# First install yay
pacman -S --noconfirm --needed git
git clone https://aur.archlinux.org/yay-bin.git /tmp/yay
pushd /tmp/yay
chmod -R a+rw . 
chown -R builder .
sudo -H -u builder makepkg --syncdeps --install --noconfirm
popd

# Extract dependencies from .SRCINFO (depends or depends_x86_64) and install
# Check if .SRCINFO exists
if [ -f ".SRCINFO" ]; then
    # Extract dependencies from .SRCINFO
    mapfile -t PKGDEPS < \
        <(sed -n -e 's/^[[:space:]]*\(make\)\?depends\(_x86_64\)\? = \([[:alnum:][:punct:]]*\)[[:space:]]*$/\3/p' .SRCINFO)

    # Install dependencies using yay
    sudo -H -u builder yay --sync --noconfirm "${PKGDEPS[@]}"
else
    echo ".SRCINFO not found. Skipping dependency installation."
fi

# Install additional deps
if [ -f "add.packages" ]; then
	echo "[DEBUG] Installing deps from override..."
	
	while read -r dep; do
		echo "[INFO] Installing ${dep}..."	
	    sudo -H -u builder yay --sync --noconfirm "$dep"
     done < "add.packages"
fi

# Make the builder user the owner of these files
chown -R builder .

# Build packages
sudo -H -u builder makepkg --syncdeps --noconfirm

# Rename package
for file in *.pkg*; do
  new_file=$(echo "$file" | tr ':' '-')
	if [ "${file}" != "${new_file}" ]; then
		mv "$file" "$new_file"
	fi
 done
