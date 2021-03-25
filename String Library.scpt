#@osa-lang:AppleScript
on stringJoin(theList, theDelimiter)
	set prevTIDs to AppleScript's text item delimiters
	try
		set AppleScript's text item delimiters to theDelimiter
		set theString to theList as string

		set AppleScript's text item delimiters to prevTIDs
		return theString

	on error errStr number errorNumber
		display alert errStr
		set AppleScript's text item delimiters to prevTIDs
	end try
end stringJoin

on reMatch(theText, regex)
	return reExtract(theText, regex, 0) is not ""
end reMatch

on reExtract(theText, regex, capture)
	return do shell script "ruby <<ahz3Yaazah2see
raw_text = <<'voh2veemeecaoZ'
" & theText & "
voh2veemeecaoZ
regex = <<'ouJe4ohgei7kie0zeg4c'
" & regex & "
ouJe4ohgei7kie0zeg4c
capture = <<'aev3NaebuneeKe7Uiph6'
" & capture & "
aev3NaebuneeKe7Uiph6
capture = capture.to_i
puts raw_text.chomp[Regexp.new(regex.chomp), capture]
ahz3Yaazah2see"
end reExtract

on reReplace(theText, regex, replace)
	return do shell script "ruby <<ahz3Yaazah2see
raw_text = <<'voh2veemeecaoZ'
" & theText & "
voh2veemeecaoZ
regex = <<'ouJe4ohgei7kie0zeg4c'
" & regex & "
ouJe4ohgei7kie0zeg4c
replace = <<'zoophie7shahpuXuurai'
" & replace & "
zoophie7shahpuXuurai
puts raw_text.gsub(Regexp.new(regex.chomp), replace.chomp)
ahz3Yaazah2see"
end reReplace
