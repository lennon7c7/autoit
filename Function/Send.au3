Local $text = $CmdLine[1]

TrayTip('', $text, 1)

Local $hWnd = WinWait("[TITLE:bet365 - 在线体育投注; CLASS:Chrome_WidgetWin_1]", "", 10)
WinActivate($hWnd, '')

;切换为英文输入法
$hWnd = WinGetHandle("[ACTIVE]") ;$hWnd 为目标窗口句柄，这里设置的是当前活动窗口
$ret = DllCall("user32.dll", "long", "LoadKeyboardLayout", "str", "04090409", "int", 1 + 0)
DllCall("user32.dll", "ptr", "SendMessage", "hwnd", $hWnd, "int", 0x50, "int", 1, "int", $ret[0])

;Sleep(1000)
Send($text)

;Sleep(1000)
