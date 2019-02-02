@echo off

set sn=
set dir=%date:~0,4%%date:~5,2%%date:~8,2%
set tm=%time:~0,2%%time:~3,2%%time:~6,2%
if not exist %dir% mkdir %dir%

REM adb wait-for-device
REM adb devices

adb shell getprop ro.serialno > sn.txt
for /f %%i in (sn.txt) do set sn=%%i
if defined sn goto continue
:fail
  echo "Failed, please check the connection."
  goto end
:continue
mkdir "%dir%\%sn%_%tm%"
mkdir "%dir%\%sn%_%tm%\anr\"
echo "%dir%\%sn%_%tm%"

start cmd "main" /c "adb logcat -v time -b main > "%dir%\%sn%_%tm%\main.log""
start cmd "system" /c "adb logcat -v time -b system > "%dir%\%sn%_%tm%\system.log""
start cmd "radio" /c "adb logcat -v time -b radio > "%dir%\%sn%_%tm%\radio.log""
start cmd "crash" /c "adb logcat -v time -b crash > "%dir%\%sn%_%tm%\crash.log""
start cmd "anr" /c "adb pull /data/anr/ "%dir%\%sn%_%tm%""
adb shell dmesg > "%dir%\%sn%_%tm%\kernel.log"
:end
del sn.txt
pause
