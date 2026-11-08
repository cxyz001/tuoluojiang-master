@echo off
REM ===========================================================
REM  Tuoluojiang (Tuo Luo Jiang) - Start backend server
REM  Stack: Laravel 9 + PHP 8.2 (NTS) + MySQL 8.0 + Redis
REM ===========================================================

set "PHP_HOME=C:\Users\Administrator\AppData\Local\Microsoft\WinGet\Packages\PHP.PHP.NTS.8.2_Microsoft.Winget.Source_8wekyb3d8bbwe"
set "APP_DIR=D:\project\001\tuoluojiang-master\code"
set "HOST=127.0.0.1"
set "PORT=8000"

echo.
echo [ Tuoluojiang ] Checking runtime ...

if not exist "%PHP_HOME%\php.exe" (
    echo ERROR: PHP not found at %PHP_HOME%
    pause
    exit /b 1
)

"%PHP_HOME%\php.exe" -v | findstr /C:"PHP 8" >nul
if errorlevel 1 (
    echo ERROR: PHP runtime is broken.
    pause
    exit /b 1
)

echo [ Tuoluojiang ] PHP OK
echo [ Tuoluojiang ] Starting Laravel dev server ...
echo [ Tuoluojiang ] Admin panel : http://%HOST%:%PORT%/admin
echo [ Tuoluojiang ] Stop the server with Ctrl+C
echo.

cd /d "%APP_DIR%"
"%PHP_HOME%\php.exe" artisan serve --host=%HOST% --port=%PORT%

pause
