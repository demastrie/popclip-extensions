tell application "Curiota"

	-- snipped in part from DEVONthink Pro extension
	if "{popclip text}" = "" then
		beep
		return
	end if

	set theText to "{popclip text}"
	set theTitle to "{popclip app name}" & " Clip - " & theText

	if (length of theText) > 70 then
		set theTitle to (characters 1 through 70 of theText as string)
		set theTitle to (theTitle & "...") as string
	end if

	--Curiota library removes file path slashes. Might as well substitute
	--with something that retains the semantic.
	try
		set theTitle to my replace_chars(theTitle, "/", "_") as string
		add note theText with title theTitle
		display notification theTitle with title "Curiota Note Added"
	on error error_message number error_number
		set message to error_message & ": " & error_number as string
		display notification message with title "Curiota Popclip Error"
	end try

end tell

-- From http://www.macosxautomation.com/applescript/sbrt/sbrt-06.html
on replace_chars(this_text, search_string, replacement_string)
	set AppleScript's text item delimiters to the search_string
	set the item_list to every text item of this_text
	set AppleScript's text item delimiters to the replacement_string
	set new_text to the item_list as string
	set AppleScript's text item delimiters to ""
	return new_text
end replace_chars