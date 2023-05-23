@echo off
rem Зчитування поточного значення герцовки монітора
for /f "tokens=2 delims=:" %%a in ('qres.exe /r') do set "previous_refresh_rate=%%a"

rem Зміна герцовки на 60 Гц
qres.exe /r:60

rem Запуск гри або програми
start yuzu.exe

:check_game
rem Перевірка, чи активна гра
tasklist /fi "imagename eq yuzu.exe" 2>nul | find /i "yuzu.exe" >nul
if errorlevel 1 (
    rem Гра була закрита, повернення до попередньої герцовки
    qres.exe /r:%previous_refresh_rate%
) else (
    rem Гра все ще активна, продовження перевірки
    timeout /t 2 >nul
    goto check_game
)