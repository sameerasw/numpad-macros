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

    F1::
        If edge_is_active()
            WinMinimize, A
        Else SendInput, #1
    Return
    F2::
        If cabinet_is_active()
            WinMinimize, A
        Else SendInput, #2
    Return
    F3::#3
    F4::#4

    F6::#6
    F7::#7
    F8::
        keywait, F8, T0.6
        if Errorlevel {
            keywait, F8
            SendInput, #8
        }
        Else SendInput, {Media_Play_Pause}
    Return

    F9::
        keywait, F9, T0.6
        if Errorlevel {
            keywait, F9
            SendInput, {NumLock}
        }
        Else 
            SendInput, ^{Tab}
    Return

    F10::
        If edge_is_active()
            keywaiting("NumpadAdd","{f6}+{Tab}+{Tab}{Enter}","^t")
        Else If cabinet_is_active()
            keywaiting("NumpadAdd","#e","^t")
        Else {
            Keywait, NumpadAdd
            SendInput, #2
        }
    Return
    F11::
        keywait, F11, T0.6
        if Errorlevel
            Winset, Alwaysontop, , A
        Else WinMinimize, A
    Return
    F12::
        Keywait, F12
        If edge_is_active() || cabinet_is_active()
            SendInput, <^w
        Else WinClose, A
    Return

    #F1::SendInput, {F1}
    #F2::SendInput, {F2}
    #F3::SendInput, {F3}
    #F4::SendInput, {F4}

    #F6::SendInput, {F6}
    #F7::SendInput, {F7}
    #F8::SendInput, {F8}
    #F9::SendInput, {F9}
    #F10::SendInput, {F10}
    #F11::SendInput, {F11}
    #F12::SendInput, {F12}

    Browser_Home::SendInput, {PrintScreen}
    ^Browser_Home::SendInput !#9
    !Browser_Home::SendInput, !{PrintScreen}

    Browser_Back::SendInput, +{PrintScreen}

    RAlt::
       SendInput, {Alt Down}{Tab}
       Keywait, RAlt
       Send {Alt Up}
    Return

    Launch_Mail::SendInput, {F2}

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
    NumpadPgDn::#3
    ;=== Switch to switch to 4
    NumpadLeft::#4
    ;=== launch or switch to 5
    NumpadClear::#5
    ;=== launch or switch to 6
    NumpadRight::#6
    ;=== ;
    NumpadUp::;
    ;=== :
    NumpadHome:::
    ^NumpadHome::SendInput {Home}
    ;=== launch or switch to Terminal
    !Space::SendInput #+{Right}

    ;=== GIT
    +F1::terminal_active("git status{Enter}")
    +F2::terminal_active("git add .{Enter}")
    +F3::terminal_active("git commit -m ''{Left}")
    +F4::terminal_active("git push{Enter}")

