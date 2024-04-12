# 啟動 Rockstar Launcher
$RockstarProcess = Start-Process -FilePath "C:\Program Files\Rockstar Games\Launcher\Launcher.exe" -PassThru

# 等待直到 SocialClubHelper.exe 進程開始執行
while (-not (Get-Process -Name "SocialClubHelper" -ErrorAction SilentlyContinue)) {
    Start-Sleep -Seconds 1
}

# 啟動 GTA5
Start-Process -FilePath "legendary" -ArgumentList "launch 9d2d0eb64d5c44529cece33fe2a46482 --check-updates" -PassThru

# 等待直到 GTA5.exe 進程開始執行
while (-not (Get-Process -Name "GTA5" -ErrorAction SilentlyContinue)) {
    Start-Sleep -Seconds 1
}

# 終止 RockstarErrorHandler.exe
Stop-Process -Name "RockstarErrorHandler" -ErrorAction SilentlyContinue

# 終止 PlayGTAV.exe
Stop-Process -Name "PlayGTAV" -ErrorAction SilentlyContinue

# 終止 LauncherPatcher.exe
Stop-Process -Name "LauncherPatcher" -ErrorAction SilentlyContinue
