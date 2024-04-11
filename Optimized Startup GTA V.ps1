# 啟動 GTA5
Start-Process -FilePath "legendary" -ArgumentList "launch 9d2d0eb64d5c44529cece33fe2a46482 --check-updates" -PassThru

# 等待 2 分鐘
Start-Sleep -Seconds 120

# 檢查 GTA5 是否已經啟動
$gtaProcess = Get-Process -Name "GTA5" -ErrorAction SilentlyContinue
if ($gtaProcess) {
    # 如果 GTA5 已經啟動，則終止 EpicGamesLauncher.exe
    $epicProcess = Get-Process -Name "EpicGamesLauncher" -ErrorAction SilentlyContinue
    if ($epicProcess) {
        Stop-Process -Name "EpicGamesLauncher" -Force
    }

    # 終止 PlayGTAV.exe
    Stop-Process -Name "PlayGTAV" -Force

    # 終止 RockstarErrorHandler.exe
    Stop-Process -Name "RockstarErrorHandler" -Force
}
