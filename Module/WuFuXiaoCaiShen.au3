$appTitle = '微信'
$appList = WinVisibleOrActive($appTitle)
$mpTitle = '五福小财神'
$mpAppID = 'wx45300ccbed485ae0'

Func WuFuXiaoCaiShenStart()
   WuFuXiaoCaiShenLaunchMP()

   WuFuXiaoCaiShenTaskAd()

   WinKillByTitle($mpTitle)
EndFunc


Func WuFuXiaoCaiShenLaunchMP()
   ConsoleLog('$mpTitle: ' & $mpTitle)

   WinKillByTitle($mpTitle)

   For $h = 1 To 2
	  For $value In $appList
		 WinActivate($value, '')
		 Sleep(3000)
		 OpenWechatMP($mpAppID)
	  Next
	  Sleep(15000)
	  WinKillByTitle($mpTitle)
   Next

   For $value In $appList
	  WinActivate($value, '')
	  Sleep(3000)
	  OpenWechatMP($mpAppID)
   Next
   Sleep(15000)
EndFunc

Func WuFuXiaoCaiShenTaskAd()
   WinMinimizeAll()
   Sleep(1000)

   $mpList = WinVisibleOrActive($mpTitle)
   For $value In $mpList
	  WinActivate($value, '')
	  Sleep(1000)
	  ; nav bar: liandan
	  MouseClick('left', 560, 210, 1)
	  Sleep(1000)
   Next
   Sleep(3000)

   For $value In $mpList
	  WinActivate($value, '')
	  Sleep(1000)
	  ; offline2
	  MouseClick('left', 680, 500, 1)
	  Sleep(1000)
   Next
   Sleep(3000)

   For $value In $mpList
	  WinActivate($value, '')
	  Sleep(1000)
	  ; lottery
	  MouseClick('left', 550, 200, 1)
	  Sleep(1000)
   Next
   Sleep(3000)

   For $value In $mpList
	  WinActivate($value, '')
	  Sleep(1000)
	  ; gongxianhongbao
	  MouseClick('left', 561, 627, 1)
	  Sleep(1000)
   Next
   Sleep(5000)

   For $j = 1 To 50
	  ConsoleLog('ad: ' & $j)
	  For $value In $mpList
		 WinActivate($value, '')
		 Sleep(1000)
		 ; button:
		 MouseClick('left', 681, 224, 1)
		 Sleep(1000)
		 MouseClick('left', 681, 224, 1)
		 Sleep(1000)
		 MouseClick('left', 681, 224, 1)
		 Sleep(1000)

		 ; button: (start ad) || share
		 MouseClick('left', 684, 484, 1)
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
	  Next
	  Sleep(3000)
   Next
EndFunc
