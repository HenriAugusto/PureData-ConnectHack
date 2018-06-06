;w400 is normal font wieght
;w600 or w700 is bold

;Traytip Stuff
Menu, Tray, NoStandard
Menu,Tray, Add, Help, showHelpWindow
Menu,Tray, Add, reload, reloadRoutine
Menu,Tray, Add, Exit, exitRoutine
Menu,Tray, Default, Help

;HelpWindowStuff
Gui, Help:New, +Resize +MinSize200x200
Gui, Help:Font, S14 CDefault, Verdana

Gui, Help:Add, Text, x12 y10 w400 h30 , PD ConnectHack - Help

Gui, Help:Font, S13 CDefault, Verdana
Gui, Help:Add, Text, , Hotkeys
;Gui, Help:Add, Text, x12 y50 w250 h60 , Hotkeys

Gui, Help:Font, S10 w600 CDefault, Verdana

Gui, Help:Add, Text, , Press ' (apostrophe) to make PD ConnectHack listen to the hotkeys below`nall hotkeys only works when a pd window is active

Gui, Help:Font, S8 w400 CDefault, Verdana
Gui, Help:Add, Text, , shift+[n] => Connects the n-th outlet of every selected object to the mouse position
Gui, Help:Add, Text,  , ctrl+[n] => Connects the mouse position to the n-th inlet of every selected object
Gui, Help:Add, Text,  , shift/ctrl+a => same as above but do the connections for [a]ll inlets/outlets

Gui, Help:Add, Text,  , Think of shift/ctrl as in which part of the object you are holding your mouse.`nShift is higher than ctrl so use it if you mouse is over an inlet (ie it is the destination of the connections)`nCtrl is lower than shift so use it if you mouse is over an outlet (ie it is the source of the connections)
;Gui, Help:Add, Text, , Shift is higher than ctrl so use it if you mouse is over an inlet (ie it is the destination of the connections)
;Gui, Help:Add, Text, , Ctrl is lower than shift so use it if you mouse is over an outlet (ie it is the source of the connections)

Gui, Help:Font, S8 CDefault, Verdana
Gui, Help:Add, Text,  , F1 = this help window
Gui, Help:Add, Text,  , F7 = Reloads PD ConnectHack. (Try this if you find any bugs)
Gui, Help:Add, Text,  , Shift+F8 = toggle debug mode
Gui, Help:Add, Text, , Shift+F12 = Exits app.
Gui, Help:Font, S12 CDefault, Verdana
Gui, Help:Add, Text, , Created by Henri Augusto