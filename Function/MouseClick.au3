#include <AutoItConstants.au3>

	   Local $positionX = $CmdLine[1]
	   Local $positionY = $CmdLine[2]

TrayTip('', $positionX & ', '  & $positionY, 1)
Local $hWnd = WinWait("[TITLE:bet365 - 在线体育投注; CLASS:Chrome_WidgetWin_1]", "", 10)
WinActivate($hWnd, '')
;Sleep(1000)

MouseClick($MOUSE_CLICK_LEFT, $positionX, $positionY, 1)

		 ;Sleep(1000)

