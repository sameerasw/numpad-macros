#Requires AutoHotkey 1.1+
#SingleInstance Force 
#Warn 
Return 

; NUMLOCK ON HOTKEYS
#If GetKeyState("NumLock", "T")
    ;=== shutdown -pwr key
    SC176::Run, SlideToShutDown.exe

; NUMLOCK OFF HOTKEYS
#If !GetKeyState("NumLock", "T")
    ;=== launch or switch to 1
    NumpadEnd::#1
    ;=== launch or switch to 2
    NumpadDown::
        If cabinet_is_active()
            WinMinimize, A
        Else If WinExist("ahk_class CabinetWClass")
            WinActivateBottom, ahk_class CabinetWClass
        Else SendInput, #e
    Return
    ;=== launch or switch to 3
    NumpadPgDn::keywaiting("NumpadPgDn","#b{Enter}","#3")
    ;=== Switch to switch to 4
    NumpadLeft::#4
    ;=== launch or switch to 5
    NumpadClear::#5
    ;=== launch or switch to 6
    NumpadRight::#6
    ;=== launch or switch to 7
    NumpadHome::#7
    ;=== launch or switch to 8
    NumpadUp::#8
    ;=== launch or switch to 9
    NumpadPgUp::#9
    ;=== Notifications
    NumpadEnter::keywaiting("NumpadEnter","#n","{NumpadEnter}")
    ;=== minimize /
    NumpadDiv::
        keywait, NumpadDiv, T0.6
        if Errorlevel
            Winset, Alwaysontop, , A
        Else WinMinimize, A
    Return
    ;=== maximize *
    NumpadMult::
        Keywait, NumpadMult
        SysGet, VirtualScreenWidth, 78
        WinGetPos, X, Y, Width, Height, A
        If (Width < 1920)
            WinMaximize, A
        Else If (Virtualscreenwidth = 1920)
            WinRestore, A
    Return
    ;=== close -
    NumpadSub::
        Keywait, NumpadSub
        If edge_is_active() || cabinet_is_active()
            SendInput, <^w
        Else WinClose, A
    Return
    ;=== Switch tab .
    NumpadDel::keywaiting("NumpadDel","^+{Tab}","^{Tab}")
    ;=== switch windows 0
    NumpadIns::
       SendInput, {Alt Down}{Tab}
       Keywait, NumpadIns
       Send {Alt Up}
    Return
    ;=== new tab/window +
    NumpadAdd::
        If edge_is_active()
            keywaiting("NumpadAdd","{f6}+{Tab}+{Tab}{Enter}","^t")
        Else If cabinet_is_active()
            keywaiting("NumpadAdd","#e","^t")
        Else {
            Keywait, NumpadAdd
            SendInput, #2
        }
    Return
    ;=== ctrl/esc x1
    XButton1::
        keywait, XButton1, T0.4
        if Errorlevel
        {
            Send {Ctrl Down}
            Keywait, XButton1
            Send {Ctrl Up}
        }
        Else If WinActive("WhatsApp Beta") || GetKeyState("MButton", "P")
            SendInput, ^w
        Else If WinActive("ahk_exe Telegram.exe")
            Send {Esc}
        Else Send, {XButton1}
    Return
    ;=== 2xclick x2 + Paste
    XButton2::
        keywait, XButton2, T0.2
        If Errorlevel
            Send #v
        Else Click, 2
    Return
    ;=== System Tray
    AppsKey::
        keywait, AppsKey, T0.4
        If Errorlevel {
            Keywait, AppsKey
            Send #{F2}
        }
        Else If WinActive("ahk_exe Notion.exe")
            Send ^{/}
        Else SendInput, {AppsKey}
    Return
    ;=== OCR
    PrintScreen::keywaiting("PrintScreen","^{PrintScreen}","{PrintScreen}")
    ;=== ScreenRecord
    Pause::SendInput, +{PrintScreen}


; EDGE + NUMLOCK OFF HOTKEYS
#If !GetKeyState("NumLock", "T") && edge_is_active()
    ;=== Tab search + command bar
    F2::keywaiting("F2","^q","^+a")
    ;=== sidebar
    F1::keywaiting("F1","^+e","^+.")
    ;=== dev ops
    F12::keywaiting("F12","^+c","{F12}")


; NUMLOCK + SCROLL LOCK OFF HOTKEYS
#If !GetKeyState("NumLock", "T") && !GetKeyState("ScrollLock", "T")
    SC176::Run, "C:\Program Files\Rainmeter\Rainmeter.exe" !ToggleConfig "Screensaver" "Clock.ini"
;Always reset #if to global when done using it
#If


; ===== Script Functions ===== 
edge_is_active() {
    Return WinActive("ahk_exe msedge.exe")
}

cabinet_is_active() {
    Return WinActive("ahk_class CabinetWClass")
}

keywaiting(key,shortcut1,shortcut2) {
    keywait, %key%, T0.4
    if Errorlevel
    {
        KeyWait, %key%
        SendInput, %shortcut1%
    }
    Else SendInput, %shortcut2%
}