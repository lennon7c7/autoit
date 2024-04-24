#include <AutoItConstants.au3>

Global $appTitle = '微信'
Global $appClass = 'WeChatMainWndForPC'
Global $appPath = 'D:\Program Files (x86)\Tencent\WeChat'
Global $appExe = 'WeChat.exe'

Local $wxID = $CmdLine[1]
;Local $wxID = 'linlin520'
;Local $wxID = 'lennon7c7'

Run(@ComSpec & " /c " & 'start ' & $appExe,  $appPath, @SW_HIDE)
Sleep(1000)

Local $hWnd = WinWait("[TITLE:" & $appTitle & "; CLASS:" & $appClass & "]", "", 10)
WinMove($hWnd, "", 0, 0, 800, 800)
Sleep(1000)

WinActivate($hWnd, '')
MouseClick($MOUSE_CLICK_LEFT, 100, 40, 1)
Sleep(1000)

WinActivate($hWnd, '')
Send($wxID)
Sleep(3000)

WinActivate($hWnd, '')
MouseClick($MOUSE_CLICK_LEFT, 100, 120, 1)
Sleep(1000)

WinActivate($hWnd, '')
MouseClick($MOUSE_CLICK_LEFT, 760, 690, 1)
