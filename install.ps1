# This is generated from install.sh by gemini
#
# Install using virtual environment
if (-not (Test-Path -Path "target")) {
    Write-Host "Installing..."

    # Create virtual environment and activate
    python -m venv env
    .\env\Scripts\Activate.ps1

    # Install dependencies and PyInstaller
    pip install -r requirements.txt
    pip install pyinstaller

    # Build the executable using PyInstaller
    pyinstaller "src\__main__.py" --clean -n "geminishell" --distpath target

    # Deactivate virtual environment
    Deactivate

    # Cleanup redundant files
    Remove-Item -Recurse -Force env, build, geminishell.spec

    Write-Host "Installed."
} else {
    Write-Host "target exists."
}

# Copy executable to Program Files (or another system-wide location)
$exePath = (Join-Path (Get-Location) "target\geminishell\geminishell.exe")
$destPath = "C:\Program Files\geminishell\geminishell.exe"

if (-not (Test-Path -Path "C:\Program Files\geminishell")) {
    New-Item -ItemType Directory -Path "C:\Program Files\geminishell"
}

Copy-Item -Path $exePath -Destination $destPath -Force

# Add to system PATH if not already there
if (-not $env:Path -contains "C:\Program Files\geminishell") {
    [System.Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Program Files\geminishell", [System.EnvironmentVariableTarget]::Machine)
    Write-Host "Added geminishell to system PATH. You may need to restart your shell."
} else {
    Write-Host "geminishell already in system PATH."
}

# Open browser for API key setup
$URL = "https://makersuite.google.com/app/apikey"
$configPath = Join-Path $env:APPDATA "geminishell\config.toml"

if (-not (Test-Path -Path $configPath)) {
    Write-Host "Config file doesn't exist"
    Write-Host "Please create an API Key and copy-paste it in the terminal"
    Write-Host "Press Enter to open ($URL) in your default browser:"
    Read-Host
    Start-Process $URL
    $googleApiKey = Read-Host -Prompt "Enter API Key"

    # Create the config directory if it doesn't exist
    $configDir = Split-Path $configPath
    if (-not (Test-Path -Path $configDir)) {
        New-Item -ItemType Directory -Path $configDir
    }

    # Replace API key in the config template and save
    $configTemplate = Get-Content -Path "config.toml"
    $configTemplate = $configTemplate -replace "<your api key>", $googleApiKey
    Set-Content -Path $configPath -Value $configTemplate

    Write-Host "Created config file."
}

Write-Host "Done."
