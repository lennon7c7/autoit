#include <Array.au3>
#include <Date.au3>


Func WinVisibleOrActive($title)
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
		 ConsoleLog('$appList[$i][1]: ' & $appList[$i][1])
	  EndIf
   Next

;~    ConsoleLog($title & ' total: ' & $total)
;~    ConsoleLog('winList: ' & $winList)

   Return $winList
EndFunc

Func WinKillByTitle($title)
   For $i = 1 To 2
	  Local $winList = WinVisibleOrActive($title)
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
