#@osa-lang:AppleScript
-- raiseChromeWindow(target_url_start, target_title_end, target_tab_name, target_url_exclude)
tell (load script POSIX file "/Users/matt/code/chrome-window-management-scripts/Raise in Chrome Library.scpt") to raiseChromeWindow("https://drive.google.com/drive/(?!u/[1-9]/)", " - Google Drive", "Personal Docs", "")
