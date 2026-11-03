@echo off
chcp 65001 >nul
title Central Bombas SpA - Emulador Telefono Tecnico

echo =======================================================
echo    CENTRAL BOMBAS SpA - SIMULADOR TELEFONO DE TERRENO
echo =======================================================
echo.
echo [1/3] Verificando servidor local en puerto 8000...
netstat -ano | findstr :8000 >nul
if %errorlevel% neq 0 (
    echo Iniciando servidor HTTP local en segundo plano...
    start /B python -m http.server 8000 --directory "%~dp0" >nul 2>&1
) else (
    echo Servidor local activo en http://localhost:8000.
)

echo.
echo [2/3] Levantando ventana del Telefono Android...
start "" "%LOCALAPPDATA%\Android\Sdk\emulator\emulator.exe" -avd Medium_Phone_API_36.0 -gpu host

echo Esperando conexion del dispositivo...
"%LOCALAPPDATA%\Android\Sdk\platform-tools\adb.exe" wait-for-device

echo Esperando inicio del sistema operativo...
:wait_boot
for /f "tokens=*" %%a in ('"%LOCALAPPDATA%\Android\Sdk\platform-tools\adb.exe" shell getprop sys.boot_completed 2^>nul') do set BOOT=%%a
if not "%BOOT%"=="1" (
    timeout /t 2 /nobreak >nul
    goto wait_boot
)

echo.
echo [3/3] Abriendo App del Tecnico en la pantalla del telefono...
timeout /t 2 /nobreak >nul
"%LOCALAPPDATA%\Android\Sdk\platform-tools\adb.exe" shell am start -a android.intent.action.VIEW -d "http://10.0.2.2:8000/app-tecnico-centralbombas.html" >nul 2>&1

echo.
echo =======================================================
echo   LISTO! La aplicacion ya esta abierta en el telefono.
echo   Puedes usar el mouse para interactuar en la ventana.
echo =======================================================
echo.
pause
