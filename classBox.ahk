;Class representing an Pure Data box (like object boxes or message boxes)
class Box{
    xPos := 666
    yPos := 666
    inlets := []
    outlets := []

    __New(x, y){
        this.xPos := x
        this.yPos := y
    }

    mouseMoveToFirstInlet(){
        x := this.xPos
        y := this.yPos
        Click, %x%, %y%, 0
    }

    ;Finds every inlete and outlet and stores them into the "inlets" and "outlets" array
    findAndSaveXlets(){
        setDefaultMouseSpeed, 0 ;instantly
        selectDeselectObject( this )
        Loop 
        {
            inlet := this.findAndStoreNthXlet( A_Index , inletMode)
            If (ErrorLevel != 0){
                debugTray("did NOT found inlet`nnumber" . A_Index . "`nError level = " . ErrorLevel, 5000)
                debugSleep(500)
                break
            } Else {
                this.inlets.Push(inlet)
                    x := inlet.xPos
                    y := inlet.yPos
                    Click, %x%, %y%, 0
                debugTray("found inlet" . A_Index, 5000)
                debugSleep(500)
            }
        }
        ErrorLevel = 0
        Loop
        {
            outlet := this.findAndStoreNthXlet( A_Index , outletMode)
            If (ErrorLevel != 0){
                debugTray("did NOT found outlet`nnumber" . A_Index . "`nError level = " . ErrorLevel, 5000)
                debugSleep(500)
                break
            } Else {
                this.outlets.Push(outlet)
                    x := outlet.xPos
                    y := outlet.yPos
                    Click, %x%, %y%, 0
                debugTray("found outlet" . A_Index, 5000)
                debugSleep(500)

            }
        }
        s := ""
        Loop % this.inlets.Length()
        {
            s := s . "this.inlets[" . A_Index . "] = " . this.inlets[A_Index].xPos . ", " . this.inlets[A_Index].yPos . "`n"
        }
        Loop % this.outlets.Length()
        {
            s := s . "this.outlets[" . A_Index . "] = " . this.outlets[A_Index].xPos . ", " . this.outlets[A_Index].yPos . "`n"
        }
        debugTray("s`n" . s, 3000)
        debugSleep(2000)
        selectDeselectObject( this )
        ErrorLevel = 0
        setDefaultMouseSpeed, 2 ;default
    } ;end findAndSaveXlets

