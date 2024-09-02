#!/bin/sh

# Install using venv
if [ ! -d target ]; then
    echo "Installing..."
    python3 -m venv env
    source env/bin/activate
    pip install -r requirements.txt
    pip install pyinstaller
    pyinstaller "src/__main__.py" --clean -n "geminishell" --distpath target
    deactivate

    # Remove redundant
    rm -r env build geminishell.spec
    echo "Installed."
else
    echo "target exists."
fi

# Link to local bin
echo "Linking to .local/bin"
ln -sf "$(pwd)/target/geminishell/geminishell" ~/.local/bin/geminishell

URL="https://makersuite.google.com/app/apikey"

# Config setup
if [ ! -f "$HOME/.config/geminishell/config.toml" ]; then
    echo "Config file doesn't exist"
    echo "Please create an API Key and copy-paste it in the terminal"
    echo "Press \"Enter\" to open ($URL) in $BROWSER: "
    read -n 1
    $BROWSER $URL
    echo "Enter API Key: "
    read GOOGLE_API_KEY

    mkdir -p "$HOME/.config/geminishell"
    sed "s/<your api key>/$GOOGLE_API_KEY/" config.toml > "$HOME/.config/geminishell/config.toml"

    echo "Created config file"
fi

echo "Done."
