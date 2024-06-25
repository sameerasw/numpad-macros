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

	#+a::#+Left
	#+d::#+Right

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

; ignore  capslock
!CapsLock::Return
#+CapsLock::Return

; Arrow key alternatives
AppsKey::SendInput, {Left}
RCtrl::SendInput, {Right}
>!AppsKey::SendInput, {Up}
>!RCtrl::SendInput, {Down}

+AppsKey::SendInput, +{Left}
+RCtrl::SendInput, +{Right}
+>!AppsKey::SendInput, +{Up}
+>!RCtrl::SendInput, +{Down}

#+AppsKey::SendInput, {Shift down}{LWinDown}{Left}{LWinUp}{Shift up}
#+RCtrl::SendInput, {Shift down}{LWinDown}{Right}{LWinUp}{Shift up}

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

#BackSpace::SendInput, {Delete}
+#BackSpace::SendInput, {ShiftDown}{Delete}{ShiftUp}

>!BackSpace::SendInput, ^W
>!=::
	Keywait, NumpadMult
	SysGet, VirtualScreenWidth, 78
	WinGetPos, X, Y, Width, Height, A
	If (Width < 1920)
		WinMaximize, A
	Else If (Virtualscreenwidth = 1920)
		WinRestore, A
Return
>!-::
	keywait, NumpadDiv, T0.6
	if Errorlevel
		Winset, Alwaysontop, , A
	Else WinMinimize, A
		Return

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