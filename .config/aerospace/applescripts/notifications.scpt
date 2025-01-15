tell application "System Events" to tell application process "NotificationCenter"
	try
		perform (actions of UI elements of UI element 1 of scroll area 1 of group 1 of group 1 of window "Notification Center" of application process "NotificationCenter" of application "System Events" whose name starts with "Name:Close" or name starts with "Name:Clear All")
	end try
end tell
