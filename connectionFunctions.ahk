ConnectNthXletOfBoxesToFromMouse( boxes, n, ByRef xletMode, mouseX, mouseY ){
    global inletMode  ;those are used in the following case 
    global outletMode ;str := xletMode = inletMode ? "inlets" : "outlets"
    str := xletMode = inletMode ? "inlets" : "outlets"
    dbg( "ConnectNthXletOfBoxesToFromMouse()")
    processXletsOfBoxes( boxes )
    Loop % boxes.Length()
    {   
        ErrorLevel := 0 
        xlet := boxes[A_Index].getNthXlet( n, xletMode) 

        toFrom := xletMode = inletMode ? "from Mouse" : "to Mouse"
        debugTray("connecting box #" . A_Index . "`nConnecting " . str . " " . toFrom, 3000)
        debugSleep(2000)
        
        If (ErrorLevel != 0){
            str := xletMode = inletMode ? "inlets" : "outlets"
            TrayTip, PD ConnectHack Error, object doesn't have %n% %str%. `n%ErrorLevel%, 1000
            Sleep, 1000
            Continue
        }
        if( xletMode = inletMode ) 
        {
            ;goes from mouse to the outlets!
            xi := mouseX
            yi := mouseY
            xf := xlet.xPos
            yf := xlet.yPos
        } else if (xletMode = outletMode) { 
            ;goes from the outlets to the mouse
            xi := xlet.xPos
            yi := xlet.yPos
            xf := mouseX
            yf := mouseY
        } else {
            MsgBox, , Error, wrong xletMode on ConnectNthXletOfBoxesToFromMouse()
            return
        }
        Connect(xi, yi, xf, yf)
        TrayTip, Pd ConnectionHack, Connection done, 1000
    }
}

ConnectAllXletsOfBoxesToFromMouse(boxes, ByRef xletMode, mouseX, mouseY ){
    global inletMode  ;those are used in the following case 
    global outletMode ;str := xletMode = inletMode ? "inlets" : "outlets"
    str := xletMode = inletMode ? "inlet" : "outlet"
    dbg( "ConnectNthXletOfBoxesToFromMouse()")
    processXletsOfBoxes( boxes )
    Loop % boxes.Length()
    {   
        ErrorLevel := 0 
        xlets := boxes[A_Index].getAllXlets(xletMode) 
        debugTray( "connecting all " . str . "s of box #" . A_Index . "`nFound " . xlets.Length() . str . "s",3000)
        debugSleep(2000)
        
        
        Loop % xlets.Length()
        {
            debugTray( "connecting " . str . " #" . A_Index,3000)
            debugSleep(2000)
            xlet := xlets[A_Index]
            if( xletMode = inletMode ) 
            {
                ;goes from mouse to the outlets!
                xi := mouseX
                yi := mouseY
                xf := xlet.xPos
                yf := xlet.yPos
            } else if (xletMode = outletMode) { 
                ;get the objects outlets and goes to the mouse on a inlet
                xi := xlet.xPos
                yi := xlet.yPos
                xf := mouseX
                yf := mouseY
            } else {
                MsgBox, , Error, wrong xletMode on ConnectNthXletOfBoxesToFromMouse()
                return
            }
            Connect(xi, yi, xf, yf)
            TrayTip, Pd ConnectionHack, Connection done, 1000
        }
    }
    TrayTip, Pd ConnectionHack, Connection done, 1000
}

;Calls findAndSaveXlets() on all boxes of the argument array
processXletsOfBoxes(ByRef boxes){
    Loop % boxes.Length()
    {
        debugTray("lets findAndSaveXles on box number " . A_Index, 2000)
        debugSleep( 1000 )
        box := boxes[A_Index]
            box.findAndSaveXlets()
    }
}

;is this used?
Connect( x_i, y_i, x_f, y_f){
    Click, %x_i%, %y_i%, 0
    Click, Left, , Down
    Sleep, 20
    Click, %x_f%, %y_f%, 0
    Sleep, 20
    Click, Left, , Up
}