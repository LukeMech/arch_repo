#!/bin/bash
set -e

files_found=$(find /artifacts -type f -name "*.pkg*" 2>/dev/null)

if [[ -n "$files_found" ]]; then
	for pkg in /artifacts/**/*.pkg*; do
		if [[ "${pkg}" == *".sig"* ]]; then
			# Ignore files ending with .sig
			continue
		fi
		
		# Extract the package name by removing the version and architecture part.
		pkg_name=$(pacman -Qip "${pkg}" | grep -Po '^Name\s*: \K.+')
		pkg_version=$(pacman -Qip "${pkg}" | grep -Po '^Version\s*: \K.+')
		pkg_file=$(basename "${pkg}")
		
		echo "[INFO] Moving ${pkg_file}..."
		mv "${pkg}" .
		
		echo "[INFO] Signing ${pkg_file}..."
		# Create a detached signature.
		gpg --use-agent --batch --yes --output ./"${pkg_file}.sig" --detach-sig ./"${pkg_file}"


		FILESIZE=$(stat -c%s "$pkg_file")
        echo "[INFO] File size is $FILESIZE bytes."
		if [ $FILESIZE -gt $((80 * 1024 * 1024)) ]; then
			# Filesize > 80mb
			mkdir -p ./huge/tmp >> /dev/null || true
			echo "[INFO] Moving to huge repository..."
			mv "${pkg_file}"* ./huge/tmp
			cd huge/tmp
			echo "[INFO] Removing old version..."
			rm -rf ../${pkg_name}-[0-9r]*
			rm -rf ../${pkg_name}.txt
			echo "[DEBUG] Splitting ${pkg_file}..."
			split -b 80M "${pkg_file}" "${pkg_file}"
			rm -rf "${pkg_file}"
			echo "filename: ${pkg_file}" >>  "${pkg_name}.txt"
			echo "version: ${pkg_version}" >>  "${pkg_name}.txt"
			for s_file in ./*.pkg*; do
				echo "${s_file}" >>  "${pkg_name}.txt"
			done
			mv ./* ../
			cd ../..
			
		else
			# Filesize < 80mb
			echo "[DEBUG] Adding ${pkg_file} to repository..."
			repo-add  -v -R -s lukemech.db.tar.gz ./"${pkg_file}" &> /dev/null
		fi

	done
	
	
	echo "[INFO] Removing localBuild..."
	rm -rf ../../localBuild/*.pkg*
	
	echo "[INFO] All packages have been processed."
else
	echo "[INFO] Skipping..."
fi
