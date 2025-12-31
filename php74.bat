@echo off
echo ========================================
echo Starting PayrollSystem
echo ========================================
echo.

REM Check if server is already running
tasklist /FI "IMAGENAME eq php.exe" 2>NUL | find /I /N "php.exe">NUL
if "%ERRORLEVEL%"=="0" (
    echo [WARNING] PHP server might already be running!
    echo.
)

REM Start XAMPP MySQL if not running
echo [1/3] Checking MySQL...
net start | find "MySQL" >nul
if errorlevel 1 (
    echo Starting MySQL...
    net start MySQL
) else (
    echo MySQL is already running.
)
echo.

REM Clear cache (optional but good practice)
echo [2/3] Clearing Laravel cache...
C:\php74\php.exe artisan config:clear
C:\php74\php.exe artisan cache:clear
C:\php74\php.exe artisan route:clear
echo.

REM Start Laravel development server
echo [3/3] Starting Laravel server...
echo.
echo ========================================
echo Server running at: http://localhost:8000
echo Press Ctrl+C to stop the server
echo ========================================
echo.
C:\php74\php.exe artisan serve

pause