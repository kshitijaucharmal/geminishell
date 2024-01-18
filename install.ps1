Set-ExecutionPolicy Bypass -Scope Process -Force
# Install using venv
If (-not (Test-Path target)) {
    Write-Host "Installing..."
    python -m venv env
    env\Scripts\Activate.ps1
    pip install -r requirements.txt
    pip install pyinstaller
    pyinstaller "src/__main__.py" --clean -n "geminishell" --distpath target
    env\Scripts\Deactivate.ps1

    # Remove redundant
    Remove-Item -Recurse env build geminishell.spec
    Write-Host "Installed."
}
else {
    Write-Host "target exists."
}

# Permanently add to path
$path = "$env:Path"
if ($path -notlike "*$(Get-Location)\target\geminishell*") {
    $path += ";$(Get-Location)\target\geminishell"
    [Environment]::SetEnvironmentVariable("Path", $path, "User")
    Write-Host "Added to path."
}

# Add to path
$env:Path += ";$(Get-Location)\target\geminishell"

# Config setup
If (-not (Test-Path "$HOME\.config\geminishell\config.toml")) {
    Write-Host "Config file doesn't exist"
    Write-Host "Enter API Key (https://makersuite.google.com/app/apikey): "
    $GOOGLE_API_KEY = Read-Host

    mkdir "$HOME\.config\geminishell"
    (Get-Content config.toml) -replace '<your api key>', $GOOGLE_API_KEY | Set-Content "$HOME\.config\geminishell\config.toml"

    Write-Host "Created config file"
}

Write-Host "Done."
