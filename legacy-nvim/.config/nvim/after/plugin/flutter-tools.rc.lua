local status, flutterTools = pcall(require, "flutter-tools")
if (not status) then return end

flutterTools.setup {}
