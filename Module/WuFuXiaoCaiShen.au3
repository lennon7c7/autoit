Func WuFuXiaoCaiShenStart()
   Global $appTitle = '微信'
   Global $appList = WinListByTitleTo2D($appTitle)
   Global $mpTitle = '五福小财神'
   Global $mpAppID = 'wx45300ccbed485ae0'
   Global $mpControlClass = 'MINIGAMEVIEW'
   Global $mpControlClassnameNN = 'MINIGAMEVIEW1'

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

	WinKillByTitle($mpTitle)

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

	  Local $hControl = ControlGetHandle($value, "", $mpControlClassnameNN)

	  ;~ open xunfang
	  ControlClick($mpTitle, $mpControlClass, $hControl, 'left', 1, 421, 440)
	  Sleep(1000)
   Next
   Sleep(10000)

   For $value In $mpList
	  WinActivate($value, '')
	  Sleep(1000)

	  Local $hControl = ControlGetHandle($value, "", $mpControlClassnameNN)

	  ;~ open huoqu
	  ControlClick($mpTitle, $mpControlClass, $hControl, 'left', 1, 370, 110)
	  Sleep(1000)
   Next
   Sleep(10000)

   For $j = 1 To 50
	  ConsoleLog('ad: ' & $j)
	  For $value In $mpList
		 WinActivate($value, '')
		 Sleep(1000)

		 Local $hControl = ControlGetHandle($value, "", $mpControlClassnameNN)

		 ; button: (start ad) || share
		 ControlClick($mpTitle, $mpControlClass, $hControl, 'left', 1, 370, 390)
		 Sleep(3000)
		 ControlClick($mpTitle, $mpControlClass, $hControl, 'left', 1, 370, 390)
		 Sleep(3000)
	  Next
	  Sleep(30000)

	  For $value In $mpList
		 WinActivate($value, '')
		 Sleep(1000)

		 Local $hControl = ControlGetHandle($value, "", $mpControlClassnameNN)

		 ;~ close ad
		 MouseClick('left', 1145, 176, 1)
		 Sleep(3000)

		 ControlClick($mpTitle, $mpControlClass, $hControl, 'left', 1, 220, 550)
		 Sleep(3000)

		 ;~ if fail
		 ControlClick($mpTitle, $mpControlClass, $hControl, 'left', 1, 51, 271)
		 Sleep(3000)
	  Next
	  Sleep(3000)
   Next
EndFunc

;~ 提现功能
;~ 暂不支持批量，只随机从其中一个处理
Func WuFuXiaoCaiShenCashOut()
   ConsoleLog('task: WuFuXiaoCaiShenCashOut')

   ControlClick($mpTitle, $mpControlClass, '[CLASS:MINIGAMEVIEW; INSTANCE:1]', 'left', 1, 50, 740)
   Sleep(8000)

   ControlClick($mpTitle, $mpControlClass, '[CLASS:MINIGAMEVIEW; INSTANCE:1]', 'left', 1, 400, 240)
   Sleep(3000)

   For $i = 1 To 20
	  ConsoleLog('$i: ' & $i)

	  ControlClick($mpTitle, $mpControlClass, '[CLASS:MINIGAMEVIEW; INSTANCE:1]', 'left', 1, 220, 220)
	  Sleep(3000)

	  ControlClick($mpTitle, $mpControlClass, '[CLASS:MINIGAMEVIEW; INSTANCE:1]', 'left', 1, 220, 220)
	  Sleep(3000)

	  ControlClick($mpTitle, $mpControlClass, '[CLASS:MINIGAMEVIEW; INSTANCE:1]', 'left', 1, 220, 440)
	  Sleep(3000)

	  ControlClick($mpTitle, $mpControlClass, '[CLASS:MINIGAMEVIEW; INSTANCE:1]', 'left', 1, 220, 560)
	  Sleep(3000)
   Next

   ControlClick($mpTitle, $mpControlClass, '[CLASS:MINIGAMEVIEW; INSTANCE:1]', 'left', 1, 220, 560)
   Sleep(3000)

   ControlClick($mpTitle, $mpControlClass, '[CLASS:MINIGAMEVIEW; INSTANCE:1]', 'left', 1, 400, 100)
   Sleep(5000)

   ControlClick($mpTitle, $mpControlClass, '[CLASS:MINIGAMEVIEW; INSTANCE:1]', 'left', 1, 220, 500)
   Sleep(3000)
EndFunc
