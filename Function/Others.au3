#include <Array.au3>
#include <Date.au3>

;~ 获取窗口句柄
;~ @return array 一维数组
Func WinListByTitle($title)
	Local $appList = WinList("[Title:" & $title  & "]")
	Local $total = 0
	For $i = 1 To $appList[0][0]
	   ; 7 = Window visible
	   ; 15 = Window active
	   $flag = WinGetState($appList[$i][1])
 ;~ 	  ConsoleLog('$flag: ' & $flag)
	   If $appList[$i][0] <> "" And ($flag == 7 Or $flag == 15 Or $flag == 23) Then
		  $total += 1
	   EndIf
	Next
 
	Local $winList[$total]
	For $i = 1 To $appList[0][0]
	   ; 7 = Window visible
	   ; 15 = Window active
	   $flag = WinGetState($appList[$i][1])
	   If $appList[$i][0] <> "" And ($flag == 7 Or $flag == 15 Or $flag == 23) Then
		  _ArrayPush($winList, $appList[$i][1])
		 ;~  ConsoleLog('$appList[$i][1]: ' & $appList[$i][1])
	   EndIf
	Next
 
 ;~    ConsoleLog($title & ' total: ' & $total)
 ;~    ConsoleLog('winList: ' & $winList)
 
	Return $winList
 EndFunc

;~ 获取窗口句柄
;~ @return array 一维数组
 Func WinListByTitleTo1D($title)
	Local $appList = WinList("[Title:" & $title  & "]")
	Local $total = 0
	For $i = 1 To $appList[0][0]
	   If $maxConcurrency <> 0 And $total >= $maxConcurrency Then
 ;~ 		 ConsoleLog('$total: ' & $total)
 ;~ 		 ConsoleLog('$maxConcurrency: ' & $maxConcurrency)
 ;~ 		 ConsoleLog('gt maxConcurrency: ContinueLoop')
		  ContinueLoop
	   EndIf
 
	   ; 7 = Window visible
	   ; 15 = Window active
	   $flag = WinGetState($appList[$i][1])
 ;~ 	  ConsoleLog('$flag: ' & $flag)
	   If $appList[$i][0] <> "" And ($flag == 7 Or $flag == 15 Or $flag == 23) Then
		  $total += 1
	   EndIf
	Next
 
	Local $winList[$total]
	For $i = 1 To $appList[0][0]
	   ; 7 = Window visible
	   ; 15 = Window active
	   $flag = WinGetState($appList[$i][1])
	   If $appList[$i][0] <> "" And ($flag == 7 Or $flag == 15 Or $flag == 23) Then
		  _ArrayPush($winList, $appList[$i][1])
		 ;~  ConsoleLog('$appList[$i][1]: ' & $appList[$i][1])
	   EndIf
	Next
 
 ;~    ConsoleLog($title & ' total: ' & $total)
 ;~    ConsoleLog('winList: ' & $winList)
 
	Return $winList
 EndFunc
  
;~ 获取窗口句柄
;~ @return array 二维数组
Func WinListByTitleTo2D($title)
	Local $winList = WinListByTitle($title)
	Local $total = UBound($winList)
 
	Local $key1 = Int($total / $maxConcurrency)
	Local $key2 = $maxConcurrency
	Local $mod = Mod($total, $maxConcurrency)
	If $maxConcurrency >= $total Then
		$key1 = 1
		$mod = 0
	 ElseIf $mod <> 0 Then
		 $key1 += 1
	 EndIf
	 ;~ ConsoleLog('$total: ' & $total)
	 ;~ ConsoleLog('$key1: ' & $key1)
	 ;~ ConsoleLog('$key2: ' & $key2)
	 ;~ ConsoleLog('$mod: ' & $mod)
 ;~ 	ConsoleLog('Mod($total, $maxConcurrency): ' & Mod($total, $maxConcurrency))
 ;~    ConsoleLog('$total / $maxConcurrency: ' & $total / $maxConcurrency)
	Local $winList2D[$key1][$key2]
 ;~    $winList2D[0][0] = '000'
 ;~    $winList2D[1][1] = 111
 ;~ ;~    _ArrayPush(, 11111)
 ;~    _ArrayDisplay($winList2D)
	Local $i = 0
	Local $key1 = 0
	Local $key2 = 0
		For $value In $winList
	 ;~ 	If Mod($i - 1, $maxConcurrency) == 0 Or (($key2 + 1) >= $maxConcurrency) Then
	 ;~ 		$key2 = 0
	 ;~ EndIf
 
		 If Mod($i, $maxConcurrency) == 0 Then
			 $key1 += 1
			 $key2 = 0
		 EndIf
		 
		 $i += 1
		 $key2 += 1
 
		 ;~ ConsoleLog('$i: ' & $i & ' $key1: ' & $key1 - 1 & ' $key2: ' & $key2 - 1 & ' Mod($i, $maxConcurrency): ' & Mod($i, $maxConcurrency))
		 $winList2D[$key1 - 1][$key2 - 1] = $value
 
		 ;~ If Mod($i, $maxConcurrency) == 0 Then
 
		 ;~ _ArrayPush($winList2D[$key1][$key2], $value)
	 Next
 
	 ;~ _ArrayDisplay($winList2D)
 ;~    ConsoleLog($title & ' total: ' & $total)
 ;~    ConsoleLog('winList: ' & $winList)
 
	Return $winList2D
 EndFunc
 
Func WinKillByTitle($title)
   For $i = 1 To 2
	  Local $winList = WinListByTitle($title)
	  For $value In $winList
		 WinKill($title, '')
		 Sleep(1000)
	  Next
   Next
EndFunc

Func Toast($msg)
   TrayTip('', $msg, 1)
   Sleep(1000)
EndFunc

Func ConsoleLog($msg)
   Local $tCur = _Date_Time_GetSystemTime()
   ConsoleWrite(_Date_Time_SystemTimeToDateTimeStr($tCur) & ': ' & $msg & @CRLF)
EndFunc

Func OpenWechatMP($appID)
   Local $iPID = Run(@ComSpec & " /c " & 'start D:"\Program Files (x86)"\Tencent\WeChat\WechatAppLauncher.exe -launch_appid=' & $appID, "", @SW_HIDE)
   Sleep(3000)
;~    ConsoleLog('$appID: ' & $appID & ' - $iPID: ' & $iPID)
   return $iPID
EndFunc

;暂停
Func TogglePause()
   $Paused = NOT $Paused
   While $Paused
	  Sleep(1000)
	  TrayTip("", "暂停", 1)
   WEnd
   Sleep(1000)
EndFunc
