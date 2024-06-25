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

#If GetKeyState("CapsLock","P") ;Following hotkeys are enabled when this is True
	w::Up ;Remap w to Up
	s::Down ;etc.
	a::Left ;
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
	keywait, XButton2, T0.4
	if Errorlevel {
		SendInput, {LAlt down}{Tab}
		KeyWait XButton1
		SendInput, {LAlt up}
	}
	Else SendInput, {XButton2}
		Return

XButton1::
	keywait, XButton1, T0.4
	if Errorlevel
	{
		Send {Ctrl Down}
		Keywait, XButton1
		Send {Ctrl Up}
	}
	Else If WinActive("WhatsApp Beta")
		Send {Esc}
	Else If WinActive("ahk_exe Telegram.exe")
		Send {Esc}
	Else Send, {XButton1}
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
	NumpadSub::SendInput, {Volume_Up}
	NumpadMult::SendInput, {Volume_Down}