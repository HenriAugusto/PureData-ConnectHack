;Returns an array containing every selected object
;Also deselects all of them
findSelectedObjects(){
    index=1
    findSelectedObjects := []
    Loop
    {
        CoordMode, Pixel, Window
        ImageSearch, findSelectedObjectsFoundX, findSelectedObjectsFoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *TransWhite Images\InletLeft.png
        If ErrorLevel = 0 
        {
            findSelectedObjectsFoundX := findSelectedObjectsFoundX +1 ;pq +1 e +2?
            findSelectedObjectsFoundY := findSelectedObjectsFoundY +2
            box := new Box(findSelectedObjectsFoundX, findSelectedObjectsFoundY)
                dbg( "box " . index . "(" . findSelectedObjectsFoundX . ", " . findSelectedObjectsFoundY . ")")
            findSelectedObjects[index] := box
            selectDeselectObject(box)
            ;SoundPlay, Sounds\Cabassa4.wav
            Sleep, 10
        } else {
            break
        }
        ++index
    } ; end do loop
    findSelectedObjectslen := findSelectedObjects.MaxIndex()+1
    ;dbg( "findSelectedObjects LENGHT inside findSelectedObjects() " . len )
    return findSelectedObjects
}

;selects or deselects an object by clicking it's position
selectDeselectObject( objBox ){
    ;%objBox%.mouseMove()
    objBox.mouseMoveToFirstInlet()
    Send, {Shift Down}
    Sleep, 2
    Click
    Sleep, 2
    Send, {Shift Up}
}