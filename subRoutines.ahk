showHelpWindow:
    Gui, Help:Show
return

exitRoutine:
    ExitApp
return

reloadRoutine:
    SoundPlay, Sounds\Cabassa4.wav
    Sleep, 500
    Reload
    Sleep 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
    SoundBeep
;MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing?
;IfMsgBox, Yes, Edit
return