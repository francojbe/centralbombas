# Central Bombas SpA - Lanzador Emulador Android
Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host "   CENTRAL BOMBAS SpA - SIMULADOR TELEFONO DE TERRENO  " -ForegroundColor Cyan
Write-Host "=======================================================" -ForegroundColor Cyan

# 1. Servidor HTTP
$testPort = Get-NetTCPConnection -LocalPort 8000 -ErrorAction SilentlyContinue
if (-not $testPort) {
    Write-Host "[1/3] Iniciando servidor HTTP local en puerto 8000..." -ForegroundColor Yellow
    Start-Process python -ArgumentList "-m http.server 8000 --directory '$PSScriptRoot'" -WindowStyle Hidden
} else {
    Write-Host "[1/3] Servidor local activo en puerto 8000." -ForegroundColor Green
}

# 2. Iniciar Emulador
Write-Host "[2/3] Levantando ventana del Telefono Android..." -ForegroundColor Yellow
$emuPath = "$env:LOCALAPPDATA\Android\Sdk\emulator\emulator.exe"
$adbPath = "$env:LOCALAPPDATA\Android\Sdk\platform-tools\adb.exe"

Start-Process $emuPath -ArgumentList "-avd Medium_Phone_API_36.0 -gpu host"

Write-Host "Esperando inicio del emulador..." -ForegroundColor Gray
& $adbPath wait-for-device

do {
    Start-Sleep -Seconds 2
    $boot = (& $adbPath shell getprop sys.boot_completed).Trim()
} while ($boot -ne "1")

# 3. Lanzar Navegador
Write-Host "[3/3] Abriendo App del Tecnico en la pantalla..." -ForegroundColor Green
Start-Sleep -Seconds 2
& $adbPath shell am start -a android.intent.action.VIEW -d "http://10.0.2.2:8000/app-tecnico-centralbombas.html"

Write-Host "`n✔ LISTO! El telefono esta visible en tu pantalla y listo para interactuar.`n" -ForegroundColor Green
