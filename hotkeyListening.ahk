listeningToHotkeys := false

stopListening(){
        global listeningToHotkeys
        listeningToHotkeys := false
        Gui, ListeningWindow:Hide
}

startListening(){
    global listeningToHotkeys
    showListeningForHotkey("PD ConnectHack: listening for hotkeys")
    listeningToHotkeys := true
}