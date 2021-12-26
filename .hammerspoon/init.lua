-- AClock = hs.loadSpoon("AClock")
-- AClock:show()
-- Taskwarrior = hs.loadSpoon("Taskwarrior")
-- Taskwarrior:show()
TaskwarriorTwo = hs.loadSpoon("TaskwarriorTwo")
TaskwarriorTwo:show()

WhiteBoard = hs.loadSpoon("Whiteboard")
hs.hotkey.bind({"cmd", "shift", "ctrl"}, "W", function()
	WhiteBoard:toggleShow()
end)

hs.hotkey.bind({"cmd", "shift", "ctrl"}, "P", function()
	WhiteBoard:show_notes_template()
end)

local gtranslate = require "gtranslate/gtranslate"
-- init(APIKEY, source, target, modkeys, hotkey)
gtranslate.init("AIzaSyAiz6P1aHDIr0Dn28jRdfUzXgesUj78Ymg", "en", "es", {"cmd", "alt", "shift"}, 'T') 
