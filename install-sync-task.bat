@echo off
chcp 65001 > nul
echo Claude自動同期タスクを登録します...

schtasks /Create /TN "ClaudeAutoSync" /TR "powershell.exe -NonInteractive -WindowStyle Hidden -ExecutionPolicy Bypass -File \"C:\Users\1\.claude\sync-claude.ps1\"" /SC ONLOGON /RL LIMITED /F
if %errorlevel% neq 0 goto error

schtasks /Create /TN "ClaudeAutoSync30min" /TR "powershell.exe -NonInteractive -WindowStyle Hidden -ExecutionPolicy Bypass -File \"C:\Users\1\.claude\sync-claude.ps1\"" /SC MINUTE /MO 30 /RL LIMITED /F
if %errorlevel% neq 0 goto error

echo.
echo 登録完了！
echo  - ログイン時に自動同期
echo  - 30分ごとに自動同期
echo.
pause
exit /b 0

:error
echo.
echo エラーが発生しました。管理者として実行してください。
echo （このファイルを右クリック→「管理者として実行」）
pause
exit /b 1
