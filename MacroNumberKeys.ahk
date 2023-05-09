; ______________________launch or switch to ms edge -1______________________
#if !GetKeyState("NumLock", "T")
NumpadEnd::#1

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

; ______________________launch or switch to nitro mail/ notifications -3______________________
#if !GetKeyState("NumLock", "T")
{
NumpadPgDn::
  keywait, NumpadPgDn, T0.4
  err := Errorlevel
  if (err)
  {
   Keywait, NumpadPgDn
   Send #b
  return
  }
  Else
  {
   Send, #3
  }
  return
}

; ______________________Switch to discord -4______________________
#if !GetKeyState("NumLock", "T")
NumpadLeft::#4

; ______________________launch or switch to telegram -5______________________

#if !GetKeyState("NumLock", "T")
NumpadClear::#5

; ______________________launch or switch to whatsapp uwp beta -6______________________
#if !GetKeyState("NumLock", "T")
NumpadRight::#6

; ______________________launch or switch to notion -7______________________
#if !GetKeyState("NumLock", "T")
NumpadHome::#7

; ______________________launch or switch to vscode -8______________________
#if !GetKeyState("NumLock", "T")
NumpadUp::#8

; ______________________launch or switch to intellij -9______________________
#if !GetKeyState("NumLock", "T")
NumpadPgUp::#9

; ______________________Notifications______________________
#if !GetKeyState("NumLock", "T")
{
NumpadEnter::
  keywait, NumpadEnter, T0.8
  err := Errorlevel
  if (err)
  {
   Keywait, NumpadEnter
   Send #n
  return
  }
  Else
  {
   Send, {NumpadEnter}
  }
  return
}

; ______________________minimize -______________________
#if !GetKeyState("NumLock", "T")
{
NumpadDiv::
  keywait, NumpadDiv, T0.6
  err := Errorlevel
  if (err)
  {
   Keywait, NumpadDiv
   Winset, Alwaysontop, , A
  }
  Else
  {
   WinMinimize, A
  }
  return
}

; ______________________maximize -*______________________
Maxrestore()
{
SysGet, VirtualScreenWidth, 78

WinGetPos, X, Y, Width, Height, A

If (Virtualscreenwidth = 1920) {

   If (Width < 1920) {
Keywait, NumpadMult
      WinMaximize, A

   } Else {
Keywait, NumpadMult
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
Keywait, NumpadSub
Send, <^w
}
Else
{
IfWinActive ahk_class CabinetWClass
{
Keywait, NumpadSub
Send, <^w
}
Else
{
Keywait, NumpadSub
WinClose, A
}
}

Return
}


#if !GetKeyState("NumLock", "T")
{
NumpadSub::close()
}

; ______________________Switch tab -.______________________
#if !GetKeyState("NumLock", "T")
{
NumpadDel::
  keywait, NumpadDel, T0.4
  err := Errorlevel
  if (err)
  {
   Keywait, NumpadDel
   Send ^+{Tab}
  return
  }
  Else
  {
   Send ^{Tab}
  }
  return
}

; ______________________switch windows -0______________________
#if !GetKeyState("NumLock", "T")
{
NumpadIns::
   Send {Alt Down}
   Send {Tab}
   Keywait, NumpadIns
   Send {Alt Up}
   return
}

; ______________________new tab/window -+______________________
fullscrn()
{
  IfWinActive ahk_exe msedge.exe
    {
      Keywait, NumpadAdd
      Send, ^t
    }
  Else
    {
      IfWinActive ahk_class CabinetWClass
        {
         keywait, NumpadAdd, T0.4
          err := Errorlevel
          if (err)
          {
          Keywait, NumpadAdd
          Send, #e
          }
          Else
          {
          Send ^t
          }
         return
        }
      Else
        {
          Keywait, NumpadAdd
          Send, #2
        }
    }
Return
}

#if !GetKeyState("NumLock", "T")
{
NumpadAdd::fullscrn()
}

; ______________________ctrl/esc -x1______________________
XButton1::
  keywait, XButton1, T0.4
  err := Errorlevel
  if (err)
 
  {
   Send {Ctrl Down}
   Keywait, XButton1
   Send {Ctrl Up}
   Return 
  }

else
{
 IfWinActive WhatsApp Beta
    {
     Send, ^w
    }
 Else
  {
    IfWinActive ahk_exe Telegram.exe or WinActive ahk_exe olk.exe
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

; ______________________2xclick -x2 + Paste______________________
#if !GetKeyState("MButton", "P")
XButton2::
  keywait, XButton2, T0.2
  srr := Errorlevel
  if (srr)
  {
   Send #v
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
SC176::Run, SlideToShutDown.exe
Return

; ______________________Lock screen______________________
#if !GetKeyState("NumLock", "T")
#if !GetKeyState("ScrollLock", "T")
SC176::Run, "C:\Program Files\Rainmeter\Rainmeter.exe" !ToggleConfig "Screensaver" "Clock.ini"

; ______________________System Tray______________________
#if !GetKeyState("NumLock", "T")
{
AppsKey::
  keywait, AppsKey, T0.4
  err := Errorlevel
  if (err)
  {
   Keywait, AppsKey
   Send #{F2}
  return
  }
  Else
  {
     IfWinActive ahk_exe Notion.exe
      {
        Send ^{/}
        return
      }
      Else
      {
        Send, {AppsKey}
      }
  }
  return
}

; ______________________OCR______________________
#if !GetKeyState("NumLock", "T")
{
PrintScreen::
  keywait, PrintScreen, T0.4
  err := Errorlevel
  if (err)
  {
   Keywait, PrintScreen
   Send ^{PrintScreen}
  return
  }
  Else
  {
   Send, {PrintScreen}
  }
  return
}

; ________________ScreenRecord_________________
#if !GetKeyState("NumLock", "T")
{
Pause::Send, +{PrintScreen}
}