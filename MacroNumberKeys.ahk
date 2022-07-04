; ______________________always on Top______________________
#if !GetKeyState("NumLock", "T")
>!NumpadDiv:: Winset, Alwaysontop, , A ; ctrl + space
Return

; ______________________launch or switch to file explorer -2______________________
launchOrSwitchfiles()
{
IfWinExist ahk_class CabinetWClass
{
IfWinActive ahk_class CabinetWClass
{
WinMinimize, A
}
Else
{
 WinActivateBottom, ahk_class CabinetWClass
}
}
Else
{
 send, #e
}
Return
}

#if !GetKeyState("NumLock", "T")
{
NumpadDown::launchOrSwitchfiles()
}

; ______________________launch or switch to ms edge -1______________________
launchOrSwitchedge()
{
IfWinExist ahk_exe msedge.exe
{
IfWinActive ahk_exe msedge.exe
{
send, ^{Tab}
}
Else
{
 WinActivateBottom, ahk_exe msedge.exe
}
}
Else
{
 send, #1
}
Return
}

#if !GetKeyState("NumLock", "T")
{
NumpadEnd::launchOrSwitchedge()
}

; ______________________launch or switch to telegram -5______________________
launchOrSwitchtg()
{
IfWinExist ahk_exe telegram.exe
{
IfWinActive ahk_exe telegram.exe
{
WinMinimize, A
}
Else
{
 WinActivateBottom, ahk_exe telegram.exe
}
}
Else
{
 send, #5
}
Return
}

#if !GetKeyState("NumLock", "T")
{
NumpadClear::launchOrSwitchtg()
}

; ______________________launch or switch to whatsapp uwp beta -6______________________
#if !GetKeyState("NumLock", "T")
NumpadRight::#6

; ______________________launch or switch to nitro sense -3______________________
launchOrSwitchns()
{
IfWinExist ahk_exe NitroSense.exe
{
IfWinActive ahk_exe NitroSense.exe
{
WinMinimize, A
}
Else
{
 WinActivateBottom, ahk_exe NitroSense.exe
}
}
Else
{
 send, #3
}
Return
}

#if !GetKeyState("NumLock", "T")
{
NumpadPgDn::launchOrSwitchns()
}

; ______________________launch or switch to google photos -9______________________
launchOrSwitchPhotos()
{
 send, #9
}
#if !GetKeyState("NumLock", "T")
{
NumpadPgUp::launchOrSwitchPhotos()
}

; ______________________launch or switch to gmail -8______________________
launchOrSwitchGmail()
{
 send, #8
}
#if !GetKeyState("NumLock", "T")
{
NumpadUp::launchOrSwitchGmail()
}

; ______________________Switch to photoshop -4______________________
launchOrSwitchps()
{
IfWinExist ahk_exe Photoshop.exe
{
IfWinActive ahk_exe Photoshop.exe
{
WinMinimize, A
}
Else
{
 WinActivateBottom, ahk_exe Photoshop.exe
}
}
Else
{
  send, #!4
}
Return
}

#if !GetKeyState("NumLock", "T")
{
NumpadLeft::launchOrSwitchps()
}

; ______________________launch or switch to spotify -7______________________
launchOrSwitchspotify()
{
IfWinExist ahk_exe Spotify.exe
{
IfWinActive ahk_exe Spotify.exe
{
WinMinimize, A
}
Else
{
 WinActivateBottom, ahk_exe Spotify.exe
}
}
Else
{
  send, #7
}
Return
}

#if !GetKeyState("NumLock", "T")
{
NumpadHome::launchOrSwitchspotify()
}

; ______________________launch or switch to dolby audio -pause______________________
launchOrSwitchdolby()
{
IfWinExist ahk_exe DolbyDAX2DesktopUI.exe
{
IfWinActive ahk_exe DolbyDAX2DesktopUI.exe
{
WinMinimize, A
}
Else
{
 WinActivateBottom, ahk_exe DolbyDAX2DesktopUI.exe
}
}
Else
{
Run, C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Dolby\Dolby Audio.lnk
}
Return
}

#if !GetKeyState("NumLock", "T")
{
Pause::launchOrSwitchdolby()
}

; ______________________minimize -/______________________
#if !GetKeyState("NumLock", "T")
{
NumpadDiv::WinMinimize, A
}

; ______________________maximize -*______________________
Maxrestore()
{
SysGet, VirtualScreenWidth, 78

WinGetPos, X, Y, Width, Height, A

If (Virtualscreenwidth = 1920) {

   If (Width < 1920) {

      WinMaximize, A

   } Else {

      WinRestore, A

   }

}

Return
}

#if !GetKeyState("NumLock", "T")
{
NumpadMult::Maxrestore()
}

; ______________________close --______________________
close()
{
IfWinActive ahk_exe msedge.exe
{
Send, <^w
}
Else
{
IfWinActive ahk_class CabinetWClass
{
Send, <^w
}
Else
{
WinClose, A
}
}

Return
}


#if !GetKeyState("NumLock", "T")
{
NumpadSub::close()
}

; ______________________switch windows -0______________________
#if !GetKeyState("NumLock", "T")
{
NumpadIns::Send, !{TAB}
}

; ______________________taskview -.______________________
#if !GetKeyState("NumLock", "T")
{
NumpadDel::send, #{Tab}
}
return

; ______________________new tab/window -+______________________
fullscrn()
{
  IfWinActive ahk_exe msedge.exe
    {
      Send, ^t
    }
  Else
    {
      IfWinActive ahk_class CabinetWClass
        {
          Send, #e
        }
      Else
        {
          Send, #2
        }
    }
Return
}

#if !GetKeyState("NumLock", "T")
{
NumpadAdd::fullscrn()
}

; ______________________ctrl/paste/esc -x1______________________
XButton1::
  keywait, XButton1, T0.4
  err := Errorlevel
  if (err)
{
IfWinActive ahk_class CabinetWClass  
  {
   Send {Ctrl Down}
   Keywait, XButton1
   Send {Ctrl Up}
   Return 
  }
 else
  {
IfWinActive ahk_exe Photoshop.exe
  {
   Send {Ctrl Down}
   Keywait, XButton1
   Send {Ctrl Up}
   Return 
  }
 else
  {
   Send, #v
   Return 
  }
}
}
else
{
 IfWinActive WhatsApp Beta
    {
     Send, ^w
    }
 Else
  {
    IfWinActive ahk_exe telegram.exe
      {
        Send {Esc}
        return
      }
      Else
      {
        if GetKeyState("MButton", "P")
          {
            Send ^w
            return
          }
      }
  }
{
   Send, {XButton1}
}
 }
return

; ______________________shift/2xclick -x2______________________
#if !GetKeyState("MButton", "P")
XButton2::
  keywait, XButton2, T0.2
  srr := Errorlevel
  if (srr)
  {
   Send {Shift Down}
   Keywait, XButton2
   Send {Shift Up}
   Return 
  }
  else
  { 
    Click, 2
    return
  }
  return

; ______________________shutdown -pwr key______________________
#if GetKeyState("NumLock", "T")
SC176:: Run, SlideToShutDown.exe
Return

; ______________________search with fluent search -pwr key______________________
#if !GetKeyState("NumLock", "T")
SC176:: Send, #+a
Return

; ______________________taskbar hide =experimental______________________
#if !GetKeyState("NumLock", "T")
>!NumpadDel::HideShowTaskbar(hide := !hide)
   
HideShowTaskbar(action)
{
   if action
      WinHide, ahk_class Shell_TrayWnd
   else
      WinShow, ahk_class Shell_TrayWnd
}
Return
