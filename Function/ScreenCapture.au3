#include <ScreenCapture.au3>

Local $file = $CmdLine[1]
Local $positionX = $CmdLine[2]
Local $positionY = $CmdLine[3]
Local $width = $CmdLine[4]
Local $height = $CmdLine[5]

_ScreenCapture_Capture($file, $positionX, $positionY, $width, $height)
