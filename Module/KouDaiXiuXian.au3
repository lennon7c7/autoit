$appTitle = '微信'
$appList = WinListByTitleTo2D($appTitle)
$mpTitle = '口袋修仙'
$mpAppID = 'wx3e9f3febb9e9ea21'
$mpControlClass = 'MINIGAMEVIEW'
$mpControlClassnameNN = 'MINIGAMEVIEW1'

Func KouDaiXiuXianStart()
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

		 Local $hControl = ControlGetHandle($value, "", $mpControlClassnameNN)

		 ;~ close offline money
		 ControlClick($mpTitle, $mpControlClass, $hControl, 'left', 1, 400, 300)
		 Sleep(5000)
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

   For $j = 1 To 30
	  ConsoleLog('ad: ' & $j)
	  For $value In $mpList
		 WinActivate($value, '')
		 Sleep(1000)

		 Local $hControl = ControlGetHandle($value, "", $mpControlClassnameNN)

		 ControlClick($mpTitle, $mpControlClass, $hControl, 'left', 1, 275, 52)
		 Sleep(3000)

		 ;~ (start ad) || share
		 ControlClick($mpTitle, $mpControlClass, $hControl, 'left', 1, 220, 420)
		 Sleep(1000)
		 ControlClick($mpTitle, $mpControlClass, $hControl, 'left', 1, 220, 420)
		 Sleep(1000)
		 ControlClick($mpTitle, $mpControlClass, $hControl, 'left', 1, 220, 420)
		 Sleep(1000)
		 ControlClick($mpTitle, $mpControlClass, $hControl, 'left', 1, 220, 420)
		 Sleep(1000)

		 ;~ close share dialog
		 For $h = 1 To 5
			$hWnd = WinGetHandle('[Class:SelectContactWnd]')
			$sHWND = String($hWnd)
			If $sHWND > 0 Then
			   MouseClick('left', 1182, 749, 1)
			   Sleep(1000)
			EndIf

			$hWnd = WinGetHandle('[Title:提示]')
			$sHWND = String($hWnd)
			If $sHWND > 0 Then
			   MouseClick('left', 890, 590, 1)
			   Sleep(5000)
			EndIf
		 Next
	  Next
	  Sleep(30000)

	  For $value In $mpList
		 WinActivate($value, '')
		 Sleep(1000)

		 Local $hControl = ControlGetHandle($value, "", $mpControlClassnameNN)

		 ;~ close ad
		 MouseClick('left', 1145, 176, 1)
		 Sleep(3000)

		 ;~ close mask
		 ControlClick($mpTitle, $mpControlClass, $hControl, 'left', 1, 410, 30)
		 Sleep(1000)
		 ControlClick($mpTitle, $mpControlClass, $hControl, 'left', 1, 410, 30)
		 Sleep(1000)
		 ControlClick($mpTitle, $mpControlClass, $hControl, 'left', 1, 410, 30)
		 Sleep(1000)
		 ControlClick($mpTitle, $mpControlClass, $hControl, 'left', 1, 410, 30)
		 Sleep(1000)
		 ControlClick($mpTitle, $mpControlClass, $hControl, 'left', 1, 410, 30)
		 Sleep(1000)
	  Next
	  Sleep(3000)
   Next
EndFunc