;Text replacements
    ::|mon::Monday
    ::|tue::Tuesday
    ::|wed::Wednesday
    ::|thu::Thursday
    ::|fri::Friday
    ::|sat::Saturday
    ::|sun::Sunday
    ::|jan::January
    ::|feb::February
    ::|mar::March
    ::|apr::April
    ::|may::May
    ::|jun::June
    ::|jul::July
    ::|aug::August
    ::|sep::September
    ::|oct::October
    ::|nov::November
    ::|dec::December
    ::|netlify::https://sameerasw.netlify.app/
    ::|github::https://github.com/sameerasw/
    ::|link::https://sameerasw.me/
    ::|gmail::sameera.whoami@gmail.com
    ::|linkedin::https://www.linkedin.com/in/sameerasw/
    ::|twitter::https://twitter.com/sameera_s_w
    ::|telegram::https://t.me/sameera_s_w
    ::|instagram::https://www.instagram.com/sameera_s_w/
    ::|iitmail::sameera.20223140@iit.ac.lk
    ::|roundedtb::https://github.com/Erisa/RoundedTB
    ::|@::sameera_s_w
    ::|gm::Good Morning!
    ::|gn::Good Night!
    ::|wa::WhatsApp
    ::|tg::Telegram
    ::|omw::On my way!
    ::|brb::Be right back!
    ::|ty::Thank you!
    ::|yw::You're welcome!
    ::|np::No problem!
    ::spprt::support
    ::wlcm::welcome
    ::|wfh::work from home
    ::|sri::Sri Lanka
    ::|hbd::Happy Cake Day 
    ::|setup::https://sameerasw.notion.site/Sameera-s-PC-setup-156b74e4ab064defaa3d7af180d4f76f?pvs=4
    ::|4a5g::https://sameerasw.notion.site/Pixel-4a-5G-6b82fefe13634aec8aa2cdebc9a394ad?pvs=4
    ::|volte::https://github.com/stanislawrogasik/Pixel5-VoLTE-VoWiFi
    ::|pixel::https://photos.app.goo.gl/zcm7eGhvEYvohZAk9
    ::|+94::+94703061070
    ::|whoami::sameera.whoami@gmail.com
    ::|iit::sameera.20223140@iit.ac.lk
    ::|west::w1986636@westminster.ac.uk
    ::|zonemail::sameeraw@zone24x7.com
    ::|zone::zone24x7
    ::lorem::Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam euismod, nisl eget ultricies aliquam, nunc nisl ultricies nunc, quis ultricies nisl nisl eget nisl.
    ::|win::{LWin}

    ::|web::
    Run, msedge.exe "%Clipboard%"
    Return

    ::|google::
    Run, msedge.exe "https://www.google.com/search?q=%Clipboard%"
    Return        
    
    ;=== Notifications
    NumpadEnter::keywaiting("NumpadEnter","#n","{NumpadEnter}")
    ;=== minimize /
    NumpadDiv::/
    ;=== maximize *
    NumpadMult::
        keywait, NumpadMult, T0.6
        if Errorlevel
            Winset, Alwaysontop, , A
        Else WinMinimize, A
    Return
    ;=== close -
    NumpadSub::
        Keywait, NumpadSub
        If edge_is_active() || cabinet_is_active()
            SendInput, <^w
        Else WinClose, A
    Return
    ;=== Switch tab .
    NumpadDel::.
    ;=== switch windows 0
    NumpadIns::,
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
    ;=== ctrl/esc x1 and x2
    XButton1::
        keywait, XButton1, T0.4
        if Errorlevel
        {
            Send {Ctrl Down}
            Keywait, XButton1
            Send {Ctrl Up}
        }
        Else If WinActive("WhatsApp Beta")
            SendInput, ^w
        Else If GetKeyState("MButton", "P")
            Send, {XButton2}
        Else If WinActive("ahk_exe Telegram.exe")
            Send {Esc}
        Else Send, {XButton1}
    Return
    ;=== 2xclick x2 + Paste
    XButton2::
        keywait, XButton2, T0.3
        If Errorlevel
            SendInput, ^v
        Else If GetKeyState("MButton", "P")
            SendInput, ^x
        Else SendInput, ^c
    Return
    ;=== System Tray
    AppsKey::
        keywait, AppsKey, T0.4
        If Errorlevel {
            Keywait, AppsKey
            SendInput, {AppsKey}
        }
        Else If WinActive("ahk_exe Notion.exe")
            Send ^{/}
        Else cleanlaunch("Tab")
    Return
    ;=== OCR
    PrintScreen::keywaiting("PrintScreen","!#9","{PrintScreen}")
    ;=== Snipping Tool 
    ^PrintScreen::SendInput !#9
    ;=== ScreenRecord
    Pause::SendInput, +{PrintScreen}

; NUMLOCK + SCROLL LOCK OFF HOTKEYS
#If !GetKeyState("NumLock", "T") && !GetKeyState("ScrollLock", "T")
    SC176::Run, "C:\Program Files\Rainmeter\Rainmeter.exe" !ToggleConfig "Screensaver" "Clock.ini"
    RWin::
        keywait, RWin, T0.2
        if Errorlevel {
            Keywait, RWin
            SendInput, #v
        }
        Else SendInput, #{Tab}
    Return
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

cleanlaunch(key) {
    SendInput, {LWinDown}{d}{LWinUp}
    Sleep, 300
    SendInput, {LWinDown}{%key%}{LWinUp}
}

terminal_active(action) {
    If WinActive("ahk_exe WindowsTerminal.exe")
        SendInput, %action%
}

F9::
        keywait, F9, T0.6
        if Errorlevel {
            keywait, F9
            SendInput, {NumLock}
        }
        Else SendInput, {F9}
    Return