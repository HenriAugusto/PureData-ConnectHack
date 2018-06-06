;Globals for the two XletModes
inletMode := new XletMode("inlet")
outletMode := new XletMode("outlet")

;Class representing an connection mode. It is useful because we can use the same functions to deal with inlets or outlets
;depending on the arguments we pass.
class XletMode
{
    ImgSearch1 := ""
    ImgSearch2 := ""
    ImgSearch3 := ""

    __New(type){
        if(type!="inlet" && type!="outlet"){
            MsgBox, , PD ConnectHack Error!, XletMode: %type% not supported. Only "inlet" and "outlet" are valid
        }
        ;this is also an option
        ;ImgSearch1 = *TransWhite Images\%type%Left.png
        ;this.ImgSearch1 := ImgSearch1
        ;this works!! probably because the parenthesis are evaluated first
        ;this.ImgSearch1 := "*TransWhite Images\"(type)"Left.png" 
        this.ImgSearch1 := "*TransWhite Images\" . type . "Left.png" 
        this.ImgSearch2 := "*TransWhite Images\" . type . "Middle.png"
        this.ImgSearch3 := "*TransWhite Images\" . type . "Right.png"

    }

    debugXletMode(){
        dbg( "debugXletMode()" )
        dbg( this.ImgSearch1 )
        dbg( this.ImgSearch2 )
        dbg( this.ImgSearch3 )
    }
}

;is this ever used?
toMouse := new ConnectionMode("toMouse")
fromMouse := new ConnectionMode("fromMouse")

class ConnectionMode
{
    type := 

    __New( s ){
        if( s = "toMouse"){
            type := s
        } else if (s = "fromMouse") {
            type := s
        } else {
            MsgBox, , Error, Cant initialize connectionMode with %s%
        }
    }
}