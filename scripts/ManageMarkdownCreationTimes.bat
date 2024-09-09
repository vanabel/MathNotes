@echo off
setlocal

:: Prompt for the directory path
set /p "directory=Enter the directory path (e.g., C:\path\to\markdown\files): "

:: Validate if the directory exists
if not exist "%directory%" (
    echo The directory does not exist.
    exit /b
)

:: Define the file to store creation times
set "timestamps_file=%directory%\creation_times.txt"

:: Function to store creation times
if "%1"=="store" (
    echo Storing creation times...
    :: Clear the timestamps file
    rm "%timestamps_file%"

    for %%f in ("%directory%\*.md") do (
        :: Retrieve the creation time and append to the timestamps file
        powershell -Command "(Get-Item '%%f').CreationTime.ToString('yyyy-MM-dd HH:mm:ss')" >> "%timestamps_file%"
        echo %%f >> "%timestamps_file%"
    )
    echo Creation times stored in %timestamps_file%
    exit /b
)

:: Function to restore creation times
if "%1"=="restore" (
    echo Restoring creation times...
    setlocal enabledelayedexpansion
    set restoring=false
    for /f "tokens=1* delims=" %%a in (%timestamps_file%) do (
        set line=%%a
        if not "!line!"=="" (
            if "!restoring!"=="true" (
                :: Restore the creation time using PowerShell
                powershell -Command "(Get-Item '!line!').CreationTime = '!date!'"
                set restoring=false
            ) else (
                :: Store the creation time
                set date=!line!
                set restoring=true
            )
        )
    )
    echo Creation times restored!
    exit /b
)

:: Instructions
echo Usage: 
echo.
echo To store creation times: script.bat store
echo To restore creation times: script.bat restore

endlocal