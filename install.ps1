# Install using venv
if (-not (Test-Path "target")) {
    Write-Host "Installing..."
    python -m venv env
    .\env\Scripts\Activate.ps1
    pip install -r requirements.txt
    pip install pyinstaller
    pyinstaller "src\__main__.py" --clean -n "geminishell" --distpath target
    Deactivate

    # Remove redundant
    Remove-Item -Recurse -Force env, build, geminishell.spec
    Write-Host "Installed."
} else {
    Write-Host "target exists."
}

# Link to local bin
Write-Host "Linking to .local/bin"
$targetPath = "$env:USERPROFILE\.local\bin"
if (-not (Test-Path $targetPath)) {
    New-Item -ItemType Directory -Path $targetPath -Force
}
$geminishellPath = Join-Path -Path (Get-Location) -ChildPath "target\geminishell\geminishell.exe"
New-Item -ItemType SymbolicLink -Path "$targetPath\geminishell.exe" -Target $geminishellPath -Force

$URL = "https://makersuite.google.com/app/apikey"

# Config setup
$configPath = "$env:USERPROFILE\.config\geminishell\config.toml"
if (-not (Test-Path $configPath)) {
    Write-Host "Config file doesn't exist"
    Write-Host "Please create an API Key and copy-paste it in the terminal"
    Write-Host "Press `Enter` to open ($URL) in your default web browser."
    Read-Host
    Start-Process $URL
    $GOOGLE_API_KEY = Read-Host "Enter API Key"

    $configDir = Split-Path -Parent $configPath
    if (-not (Test-Path $configDir)) {
        New-Item -ItemType Directory -Path $configDir -Force
    }
    Get-Content "config.toml" | ForEach-Object { $_ -replace "<your api key>", $GOOGLE_API_KEY } | Set-Content $configPath

    Write-Host "Created config file"
}

Write-Host "Done."

