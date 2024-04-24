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
Sleep(3000)

Run(@ComSpec & " /c " & 'start ' & $appExe,  $appPath, @SW_HIDE)
WinActivate($hWnd, '')

;ctrl+f 快捷键查找联系人
Send("^f")
Sleep(1000)

;切换为英文输入法
$hWnd = WinGetHandle("[ACTIVE]") ;$hWnd 为目标窗口句柄，这里设置的是当前活动窗口
$ret = DllCall("user32.dll", "long", "LoadKeyboardLayout", "str", "04090409", "int", 1 + 0)
DllCall("user32.dll", "ptr", "SendMessage", "hwnd", $hWnd, "int", 0x50, "int", 1, "int", $ret[0])

Send($wxID)
Sleep(1000)
Send("{enter}")
Sleep(3000)

Run(@ComSpec & " /c " & 'start ' & $appExe,  $appPath, @SW_HIDE)
WinActivate($hWnd, '')
MouseClick($MOUSE_CLICK_LEFT, 760, 690, 1)
