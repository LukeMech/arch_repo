#!/bin/bash
set -e

# Check if package argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <package>"
    exit 1
fi

package="$1"

# Install git
if ! command -v git > /dev/null; then
    echo "git could not be found, installing..."
    sudo apt update && sudo apt install git -y
fi

# Install jq
if ! command -v jq > /dev/null ; then
    echo "jq could not be found, installing..."
    sudo apt update && sudo apt install -y jq
fi

echo "=> [INFO] Cloning $package..."
git clone "https://aur.archlinux.org/$package.git" build

json_file="../overrides/${package}.json"
if [ -f $json_file ]; then
     pkgbuild_mode=$(jq -r '.PKGBUILD.mode' "$json_file")
     pkgbuild_content=$(jq -r '.PKGBUILD.content' "$json_file")
     pkgbuild_content="../overrides/${pkgbuild_content}"
     deps=$(jq -r '.DEPS[]' "$json_file")

     if [[ $pkgbuild_mode == "override" ]]; then
         echo "[DEBUG] Overriding PKGBUILD with content from $pkgbuild_content"
	 cat "$pkgbuild_content" > "build/PKGBUILD"
     elif [[ $pkgbuild_mode == "append" ]]; then
         echo "[DEBUG] Appending content from $$pkgbuild_content to PKGBUILD"
         cat "$pkgbuild_content" >> PKGBUILD
     fi

     echo "$deps" > "build/add.packages"
fi