    ;Returns the nth inlet or outlet, depending on xletMode
    findAndStoreNthXlet( desiredXletNumber , ByRef xletMode){
        global inletMode  ;just for debugging in str := xletMode = inletMode ? "inlets" : "outlets"
        global outletMode   ;just for debugging in str := xletMode = inletMode ? "inlets" : "outlets"

        str := xletMode = inletMode ? "inlet" : "outlet"
        ;xletMode.debugXletMode()
        currentXletNumber := 1
        ;this could be used to variable stuff to get
        i := 1 ;which image to look?
        ImageSearchOption := xletMode["ImgSearch" . i]
        dbg( "i'm on box (" . this.xPos . ", " . this.yPos . ") looking for the " . str . " number " . desiredXletNumber)
        ;dbg( "-->looking xletMode[ImgSearch . i] = " . xletMode["ImgSearch" . i] )

        ;==========FIND FIRST XLET==========
        ErrorLevel := 0
        xtest := this.xPos -5 ;no need to search the whole screen! let's just search from our position
        ytest := this.yPos -5

        defaultErrorXlet := = new classXlet(20, 03, 1993) ;WTF THIS SINTAX?????????????????????????????????????????????????????????s

        ImageSearch, xletSearchFoundX, xletSearchFoundY, xtest, ytest, A_ScreenWidth, A_ScreenHeight, %ImageSearchOption%
        If (ErrorLevel = 0)
        {
            ;If this is the Xlet we are looking for!
            If ( desiredXletNumber = currentXletNumber){
                xlet := new classXlet(1, xletSearchFoundX, xletSearchFoundY)
                xlet.debugXlet()
                return xlet
            } else {
                ++currentXletNumber
            }
        } else {
            ;If there is no first xlet
            str := xletMode = inletMode ? "inlet" : "outlet"
            debugTray("object doesn't have any " . str, 3000)
            debugSleep( 1000 )
            ErrorLevel := "object doesn't have any " . str
            return defaultErrorXlet
        }

        ;==========FIND MIDDLE inlets==========
        ErrorLevel := 0
        ImageSearchOption := xletMode.ImgSearch2
        Loop,
        {
            ImageSearch, xletSearchFoundX, xletSearchFoundY, xletSearchFoundX, xletSearchFoundY, A_ScreenWidth, A_ScreenHeight, %ImageSearchOption%
            If (ErrorLevel=0)
            {
                ;If this is the Xlet we are looking for!
                If ( desiredXletNumber = currentXletNumber){
                    xlet := new classXlet(1, xletSearchFoundX, xletSearchFoundY)
                    xlet.debugXlet()
                    return xlet
                } else {
                    xletSearchFoundX := xletSearchFoundX+1 ;prevents it from finding the same Xlet over and over.
                    ++currentXletNumber
                }
            } else {
                ;There is no more middle xlets
                break
            }
            
        }

        ;==========FIND RIGHT Xlets==========
        ErrorLevel := 0
        ImageSearchOption := xletMode.ImgSearch3

        ImageSearch, xletSearchFoundX, xletSearchFoundY, xletSearchfoundX, xletSearchfoundY, A_ScreenWidth, A_ScreenHeight, %ImageSearchOption%
        If (ErrorLevel = 0) 
        {
            ;If we finished looking at all the Xlets
            ;and we DID find the right Xlet
            ;but we did NOT find the desired Xlet (ex: we are looking for inlet 7 but there is no inlet 7)
            If ( desiredXletNumber != currentXletNumber){
                str := xletMode = inletMode ? "inlets" : "outlets"
                debugTray("Box does not have " . desiredXletNumber . " " . str, 3000)
                ErrorLevel := Box does not have %desiredXletNumber% %str%
                return defaultErrorXlet
            } else {
                ; IF WE FOUND THE DISIRED XLET
                xlet := new classXlet(1, xletSearchFoundX, xletSearchFoundY)
                xlet.debugXlet()
                return xlet
            }
                
        } else {
            ;If box does NOT have a right Xlet
            ;(ie: it only have one Xlet)
            str := xletMode = inletMode ? "inlets" : "outlets"
            dbg("Box only have one " . str)
            debugTray("Box does not have a right " . desiredXletNumber . " " . str . "`n(ie. it only have 1 " . str . ")", 3000)
            ErrorLevel := "Box does not have a right " . desiredXletNumber . " " . str . "`n(ie. it only have 1 " . str . ")"
            return defaultErrorXlet
        }
        dbg("it should not reach here while finding xlets!!!!!")
        debugTray("it should not reach here while finding xlets!!!!!", 3000)
        debugSleep(10000)
        MsgBox, % "it should not reach here while finding xlets!!!!!"
        xlet := new classXlet(666, 666, 666) 
        return xlet
    } ; end findAndStoreNthXlet()

    getNthXlet(n, xletMode){
        ;why there is no need for
        global inletMode
        global outletMode
        ;????
        If ( xletMode = inletMode){
            If (n > this.inlets.Length() ){
                debugTray( "index out of bounds = " . n .  ".There is only " . this.inlets.Length() . " inlets" ,3000)
                debugSleep(3000)
                ErrorLevel := "index out of bounds = " . n .  ".There is only " . this.inlets.Length() . " inlets"
                return
            }
            return this.inlets[n]
        } else if(xletMode = outletMode) {
            If (n > this.outlets.Length() ){
                debugTray( "index out of bounds = " . n .  ".There is only " . this.outlets.Length() . " outlets" ,3000)
                debugSleep(3000)
                ErrorLevel := "index out of bounds = " . n .  ".There is only " . this.outlets.Length() . " outlets"
                return
            }
            return this.outlets[n]
        } else {
            MsgBox, , Error on Box.getNthXlet, wrong xletMode = [%xletMode%]
        }
    }

    getAllXlets(xletMode){
        ;why there is no need for
        global inletMode
        global outletMode
        ;????
        If ( xletMode = inletMode){
            return this.inlets
        } else if(xletMode = outletMode) {
            return this.outlets
        }
    }

    clickDragEveryOutletDbg(){
        TrayTip, omg, debg click every outlet, 5000
        Loop % this.outlets.Length()
        {
            x := this.outlets[A_index].xPos
            y := this.outlets[A_index].yPos
            Click, %x%, %y%, 0
            Click, Left, , Down
            Sleep, 50
            Click, 666, 666, 0
            Click, Left, , Up
            Sleep, 50
        }
    }

} ;end box