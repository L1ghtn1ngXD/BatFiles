@echo off
title Hypervisor Bypasser
color 0A

:: Проверка прав администратора
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

echo   ___ ___                                      ____   ____ ________  .__              ___.   .__                
echo  /   |   \ ___.__.______   ___________         \   \ /   / \______ \ |__| ___________ \_ |__ |  |   ___________ 
echo /    ~    <   |  |\____ \_/ __ \_  __ \  ______ \   Y   /   |    |  \|  |/  ___/\__  \ | __ \|  | _/ __ \_  __ \
echo \    Y    /\___  ||  |_> >  ___/|  | \/ /_____/  \     /    |    `   \  |\___ \  / __ \| \_\ \  |_\  ___/|  | \/
echo  \___|_  / / ____||   __/ \___  >__|              \___/    /_______  /__/____  >(____  /___  /____/\___  >__|   
echo        \/  \/     |__|        \/                                   \/        \/      \/    \/          \/       
echo 1.0 ^| For Windows
echo Search more scripts in https://github.com/L1ghtn1ngXD/BatFiles
echo Run process?

:Menu
set /p user_choice="Hyper-V Disabler (y/n) >>> "

if /i "%user_choice%"=="n" exit /b
if /i "%user_choice%"=="y" goto TurnerOff

echo Invalid input. Please type 'y' or 'n'.
goto Menu

:TurnerOff
echo.
echo [1/7] Turning off hypervisorlaunchtype...
bcdedit /set hypervisorlaunchtype off >nul 2>&1

echo [2/7] Turning off vsmlaunchtype...
bcdedit /set vsmlaunchtype off >nul 2>&1

echo [3/7] Turning off Virtualization Based Security...
reg add "HKLM\System\CurrentControlSet\Control\DeviceGuard" /v EnableVirtualizationBasedSecurity /t REG_DWORD /d 0 /f >nul 2>&1

echo [4/7] Turning off Hypervisor Enforced Code Integrity...
reg add "HKLM\System\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v Enabled /t REG_DWORD /d 0 /f >nul 2>&1

echo [5/7] Turning off Credential Guard...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v LsaCfgFlags /t REG_DWORD /d 0 /f >nul 2>&1

echo [6/7] Turning off Windows components (this may take a moment)...
dism /online /disable-feature /featurename:Microsoft-Hyper-V-All /norestart >nul 2>&1
dism /online /disable-feature /featurename:VirtualMachinePlatform /norestart >nul 2>&1
dism /online /disable-feature /featurename:HypervisorPlatform /norestart >nul 2>&1
dism /online /disable-feature /featurename:Containers-DisposableClientVM /norestart >nul 2>&1
dism /online /disable-feature /featurename:Microsoft-Windows-Subsystem-Linux /norestart >nul 2>&1

echo
echo ====================================
echo Done. Hyper-V and WindowsSandbox
echo are turned off. Press any button and
echo computer will restart in 5 seconds.
echo ====================================
echo
pause >nul
shutdown /r /t 5
