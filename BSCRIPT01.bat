@echo off

pause

REM Open five websites
start "" "https://www.google.com"
start "" "https://www.youtube.com"
start "" "https://www.github.com"
start "" "https://www.stackoverflow.com"
start "" "https://www.wikipedia.org"

REM Launch Calculator
start calc.exe

REM Launch Notepad
start notepad.exe

pause

REM Initiate system shutdown after a brief delay (60 seconds)
shutdown /s /t 60f

exit
 