tell application "Curiota"

	-- snipped in part from DEVONthink Pro extension
	if "{popclip text}" = "" then
		beep
		return
	end if

	set theText to "{popclip text}"
	set theTitle to theText
	if (length of theText) > 70 then
		set theTitle to (characters 1 through 70 of theText as string)
		set oldDelimiters to AppleScript's text item delimiters
		set AppleScript's text item delimiters to " "
		set theTitle to (theTitle & "...") as string
		set AppleScript's text item delimiters to oldDelimiters
	end if


    add note theText with title theTitle

end tell
