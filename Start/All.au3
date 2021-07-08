#include-once
#include <../Function/Others.au3>

;暂停
Global $Paused
HotKeySet("{PAUSE}", "TogglePause")

; 我的笔记本配置最多连开3个，配置不好就不能开太多
; 我的台式配置最多连开？个，配置不好就不能开太多
$maxConcurrency = 12

#include <../Module/KouDaiXiuXian.au3>
#include <../Module/WuFuXiaoCaiShen.au3>

For $i = 1 To 3
   KouDaiXiuXianStart()

   WuFuXiaoCaiShenStart()
Next

SleepOS()
