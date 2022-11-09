#Include <Array.au3>

func autoClick()
   Local $iPID = Run(@ComSpec & " /c " & 'start C:\"Program Files"\Google\Chrome\Application\chrome.exe --app=https://goerlifaucet.com/', "", @SW_HIDE)
   Sleep(10000)
   Local $hWnd = WinWait("[CLASS:Chrome_WidgetWin_1]", "", 10)

   For $i = 1 To 6
	  Send("{TAB}")
	  Sleep(300)
   Next

   Send("0xdb378422487862250140E1aF6AeCEFA0BB59b8d8")
   Sleep(2000)

   Send("{ENTER}")
   Sleep(2000)

   WinClose($hWnd)
EndFunc

autoClick()