$appTitle = '微信'
$appList = WinListByTitleTo2D($appTitle)
$mpTitle = '五福小财神'
$mpAppID = 'wx45300ccbed485ae0'

Func WuFuXiaoCaiShenStart()
	WinKillByTitle($mpTitle)

	For $i = 0 To UBound($appList) - 1
		Local $winList[0]
		For $j = 0 To UBound($appList, $UBOUND_COLUMNS) - 1
			If $appList[$i][$j] == '' Then
			   ContinueLoop
			EndIf

			_ArrayAdd($winList, $appList[$i][$j])
		Next

		WuFuXiaoCaiShenLaunchMP($winList)

		WuFuXiaoCaiShenTaskAd()
	Next

   WinKillByTitle($mpTitle)
EndFunc


Func WuFuXiaoCaiShenLaunchMP($winList)
	ConsoleLog('task: WuFuXiaoCaiShenLaunchMP')

   For $h = 1 To 2
	  For $value In $winList
		 WinActivate($value, '')
		 Sleep(3000)
		 OpenWechatMP($mpAppID)
	  Next
	  Sleep(15000)
	  WinKillByTitle($mpTitle)
   Next

   For $value In $winList
	  WinActivate($value, '')
	  Sleep(3000)
	  OpenWechatMP($mpAppID)
   Next
   Sleep(15000)
EndFunc

Func WuFuXiaoCaiShenTaskAd()
	ConsoleLog('task: WuFuXiaoCaiShenTaskAd')

	WinMinimizeAll()
   Sleep(1000)

   $mpList = WinListByTitleTo1D($mpTitle)
   For $value In $mpList
	  WinActivate($value, '')
	  Sleep(1000)
	  ; nav bar: liandan
	  MouseClick('left', 810, 410, 1)
	  Sleep(1000)
   Next
   Sleep(5000)

   For $value In $mpList
	  WinActivate($value, '')
	  Sleep(1000)
	  ; offline2
	  MouseClick('left', 780, 180, 1)
	  Sleep(1000)
   Next
   Sleep(5000)

   For $j = 1 To 50
	  ConsoleLog('ad: ' & $j)
	  For $value In $mpList
		 WinActivate($value, '')
		 Sleep(1000)
		 ; button: (start ad) || share
		 MouseClick('left', 780, 380, 1)
		 Sleep(3000)
		 MouseClick('left', 780, 380, 1)
		 Sleep(3000)
	  Next
	  Sleep(30000)

	  For $value In $mpList
		 WinActivate($value, '')
		 Sleep(1000)
		 ; button: close ad
		 MouseClick('left', 805, 127, 1)
		 Sleep(3000)

		 MouseClick('left', 682, 493, 1)
		 Sleep(3000)

		 ; button: if fail ad
		 MouseClick('left', 559, 291, 1)
		 Sleep(3000)
	  Next
	  Sleep(3000)
   Next
EndFunc
