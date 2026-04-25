@echo off
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ===========================
    echo Error! Run the script with
    echo administrative privelegies.
    echo Press any button to leave.
    echo ===========================
    pause >nul
    exit /b
)

echo Loading...
title File Deleter
ping -c 1 0.0.0.0 >nul
cls

echo
echo ___________.__.__           ________         .__          __                
echo \_   _____/|__|  |   ____   \______ \   ____ |  |   _____/  |_  ___________ 
echo  |    __)  |  |  | _/ __ \   |    |  \_/ __ \|  | _/ __ \   __\/ __ \_  __ \
echo  |     \   |  |  |_\  ___/   |    `   \  ___/|  |_\  ___/|  | \  ___/|  | \/
echo  \___  /   |__|____/\___  > /_______  /\___  >____/\___  >__|  \___  >__|   
echo      \/                 \/          \/     \/          \/          \/       
echo 1.0 | For Windows
echo Search more scripts in https://github.com/L1ghtn1ngXD/BatFiles
echo Enter the path:
set /p user_path="FileDeleter >>> "
del /f /s /q "%user_path%"
echo
echo =====================================
echo Done. Files are deleted.
echo Press any button to leave the program
echo =====================================
pause >nul
exit