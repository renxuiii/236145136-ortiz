@echo off
setlocal enabledelayedexpansion

pause

REM Sort text files by date and move older files to Drive Z:
for /F "tokens=*" %%A in ('dir /b /a-d /o-d "C:\*.txt"') do (
    move "C:\%%A" "Z:\"
)

REM Sort files in Drive Z: by size
for /F "tokens=*" %%A in ('dir /b /a-d /o-s "Z:\*.txt"') do (
    echo %%~zA "%%A" >> Z:\sorted_files.txt
)

REM Prompt user for permission to delete old, large files
echo The following are the old, large files in Drive Z:
type Z:\sorted_files.txt
choice /c yn /m "Do you want to delete these files? (y/n): "

if errorlevel 2 (
    echo Files not deleted.
) else if errorlevel 1 (
    for /F "tokens=2*" %%A in (Z:\sorted_files.txt) do del "Z:\%%B"
    echo Files deleted.
)

pause

exit
