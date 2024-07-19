@echo off
setlocal enabledelayedexpansion

pause

:menu
echo Select a utility:
echo 1. ipconfig
echo 2. tasklist
echo 3. taskkill
echo 4. chkdsk
echo 5. format
echo 6. defrag
echo 7. find
echo 8. attrib
set /p choice="Enter your choice (1-8): "

if "%choice%"=="1" (
    ipconfig
) else if "%choice%"=="2" (
    tasklist
) else if "%choice%"=="3" (
    set /p pid="Enter the PID or name of the task to kill: "
    taskkill /F /PID %pid%
) else if "%choice%"=="4" (
    set /p drive="Enter the drive letter to check (e.g., C:): "
    chkdsk %drive%
) else if "%choice%"=="5" (
    set /p drive="Enter the drive letter to format (e.g., D:): "
    format %drive%
) else if "%choice%"=="6" (
    set /p drive="Enter the drive letter to defrag (e.g., C:): "
    defrag %drive%
) else if "%choice%"=="7" (
    set /p pattern="Enter the pattern to find: "
    set /p file="Enter the file to search: "
    find "%pattern%" %file%
) else if "%choice%"=="8" (
    set /p file="Enter the file to change attributes: "
    set /p attrs="Enter the attributes (e.g., +r -s): "
    attrib %attrs% %file%
) else (
    echo Invalid choice.
)

pause
goto menu

exit
