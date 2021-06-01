$appTitle = '微信'
$appList = WinVisibleOrActive($appTitle)
$mpTitle = '口袋修仙'
$mpAppID = 'wx3e9f3febb9e9ea21'

Func KouDaiXiuXianStart()
   KouDaiXiuXianLaunchMP()

   KouDaiXiuXianAd()

   KouDaiXiuXianCloseMP()
EndFunc

Func KouDaiXiuXianLaunchMP()
;~    ConsoleLog('$mpTitle: ' & $mpTitle)

   KouDaiXiuXianCloseMP()

   For $i = 1 To 2
	  For $value In $appList
		 WinActivate($value, '')
		 Sleep(3000)
		 OpenWechatMP($mpAppID)
	  Next
	  Sleep(15000)

	  $mpList = WinVisibleOrActive($mpTitle)
	  For $value In $mpList
		 WinActivate($value, '')
		 Sleep(1000)
		 ; nav bar: liandan
		 MouseClick('left', 800, 320, 1)
		 Sleep(1000)
	  Next

	  KouDaiXiuXianCloseMP()
   Next
   Sleep(3000)

   For $value In $appList
	  WinActivate($value, '')
	  Sleep(3000)
	  OpenWechatMP($mpAppID)
   Next
   Sleep(15000)
EndFunc

Func KouDaiXiuXianAd()
   ConsoleLog('task: KouDaiXiuXianAd')

   WinMinimizeAll()
   Sleep(1000)

   $mpList = WinVisibleOrActive($mpTitle)

   For $value In $mpList
	  WinActivate($value, '')
	  Sleep(1000)
	  ; nav bar: liandan
	  MouseClick('left', 741, 638, 1)
	  Sleep(1000)
   Next
   Sleep(3000)

   For $j = 1 To 30
	  ConsoleLog('ad: ' & $j)
	  For $value In $mpList
		 WinActivate($value, '')
		 Sleep(1000)
		 ; button: kaishi liandan
		 MouseClick('left', 600, 140, 1)
		 Sleep(1000)
		 MouseClick('left', 600, 140, 1)
		 Sleep(1000)
		 MouseClick('left', 600, 140, 1)
		 Sleep(1000)

		 ; button: (start ad) || share
		 MouseClick('left', 677, 400, 2)
		 Sleep(1000)

		 For $h = 1 To 5
			$hWnd = WinGetHandle('[Class:SelectContactWnd]')
			$sHWND = String($hWnd)
			If $sHWND > 0 Then
			   MouseClick('left', 900, 600, 1)
			   Sleep(1000)
			EndIf

			$hWnd = WinGetHandle('[Title:提示]')
			$sHWND = String($hWnd)
			If $sHWND > 0 Then
			   MouseClick('left', 655, 433, 1)
			   Sleep(5000)
			EndIf
		 Next
	  Next
	  Sleep(30000)

	  For $value In $mpList
		 WinActivate($value, '')
		 Sleep(1000)
		 ; button: close ad
		 MouseClick('left', 805, 127, 1)
		 Sleep(3000)
	  Next
	  Sleep(3000)
   Next
EndFunc

Func KouDaiXiuXianCloseMP()
   For $i = 1 To 2
	  Local $mpList = WinVisibleOrActive($mpTitle)
	  For $value In $mpList
		 WinKill($mpTitle, '')
		 Sleep(1000)
	  Next
   Next
EndFunc
