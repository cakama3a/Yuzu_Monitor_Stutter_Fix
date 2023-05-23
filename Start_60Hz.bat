@echo off
set my_Hz=75

qres.exe /r:60
start yuzu.exe
:check_game
tasklist /fi "imagename eq yuzu.exe" 2>nul | find /i "yuzu.exe" >nul
if errorlevel 1 (
    qres.exe /r:%my_Hz%
) else (
    timeout /t 2 >nul
    goto check_game
)