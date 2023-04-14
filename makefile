run:
	osascript -e 'tell application "System Events"' -e 'tell application "Xcode" to activate' -e 'keystroke "r" using command down' -e 'set visible of process "Xcode" to false' -e 'end tell'
clean:
	osascript -e 'tell application "System Events"' -e 'tell application "Xcode" to activate' -e 'keystroke "k" using {shift down, command down}' -e 'set visible of process "Xcode" to false' -e 'end tell'

