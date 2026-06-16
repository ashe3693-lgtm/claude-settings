$repoPath = "C:\Users\1\.claude"
$logFile  = "$repoPath\sync-claude.log"
$maxLogLines = 500

function Write-Log($msg) {
    $line = "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') $msg"
    Add-Content -Path $logFile -Value $line
    # ログが長くなりすぎないよう末尾500行に切り詰める
    $lines = Get-Content $logFile
    if ($lines.Count -gt $maxLogLines) {
        $lines | Select-Object -Last $maxLogLines | Set-Content $logFile -Encoding utf8
    }
}

Set-Location $repoPath

# --- pull (リモートの変更を取得) ---
$pullResult = git pull 2>&1
Write-Log "PULL: $($pullResult -join ' | ')"

# --- 変更があればコミット＆push ---
$status = git status --porcelain 2>&1
if ($status) {
    git add CLAUDE.md settings.json .gitignore "projects/c--Users-1--claude/memory/" 2>&1 | Out-Null
    # 追加済みファイルがあるか確認
    $staged = git diff --cached --name-only 2>&1
    if ($staged) {
        $pcName = $env:COMPUTERNAME
        $commitMsg = "auto-sync from $pcName $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
        git commit -m $commitMsg 2>&1 | Out-Null
        $pushResult = git push 2>&1
        Write-Log "PUSH: $($pushResult -join ' | ') | files: $($staged -join ', ')"
    } else {
        Write-Log "SKIP: 同期対象ファイルに変更なし"
    }
} else {
    Write-Log "OK: 変更なし"
}
