;===================================func===================================
;edge
edge_func(key,shortcut1,shortcut2,app="ahk_exe msedge.exe")
{
  IfWinActive %app%
  {
    keywait, %key%, T0.4
      err := Errorlevel
      if (err)
      {
        KeyWait, %key%
        Send, %shortcut1%
      }
      Else
      {
        Send, %shortcut2%
      }
  }
Else
  {
    KeyWait, %key%
    Send, {%key%}
  }
Return
}

;keywait
keywaiting(key,shortcut1,shortcut2)
{
  keywait, %key%, T0.4
    err := Errorlevel
    if (err)
    {
      KeyWait, %key%
      Send, %shortcut1%
    }
    Else
    {
      Send, %shortcut2%
    }
}

;===================================hotkeys===================================
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

; ______________________launch or switch to 3rd/ notifications -3______________________
#if !GetKeyState("NumLock", "T")
{
NumpadPgDn::
  keywaiting("NumpadPgDn","#b{Enter}","#3")
  return
}

; ______________________Switch to -4______________________
#if !GetKeyState("NumLock", "T")
NumpadLeft::#4

; ______________________launch or -5______________________

#if !GetKeyState("NumLock", "T")
NumpadClear::#5

; ______________________launch or switch to -6______________________
#if !GetKeyState("NumLock", "T")
NumpadRight::#6

; ______________________launch or switch to -7______________________
#if !GetKeyState("NumLock", "T")
NumpadHome::#7

; ______________________launch or switch to -8______________________
#if !GetKeyState("NumLock", "T")
NumpadUp::#8

; ______________________launch or switch to -9______________________
#if !GetKeyState("NumLock", "T")
NumpadPgUp::#9

; ______________________Notifications______________________
#if !GetKeyState("NumLock", "T")
{
NumpadEnter::
  keywaiting("NumpadEnter","#n","{NumpadEnter}")
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
  keywaiting("NumpadDel","^+{Tab}","^{Tab}")
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
#if !GetKeyState("NumLock", "T")
NumpadAdd::
{
  IfWinActive ahk_exe msedge.exe
    {
      keywaiting("NumpadAdd","{f6}{Shift down}{Tab}{Tab}{Shift up}{Enter}","^t")
      return
    }
  Else
    {
      IfWinActive ahk_class CabinetWClass
        {
          keywaiting("NumpadAdd","#e","^t")
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
      IfWinActive ahk_exe Telegram.exe
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
  keywaiting("PrintScreen","^{PrintScreen}","{PrintScreen}")
  return
}

; ________________ScreenRecord_________________
#if !GetKeyState("NumLock", "T")
{
Pause::Send, +{PrintScreen}
}

; ______________________Edge Shortcuts______________________
;dev ops
#if !GetKeyState("NumLock", "T")
{
  F12::edge_func("F12","{Ctrl down}{Shift down}{c}{Shift up}{Ctrl up}","{F12}")
}

; ;Tab search + command bar
#if !GetKeyState("NumLock", "T")
{
  F2::edge_func("F2","{Ctrl down}{q}{Ctrl up}","{Ctrl down}{Shift down}{a}{Shift up}{Ctrl up}")
}

;sidebar
#if !GetKeyState("NumLock", "T")
{
  F1::edge_func("F1","{Ctrl down}{Shift down}{e}{Shift up}{Ctrl up}","{Ctrl down}{Shift down}{.}{Shift up}{Ctrl up}")
}