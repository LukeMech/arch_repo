#!/bin/bash
set -e

# Install jq
if ! command -v jq > /dev/null ; then
    echo "jq could not be found, installing..."
    sudo apt update && sudo apt install -y jq
fi

# Check if build.txt exists
if [ ! -f ../build.txt ]; then
    echo "build.txt not found!"
    exit 1
fi

# Copy locally built packages
cp ../../localBuild/*.pkg* . &> /dev/null || true

matrix="{\"include\":["

# Use a subshell to avoid issues with file descriptors
while IFS= read -r package_name || [ -n "$package_name" ]; do

    # Skip empty lines and comments
     if [ -z "${package_name}" ] || [[ $package_name == \#* ]]; then
        continue
    fi
	# Check if tree marks exists in package_name
	if [[ $package_name == *"|"* ]]; then
		# Remove "| " from the line
		package_name=$(echo "$package_name" | tr -d '|')
	fi
	# Check if comment exists in package_name
	if [[ $package_name == *"#"* ]]; then
		# Extract text from the start to the first '#' character
		package_name=$(echo "$package_name" | cut -d '#' -f 1)
	fi
	# Trim start/end whitespaces
    package_name=$(echo "$package_name" | xargs) 
	
    echo "[INFO] Fetching package ${package_name}..."
    # Download current package data
	encoded_package_name=$(curl -s -o /dev/null -w %{url_effective} --get --data-urlencode "arg=${package_name}" "" | cut -d'=' -f2)
	link="https://aur.archlinux.org/rpc/?v=5&type=info&arg=${encoded_package_name}"
    RESPONSE=$(curl -s "$link")
	echo "[INFO] Using $link"
    PACKAGE_VERSION=$(echo ${RESPONSE} | jq -r '.results[0].Version' | tr ':' '-')
    
    # Get latest version info
    if [ "${PACKAGE_VERSION}" == "null" ]; then
        echo "[DEBUG] Package '${package_name}' not found in AUR, skipping build!"
        continue
    else		
		if [[ "${package_name}" == *-git ]]; then
			echo "[INFO] Detected as git package, running additional compare version steps..."
			repo_url=$(echo "${RESPONSE}" | jq -r '.results[0].URL')
			if ! git ls-remote "$repo_url" &> /dev/null; then
				page_content=$(curl -s "https://aur.archlinux.org/packages/${package_name}")
				repo_url=$(echo "$page_content" | grep -oP 'a href="git\+\Khttps://[^"]+')
				# If a repo URL is found, check its validity
				if [ -n "$repo_url" ]; then
					echo "[INFO] Fetched repo URL from AUR page: $repo_url"
					if git ls-remote "$repo_url" &> /dev/null; then
						echo "[INFO] Repo URL is valid."
					else
						echo "[ERROR] Fetched repo URL is not a valid Git repository."
						continue
					fi
				else
					echo "[ERROR] No valid repo URL found on AUR page."
					continue
				fi
			fi
			
			PACKAGE_VERSION=$(git ls-remote "${repo_url}" HEAD | awk '{print $1}')
			PACKAGE_VERSION=$(git rev-parse --short "${PACKAGE_VERSION}")
			
			file_pattern="${package_name}-*${PACKAGE_VERSION}*.pkg*"
			echo "[INFO] Found: ${package_name} - ${PACKAGE_VERSION}"
		else
			echo "[INFO] Found: ${package_name} - ${PACKAGE_VERSION}"

			# Check if package exists in the repo
			file_pattern="${package_name}-${PACKAGE_VERSION}-*.pkg*"
		fi
		
		echo "[INFO] Checking local package: $package_name"
		if ls $file_pattern 1> /dev/null 2>&1 || ls huge/$file_pattern 1> /dev/null 2>&1; then
			echo -e "[DEBUG] Package found with latest version.\n|\n|"
			continue
		else
			echo -e "[DEBUG] Package with this version not found, building!\n|\n|"
			
			# Add package to build queue
			matrix="${matrix}{\"pkg\":\"${package_name}\"},"
		fi
    fi
done < ../build.txt

matrix="${matrix%,}]}"


if echo "$matrix" | jq -e '.include == []' > /dev/null; then
	echo -e "[DEBUG] Everything up-to-date."
    echo "build=false" >> $GITHUB_OUTPUT
else
    echo "build=true" >> $GITHUB_OUTPUT
	echo "matrix=$matrix" >> $GITHUB_OUTPUT
fi


# Display the final matrix for debugging
echo "Final matrix: $matrix"
