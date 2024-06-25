#Requires AutoHotkey v2.0

;CapsLk keys
CapsLock & a::left
CapsLock & d::right
CapsLock & w::up
CapsLock & s::down

CapsLock & q::PgUp
CapsLock & e::PgDn

CapsLock & z::Home
CapsLock & c::End

CapsLock & 1::F1
CapsLock & 2::F2
CapsLock & 3::F3
CapsLock & 4::F4
CapsLock & 5::F5
CapsLock & 6::F6
CapsLock & 7::F7
CapsLock & 8::F8
CapsLock & 9::F9
CapsLock & 0::F10
CapsLock & -::F11
CapsLock & =::F12

;Right Ctrl mods
RCtrl::Right
AppsKey::Left
>!RControl::Down
>!AppsKey::Up

>^AppsKey::^#Right
>^RAlt::^#Left

>^BackSpace::PrintScreen

>^=::Volume_Up
>^-::Volume_Down
>^0::Volume_Mute
>^\::Media_Play_Pause
>^]::Media_Next
>^[::Media_Prev

;macOS delete
#Backspace::Delete
+#Backspace::+Delete

;Window Controls
>!-:: WinMinimize "A"
>!=::
{
    WinGetPos &X, &Y, &W, &H, "A"
    if (W < SysGet(78))
    {
        WinMaximize "A"
    }
    else
    {
        WinRestore "A"
    }

}
>!Backspace::^w

;-----------------mouse-----------------
XButton2::
{
    if !KeyWait("XButton2", "T0.4")
    {
        Send "{LAlt down}{Tab}"
        KeyWait "XButton2"
        Send "{LAlt up}"
    }
    else
    {
        Send "{XButton2}"
    }
}

XButton1::
{
    if !KeyWait("XButton1", "T0.4")
    {
        Send "{LCtrl down}"
        KeyWait "XButton1"
        Send "{LCtrl up}"
    }
    else If WinActive("WhatsApp Beta")
    {
        Send "{Esc}"
    }
    else If WinActive("ahk_exe Telegram.exe")
    {
        Send "{Esc}"
    }
    else
    {
        Send "{XButton1}"
    }
}

;-----------------laptop-----------------
Launch_App2::
{
    if !KeyWait("Launch_App2", "T0.4")
    {
        Send "{Media_Next}"
        KeyWait "Launch_App2"
    }
    else
    {
        Click "{Media_Play_Pause}"
        return
    }
}

If !GetKeyState("NumLock", "T")
{
    NumpadSub:: Send "{Volume_Up}"
    NumpadMult:: Send "{Volume_Down}"
}


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
::|link::https://sameerasw.com/
::|pixel::https://sameerasw.com/pixel
::|macos::https://sameerasw.com/macos
::|linkedin::https://www.linkedin.com/in/sameerasw/
::|twitter::https://twitter.com/sameera_s_w
::|telegram::https://t.me/sameera_s_w
::|instagram::https://www.instagram.com/sameera_s_w/
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
::|hack::https://hackbook.simple.ink/
::lorem::Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam euismod, nisl eget ultricies aliquam, nunc nisl ultricies nunc, quis ultricies nisl nisl eget nisl.