FileDelete, dbg.txt
FileDelete, dbg.ini
IniWrite, dbg, dbg.ini, Debug, dbg
FileAppend, box 0(98- 149)`nbox 1(214- 151)`nbox 2(333- 152)`nDEBUG`n, dbg.txt

dbgCounter := 0

debug := false

;Creates a traytip debug = true
debugTray( s , t){
    global debug
    If (debug) {
        TrayTip, Pd ConnectHack Debug, %s%, %t%
    }
}


;Sleeps if debug = true
debugSleep( t ){
    global debug
    If (debug) {
        Sleep, %t%
    }
}

;Writes a string to the dbg.ini file
dbg( s ){
    global dbgCounter
    IniWrite, %s%, dbg.ini, Debug, %dbgCounter%
    ++dbgCounter
}