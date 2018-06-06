;Auto-execute section
#InstallKeybdHook
#SingleInstance, force
;#Warn, All

SetWorkingDir, PD ConnectHack

Menu, Tray, Icon, Icons\PD ConnectHack Icon.ico, 1, 1
FileInstall, Sounds\Cabassa4.wav, Sounds\Cabassa4.wav
FileInstall, Sounds\Question.wav, Sounds\Question.wav
FileInstall, Icons\PD ConnectHack Icon.ico, Icons\PD ConnectHack Icon.ico
FileInstall, Images\InletLeft.png, Images\InletLeft.png
FileInstall, Images\InletMiddle.png, Images\InletMiddle.png
FileInstall, Images\InletRight.png, Images\InletRight.png
FileInstall, Images\OutletLeft.png, Images\OutletLeft.png
FileInstall, Images\OutletMiddle.png, Images\OutletMiddle.png
FileInstall, Images\OutletRight.png, Images\OutletRight.png




; ========= Initializing Variables ========
suspended := "false"
;mode := "Vanilla"
CustomOutlet := 3
CustomInlet := 7
L2ROriginX := [100]
L2ROriginY := [100]
L2RTargetX := [100]
L2RTargetY := [100]
LeftToRight := [100]

;GuiStuff
#Include ../Shared/scriptCommunication.ahk
#Include OnScreenDisplay.ahk
#Include hotkeyListening.ahk
#include ShellHook.ahk
#Include Gui.ahk

;#Include GoToOutlet.ahk
;#Include GoToInlet.ahk
#Include classBox.ahk
#Include classXlet.ahk
#Include classConnectionMode.ahk
#Include findSelectedObjects.ahk
#Include debugStuff.ahk
#Include connectionFunctions.ahk



TrayTip, PD ConnectHack, ready to work, 1000

return
 ; ========================END OF AUTO EXECUTE=======================================
 ; ========================END OF AUTO EXECUTE=======================================
 ; ========================END OF AUTO EXECUTE=======================================
 ; ========================END OF AUTO EXECUTE=======================================
 ; ========================END OF AUTO EXECUTE=======================================


; http://www.autohotkey.com/board/topic/84152-solved-how-to-change-icon-at-system-tray/
; http://www.autohotkey.com/board/topic/52211-change-tray-icons-of-ahk-file-pause-suspend-an-normal/

#include hotkeys.ahk

;NOTHING UNDER HERE WILL RUN BECAUSE THE HOTKEYS HAVE BEGUN

#include subRoutines.ahk