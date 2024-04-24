Local $text = $CmdLine[1]

TrayTip('', $text, 1)

Local $hWnd = WinWait("[TITLE:bet365 - 在线体育投注; CLASS:Chrome_WidgetWin_1]", "", 10)
WinActivate($hWnd, '')
;Sleep(1000)
Send($text)

;Sleep(1000)
