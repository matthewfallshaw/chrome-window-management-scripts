set theURLs to {}

tell application "Google Chrome"
	tell window 1
		repeat with i from 1 to (count of tabs)
			set end of theURLs to URL of tab i
		end repeat
	end tell
end tell

-- Copy the URLs to the clipboard, one per line.
try
	set oldDelims to AppleScript's text item delimiters
	set AppleScript's text item delimiters to (ASCII character 10)
	set URL_list to theURLs as text
	set the clipboard to resub(URL_list, "chrome-extension://[a-z]+/suspended.html#(?:ttl=[A-Za-z0-9%-]+&)?(?:pos=[0-9]+&)?uri=", "")
	set AppleScript's text item delimiters to oldDelims
on error
	set AppleScript's text item delimiters to oldDelims
end try

display notification (the clipboard)

on resub(theText, regex, substitute)
	do shell script "ruby <<ahz3Yaazah2see
raw_text = <<voh2veemeecaoZ
" & theText & "
voh2veemeecaoZ
puts raw_text.gsub(%r{" & regex & "},%Q{" & substitute & "})
ahz3Yaazah2see"
end resub
