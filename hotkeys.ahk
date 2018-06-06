; Ctrl   = ^
; Alt    = !
; Shift  = +
; WinKey = #

; +
; ^ # !

;#IfWinActive, ahk_exe wish85.exe
#If ( WinActive( "ahk_exe wish85.exe") && !listeningToHotkeys )
;#If
{
    ;old receiveApostrophe
    '::  
        receiveApostrophe()
    return
}

#If ( WinActive( "ahk_exe wish85.exe") && listeningToHotkeys )
{
    ;~ to pass through
    ;~'::
    ;stopListening()
    ;return
}

#If listeningToHotkeys
{
    esc::
        stopListening()
    return
}

#If

f7::
    ;SoundPlay, Sounds\Cabassa4.wav
    Sleep, 500
    Reload
;MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing?
;IfMsgBox, Yes, Edit
return

+f8::
    debug := !debug
    TrayTip, PD ConnectHack, debug mode = %debug%, 3000
return

f12::
Suspend,Toggle
If (suspended == "false"){
        Menu, Tray, Icon, Icons\PD ConnectHack Icon Suspended.ico, 1, 1
        suspended := "true"
    } else {
        Menu, Tray, Icon, Icons\PD ConnectHack Icon.ico, 1, 1
        suspended := "false"
    }
return

+f12::
    ExitApp
return

;is this better?
;#If, WinActive("ahk_exe wish85.exe")
;{
    ;f1::Gui, Help:Show
;}

#If, ((WinActive("ahk_exe wish85.exe")) and ((listeningToHotkeys)))
{
    ;listen for shift+N and ctrl+N shortcuts to begin connections
    +1::
    +2::
    +3::
    +4::
    +5::
    +6::
    +7::
    +8::
    +9::
    +0::
    ^1::
    ^2::
    ^3::
    ^4::
    ^5::
    ^6::
    ^7::
    ^8::
    ^9::
    ^0::
        global inletMode
        global outletMode
        ;this parts gets the number used in the hotkey and the modifier
        HotLen := StrLen(A_ThisHotKey)
            dbg( "HotLen " . HotLen . "========================================")
        mod := SubStr(A_ThisHotkey, 1 , 1) ;strings index starts at 1
            dbg( "mod " . mod)
        n := SubStr(A_ThisHotkey, 2 , 1) ;strings index starts at 1
            dbg( "n " . n)
        if( n = 0){
            n := 10
        }
        ; Ctrl   = ^
        ; Alt    = !
        ; Shift  = +
        xletMode := ;not needed
        if ( mod = "^" ){ 
            xletMode := inletMode
        } else if( mod = "+"){ 
            xletMode := outletMode
        } else {
            MsgBox, % "PD ConnectHack Error! check line " . A_LineNumber . "on file " . A_LineFile
        }
        MouseGetPos, mouseX, mouseY ;, OutputVarWin, OutputVarControl, 1|2|3]
        boxes := []
        boxes := findSelectedObjects()
        ConnectNthXletOfBoxesToFromMouse( boxes, n,  xletMode, mouseX, mouseY)
    return

    +a::
    ^a::
        MouseGetPos, mouseX, mouseY ;, OutputVarWin, OutputVarControl, 1|2|3]
        mod := SubStr(A_ThisHotkey, 1 , 1) ;strings index starts at 1
            dbg( "mod " . mod)
        xletMode := ;not needed
        if ( mod = "^" ){ 
            xletMode := inletMode
        } else if( mod = "+"){ 
            xletMode := outletMode
        }
        boxes := []
        boxes := findSelectedObjects()
        ConnectAllXletsOfBoxesToFromMouse( boxes, xletMode, mouseX, mouseY)
    return


    ;+f1:: MsgBox, 0, , Working dir = %A_WorkingDir% `n mode = %mode%
    ;tinha um return aqui

    f1::Gui, Help:Show

    f11::
        InputBox, CustomOutlet, Edit CustomOutlet, Enter CustomOutlet Value, wtf, 250, 125, 200, 200, , , %CustomOutlet%
        InputBox, CustomInlet, Edit CustomOutlet, Enter CustomInlet Value, wtf, 250, 125, 200, 200, , , %CustomInlet%
        Sleep, 25
        GuiControl,Help:, CustomInletGui, Custom Inlet = %CustomInlet%
        GuiControl,Help:, CustomOutletGui, Custom Outlet = %CustomOutlet%
    return

;#Include Left2RightSecondInOut.ahk
;#Include Left2RightFirstInOut.ahk
;#Include Left2RightRightmostInOut.ahk ; aqui que tava a porcaria do GoToInlet() antigo
;#Include Left2RightCustomInOut.ahk



} ;end if win active <==LOOK HERE

#If
{


    f6::
        SoundPlay, Sounds\Cabassa4.wav
        ;MsgBox, % "macarena = " . macarena
        ;xlet.debugXlet()
        ;varname := "xlet"
        InputBox, varname, hehe, i will use this to type x.l.e.t
        MsgBox, % varname . ".xpos = " . %varname%.xPos . "`n" . varname . "yPos = " . %varname%.yPos . "`n" . varname . " = " . %varname%
    return
}