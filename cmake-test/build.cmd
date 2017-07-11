@ECHO OFF

SET PATH_ROOT="C:"
SET BUILD_DIR=build

SET CMAKE_BIN="%PATH_ROOT%\cmake-3.7.0-win64-x64\bin\cmake.exe"
SET VS_ENV="c:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\Tools\vsvars32.bat"

SET PROJ_DIR=.
SET PROJ_NAME=HELLO
SET PORJ_CMAKE_OPT= ^

:MAIN
cls
echo. 1 - cmake.
echo. 2 - build.
echo. 3 - clean.
echo. x - Exit.
echo.

:MENU
set /p mainmenu=请选择功能:
if '%mainmenu%'=='1' (goto MAIN_CMAKE)
if '%mainmenu%'=='2' (goto MAIN_BUILD)
if '%mainmenu%'=='3' (goto MAIN_CLEAN)
if '%mainmenu%'=='x' exit
echo.
echo.请选择一个有效的功能,按任意键返回!
pause
goto MAIN

:MAIN_CMAKE
mkdir %PROJ_DIR%\%BUILD_DIR%
cd %PROJ_DIR%\%BUILD_DIR%
%CMAKE_BIN% -G "Visual Studio 12 2013 Win64" .. %PORJ_CMAKE_OPT%
goto PAUSE_MENU

:MAIN_BUILD
call %VS_ENV%
cd %PROJ_DIR%\%BUILD_DIR%
call msbuild.exe %PROJ_NAME%.sln /p:Configuration=Release
goto PAUSE_MENU

:MAIN_CLEAN
rd /q /s %PROJ_DIR%\%BUILD_DIR%
goto PAUSE_MENU

:PAUSE_MENU
echo.操作完成，按任意键返回主菜单!
pause >nul
goto MAIN
