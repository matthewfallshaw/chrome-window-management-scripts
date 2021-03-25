#@osa-lang:AppleScript
-- restoreChromeWindow(target_url_start, target_title_end, target_tab_name, target_position, target_size, target_url_exclude)

tell (load script POSIX file "/Users/matt/code/chrome-window-management-scripts/Raise in Chrome Library.scpt")
	restoreChromeWindow("https://mail.google.com/mail/u/0/", " - Gmail", "Gmail", {0, 23}, {1111, 873}, "ui=")
	restoreChromeWindow("https://drive.google.com/drive/(?!u/[1-9]/)", " - Google Drive", "Personal Docs", {-1526, -481}, {1190, 1080}, "ui=")
end tell