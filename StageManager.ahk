
#Persistent
activeWin := ""
settimer, windowWatch, 500
return

windowWatch:
if (activeWin != WinActive("A")) {
    activeWin := WinActive("A")
    SendInput, #{Home}
}