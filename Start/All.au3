#include-once
#include <../Function/Others.au3>

;暂停
Global $Paused
HotKeySet("{PAUSE}", "TogglePause")

; 我的笔记本配置最多连开3个，配置不好就不能开太多
; 我的台式配置最多连开？个，配置不好就不能开太多
$maxConcurrency = 7

#include <../Module/KouDaiXiuXian.au3>
KouDaiXiuXianStart()

#include <../Module/WuFuXiaoCaiShen.au3>
WuFuXiaoCaiShenStart()

SleepOS()
