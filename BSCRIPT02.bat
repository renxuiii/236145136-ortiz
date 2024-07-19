@echo off
setlocal enabledelayedexpansion

pause

REM Prompt user to select a shape
echo Select a shape:
echo 1. Circle
echo 2. Triangle
echo 3. Quadrilateral
set /p shape="Enter your choice (1/2/3): "

if "%shape%"=="1" (
    REM Circle
    set /p radius="Enter the radius: "
    set /a area=314 * %radius% * %radius% / 100
    echo The area of the circle is: %area%
    pause
) else if "%shape%"=="2" (
    REM Triangle
    set /p side1="Enter the length of the first side: "
    set /p side2="Enter the length of the second side: "
    set /p side3="Enter the length of the third side: "

    set /a s=(%side1% + %side2% + %side3%) / 2
    set /a temp1=s - %side1%
    set /a temp2=s - %side2%
    set /a temp3=s - %side3%
    set /a area=s * temp1 * temp2 * temp3
    setlocal enabledelayedexpansion
    set /a area=!area!**0.5

    if %side1%==%side2% if %side2%==%side3% (
        echo The triangle is equilateral.
    ) else if %side1%==%side2% if not %side2%==%side3% (
        echo The triangle is isosceles.
    ) else if %side1%==%side3% if not %side2%==%side3% (
        echo The triangle is isosceles.
    ) else if %side2%==%side3% if not %side1%==%side3% (
        echo The triangle is isosceles.
    ) else (
        echo The triangle is scalene.
    )

    echo The area of the triangle is: !area!
    pause
) else if "%shape%"=="3" (
    REM Quadrilateral
    set /p length="Enter the length: "
    set /p width="Enter the width: "
    set /a area=%length% * %width%

    if %length%==%width% (
        echo The quadrilateral is a square.
    ) else (
        echo The quadrilateral is a rectangle.
    )

    echo The area of the quadrilateral is: %area%
    pause
) else (
    echo Invalid choice.
    pause
)

pause
exit
