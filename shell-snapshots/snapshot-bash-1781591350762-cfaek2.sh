# Snapshot file
# Unset all aliases to avoid conflicts with functions
unalias -a 2>/dev/null || true
shopt -s expand_aliases
# Check for rg availability
if ! (unalias rg 2>/dev/null; command -v rg) >/dev/null 2>&1; then
  alias rg=''\''c:\Users\1\AppData\Local\Programs\Microsoft VS Code\6928394f91\resources\app\node_modules\@vscode\ripgrep-universal\bin\win32-x64\rg.exe'\'''
fi
export PATH='/c/Users/1/bin:/mingw64/bin:/usr/local/bin:/usr/bin:/bin:/mingw64/bin:/usr/bin:/c/Users/1/bin:/c/Users/1/AppData/Local/Programs/Microsoft VS Code/6928394f91/resources/app/node_modules/@vscode/ripgrep-universal/bin/win32-x64:/c/Windows/system32:/c/Windows:/c/Windows/System32/Wbem:/c/Windows/System32/WindowsPowerShell/v1.0:/c/Windows/System32/OpenSSH:/c/Program Files (x86)/NVIDIA Corporation/PhysX/Common:/c/Program Files/NVIDIA Corporation/NVIDIA NvDLISR:/c/Program Files/Intel/WiFi/bin:/c/Program Files/Common Files/Intel/WirelessCommon:/c/WINDOWS/system32:/c/WINDOWS:/c/WINDOWS/System32/Wbem:/c/WINDOWS/System32/WindowsPowerShell/v1.0:/c/WINDOWS/System32/OpenSSH:/c/PROGRA~1/JPKI:/c/Program Files (x86)/Common Files/Sony Shared/FeliCaLibrary:/c/Program Files/Common Files/Sony Shared/FeliCaLibrary:/c/Program Files/dotnet:/cmd:/c/Program Files/GitHub CLI:/c/Users/1/AppData/Local/Microsoft/WindowsApps:/c/Users/1/AppData/Local/Programs/Microsoft VS Code/bin:/c/Users/1/AppData/Local/Python/bin:/usr/bin/vendor_perl:/usr/bin/core_perl:/c/Users/1/.claude/.claude/bin:/c/Users/1/.copilot/bin:/c/Users/1/.claude/bin:/c/Users/1/AppData/Local/Programs/Microsoft VS Code/6928394f91/resources/app/extensions/copilot/assets/prompts/bin'
