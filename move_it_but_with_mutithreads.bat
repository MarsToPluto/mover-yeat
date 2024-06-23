@echo off
setlocal

REM Set source and destination directories
set "SOURCE=D:\pluto"
set "DESTINATION=D:\mermaid\execute-bat"

REM Check if source directory exists
if not exist "%SOURCE%" (
    echo Source directory does not exist: %SOURCE%
    exit /b 1
)

REM Check if destination directory exists, create if it does not
if not exist "%DESTINATION%" (
    mkdir "%DESTINATION%"
)

REM Set number of threads for robocopy
set "THREADS=16"  REM You can adjust this number as needed (up to 128)

REM Copy all files and folders excluding node_modules
robocopy "%SOURCE%" "%DESTINATION%" /E /XD node_modules /MT:%THREADS%

REM Check if the copy operation was successful
if %errorlevel% geq 8 (
    echo Errors occurred during copying.
    exit /b 1
)

echo Files and folders copied successfully.

REM Move all files and folders from source to destination excluding node_modules
robocopy "%SOURCE%" "%DESTINATION%" /E /MOVE /XD node_modules /MT:%THREADS%

REM Check if the move operation was successful
if %errorlevel% geq 8 (
    echo Errors occurred during moving.
    exit /b 1
)

echo Files and folders moved successfully.

endlocal
pause
