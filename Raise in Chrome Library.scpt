#@osa-lang:AppleScript
on raiseChromeTab(target_url_start, target_title_end, target_tab_name, target_url_exclude)
	set {the_window, the_tab, the_window_index, the_tab_index} to findTab(target_url_start, target_title_end, target_tab_name, target_url_exclude)
	if the_window is not false then
		tell application "Google Chrome"
			set (active tab index of the_window) to the_tab_index
			-- set index of the_window to 1
			delay 0.01
			my hsRaise(the_window)
			-- do shell script "open -a Google\\ Chrome"
		end tell
	end if
end raiseChromeTab

on raiseChromeWindow(target_url_start, target_title_end, target_tab_name, target_url_exclude)
	set {the_window, the_window_index} to findWindow(target_url_start, target_title_end, target_tab_name, target_url_exclude)
	if the_window is not false then
		tell application "Google Chrome"
			-- set index of the_window to 1
			delay 0.01
			my hsRaise(the_window)
			-- do shell script "open -a Google\\ Chrome"
		end tell
	end if
end raiseChromeWindow

on restoreChromeWindow(target_url_start, target_title_end, target_tab_name, target_position, target_size, target_url_exclude)
	set {the_window, the_window_index} to findWindow(target_url_start, target_title_end, target_tab_name, target_url_exclude)
	if the_window is not false then
		tell application "System Events" to tell application process "Chrome"
			set position of (window the_window_index) to target_position
			set size of (window the_window_index) to target_size
		end tell
	end if
end restoreChromeWindow


on findTab(target_url_start, target_title_end, target_tab_name, target_url_exclude)
	tell application "Google Chrome"
		repeat with window_index from 1 to (count of windows)
			set tab_index to 0
			repeat with the_tab in (tabs of (window window_index))
				set tab_index to tab_index + 1
				set stringLibrary to load script POSIX file "/Users/matt/code/chrome-window-management-scripts/String Library.scpt"
				if (stringLibrary's reMatch(URL of the_tab, target_url_start)) and (title of the_tab ends with target_title_end) and (URL of the_tab does not contain target_url_exclude) then
					-- use `URL of the_tab contains target_url_start` rather than `starts with` because The Great Suspender may have wrapped the url
					return {window window_index, the_tab, window_index, tab_index}
				end if
			end repeat
		end repeat
		display dialog "Sorry, I couldn't find your " & target_tab_name & " tab (I'm looking for a tab with url: " & target_url_start & ", excluding " & target_url_exclude & " and title: …" & target_title_end & ")" buttons {"OK"} default button "OK" with title "Raise " & target_tab_name & " in Chrome" giving up after 3
		return {false, false, false, false}
	end tell
end findTab
on findWindow(target_url_start, target_title_end, target_tab_name, target_url_exclude)
	set {the_window, the_tab, the_window_index, the_tab_index} to findTab(target_url_start, target_title_end, target_tab_name, target_url_exclude)
	return {the_window, the_window_index}
end findWindow

on hsRaise(the_window)
	tell application "Hammerspoon" to execute lua code ("hs.application.get([[Google Chrome]]):getWindow( [[" & name of the_window as Unicode text) & "]]):focus()"
	-- do shell script "/usr/local/bin/hs -c 'spoon.RestoreWindows.raise(\"Google Chrome\", \"" & name of the_window & "\", hs.geometry.rect(" & script "String Library"'s stringJoin(bounds of the_window, ", ") & "))'"
end hsRaise