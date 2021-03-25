#@osa-lang:AppleScript
-- from http://www.tuaw.com/2011/03/14/use-applescript-to-open-current-safari-url-in-google-chrome/
-- install FastScripts http://www.red-sweater.com/fastscripts/ and place this AppleScript in the Scripts applications folder for Google Chrome.
-- For me that was ~/Library/Scripts/Applications/Safari
-- You can then assign it a keyboard shortcut. I went with Cmd-Shift-C
property theURL : ""
tell application "Safari"
	set theURL to URL of current tab of window 1
	tell current tab of window 1
		close
	end tell
end tell

tell application "Google Chrome"
	if (count of (every window where visible is true)) is greater than 0 then
		tell front window
			make new tab
		end tell
	else
		make new window
	end if
	set URL of active tab of window 1 to theURL
	activate
end tell