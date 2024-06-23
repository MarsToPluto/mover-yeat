@echo off
setlocal

REM Set source and destination directories
set "SOURCE=D:\GITHUB"
set "DESTINATION=D:\GITGIT\execute-bat"

REM Check if source directory exists
if not exist "%SOURCE%" (
    echo Source directory does not exist: %SOURCE%
    exit /b 1
)

REM Check if destination directory exists, create if it does not
if not exist "%DESTINATION%" (
    mkdir "%DESTINATION%"
)

REM Copy all files and folders excluding node_modules
robocopy "%SOURCE%" "%DESTINATION%" /E /XD node_modules

REM Check if the copy operation was successful
if %errorlevel% geq 8 (
    echo Errors occurred during copying.
    exit /b 1
)

echo Files and folders copied successfully.

REM Move all files and folders from source to destination excluding node_modules
robocopy "%SOURCE%" "%DESTINATION%" /E /MOVE /XD node_modules

REM Check if the move operation was successful
if %errorlevel% geq 8 (
    echo Errors occurred during moving.
    exit /b 1
)

echo Files and folders moved successfully.

endlocal
pause
