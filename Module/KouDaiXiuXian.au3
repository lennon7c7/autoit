$appTitle = '微信'
$appList = WinListByTitleTo2D($appTitle)
$mpTitle = '口袋修仙'
$mpAppID = 'wx3e9f3febb9e9ea21'

Func KouDaiXiuXianStart()
	WinKillByTitle($mpTitle)

	For $i = 0 To UBound($appList) - 1
		Local $winList[0]
		For $j = 0 To UBound($appList, $UBOUND_COLUMNS) - 1
			If $appList[$i][$j] == '' Then
			   ContinueLoop
			EndIf

			_ArrayAdd($winList, $appList[$i][$j])
		Next

		KouDaiXiuXianLaunchMP($winList)

		KouDaiXiuXianAd()
	Next

	WinKillByTitle($mpTitle)
EndFunc

Func KouDaiXiuXianLaunchMP($winList)
	ConsoleLog('task: KouDaiXiuXianLaunchMP')

	WinKillByTitle($mpTitle)

   For $i = 1 To 2
	  For $value In $winList
		 WinActivate($value, '')
		 Sleep(3000)
		 OpenWechatMP($mpAppID)
	  Next
	  Sleep(15000)

	  $mpList = WinListByTitleTo1D($mpTitle)
	  For $value In $mpList
		 WinActivate($value, '')
		 Sleep(1000)
		 ; nav bar: liandan
		 MouseClick('left', 800, 320, 1)
		 Sleep(1000)
	  Next

	  WinKillByTitle($mpTitle)
	Next
   Sleep(3000)

   For $value In $winList
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

   $mpList = WinListByTitleTo1D($mpTitle)

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
