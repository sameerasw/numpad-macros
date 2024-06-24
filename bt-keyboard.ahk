#Requires AutoHotkey 1.1+
#SingleInstance Force 
#Warn 
Return 

; NUMLOCK OFF HOTKEYS
#If !GetKeyState("NumLock", "T")

;CapsLk Arrow keys
CapsLock::
  KeyWait CapsLock
  KeyWait CapsLock,D T0.2
  If !ErrorLevel && (A_PriorKey="CapsLock")
	SetCapsLockState % GetKeyState("CapsLock","T")?"Off":"On"
Return

#If GetKeyState("CapsLock","P")  ;Following hotkeys are enabled when this is True
w::Up                            ;Remap w to Up
s::Down                          ;etc.
a::Left                          ;
d::Right  

+w::+Up
+s::+Down
+a::+Left
+d::+Right

<^w::<^Up
<^s::<^Down
<^a::<^Left
<^d::<^Right

<!w::<!Up
<!s::<!Down
<!a::<!Left
<!d::<!Right

q::PgUp
e::PgDn
z::Home
x::End

1::F1
2::F2
3::F3
4::F4
5::F5
6::F6
7::F7
8::F8
9::F9
0::F10
-::F11
=::F12

#If 

^CapsLock::CapsLock ; Ctrl+CapsLock toggles CapsLock

; ignore alt + capslock
!CapsLock::Return

; Arrow key alternatives
AppsKey::SendInput, {Left}
RCtrl::SendInput, {Right}
>!AppsKey::SendInput, {Up}
>!RCtrl::SendInput, {Down}

+AppsKey::SendInput, +{Left}
+RCtrl::SendInput, +{Right}
+>!AppsKey::SendInput, +{Up}
+>!RCtrl::SendInput, +{Down}

; Screenshots
>^BackSpace::SendInput, {PrintScreen}
>^!BackSpace::SendInput, {Alt down}{PrintScreen}{Alt up}

; Media keys
>^=::SendInput, {Volume_Up}
>^-::SendInput, {Volume_Down}
>^\::SendInput, {Media_Play_Pause}
>^]::SendInput, {Media_Next}
>^[::SendInput, {Media_Prev}]

; Desktop switching
>^AppsKey::SendInput, {CtrlDown}{LWinDown}{Right}{LWinUp}{CtrlUp}
>^RAlt::SendInput, {CtrlDown}{LWinDown}{Left}{LWinUp}{CtrlUp}


; Mouse buttons
XButton2::
        keywait, XButton2, T0.2
        if Errorlevel {
            MouseGetPos, MouseX1, MouseY1
			Sleep 50
		MouseGetPos, MouseX2, MouseY2
		If (abs(MouseX2-MouseX1) < 20) and (abs(MouseY2-MouseY1) < 20) 
		{
			Return
		}
		If ((MouseY2-MouseY1) < 5 and (MouseY1-MouseY2) < 5) 
		{
			If (MouseX2 < MouseX1)
				SendInput {LWin down}{LCtrl down}{Right}{LWin up}{LCtrl up}
			else
			If (MouseX2 > MouseX1)
				SendInput {LWin down}{LCtrl down}{Left}{LWin up}{LCtrl up}
			KeyWait XButton2
		}
		else
		If ((MouseX2-MouseX1) < 5 and (MouseX1-MouseX2) < 5) 
		{
			If (MouseY2 < MouseY1)
				SendInput {LWin down}{Tab}{LWin up}
			else
			If (MouseY2 > MouseY1)
				SendInput {LWin down}{Tab}{LWin up}
			KeyWait XButton2
		}

        }
        Else SendInput, {XButton2}
    Return

XButton1::
        keywait, XButton1, T0.4
        if Errorlevel {
        	SendInput, {LAlt down}{Tab}
		KeyWait XButton1
		SendInput, {LAlt up}
        }
        Else SendInput, {XButton1}
    Return








;---------------------------- Laptop Keys ----------------------------

Launch_App2::
        keywait, Launch_App2, T0.6
        if Errorlevel {
        	SendInput, {Media_Next}
		KeyWait Launch_App2
        }
        Else
	{
		SendInput, {Media_Play_Pause}
		Return
	}



; NUMLOCK ON HOTKEYS
#If !GetKeyState("NumLock", "T")
    ;=== shutdown -pwr key
    NumpadSub::SendInput, {Volume_Up}
    NumpadMult::SendInput, {Volume_Down}
	

	
; Shortcut to toggle titlebar
#!Delete::
WinSet, Style, ^0xC00000, A
Return

; Shortcut to toggle titlebar and borders
#^Delete::
WinSet, Style, ^0xC40000, A
Return
