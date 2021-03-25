#@osa-lang:AppleScript
-- from the comments of http://www.tuaw.com/2011/03/14/use-applescript-to-open-current-safari-url-in-google-chrome/
-- install FastScripts http://www.red-sweater.com/fastscripts/ and place this AppleScript in the Scripts applications folder for Google Chrome.
-- For me that was ~/Library/Scripts/Applications/Google Chrome
-- You can then assign it a keyboard shortcut. I went with Cmd-Shift-S
set theURL to missing value
tell application "Google Chrome"
	if (exists window 1) then
		if (URL of active tab of window 1 does not start with "chrome://") then
			set theURL to URL of active tab of window 1
			tell active tab of window 1
				close
			end tell
		end if
	end if
end tell
if theURL is not equal to missing value then
	-- https://discussions.apple.com/thread/2770617?start=15&tstart=0
	tell application "Safari"
		activate
		try
			tell window 1 to set current tab to make new tab
			set URL of document 1 to theURL
		on error
			open location theURL

		end try
	end tell
end if