;we name it classXlet because every class creates a superGlobal name that is overridable.
;if it was class Xlet any variable called xlet would overide this class locally!
;see: 
;https://autohotkey.com/boards/viewtopic.php?f=14&t=31644
class classXlet
{
    index := 616263
    xPos := 616263
    yPos := 616263

    __New(i, x, y)
    {
        this.index := i
        this.xPos := x
        this.yPos := y
    }

    debugXlet(){
        dbg( "----->xlet(" . this.xPos . ", " . this.yPos . ")")
    }
}