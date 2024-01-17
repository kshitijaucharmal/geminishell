#!/bin/sh

python3 -m venv env
source env/bin/activate
pip install -r requirements.txt
pip install pyinstaller
pyinstaller "src/__main__.py" --clean -n "geminishell" --distpath target
deactivate
ln -s target/geminishell/geminishell geminishell
mkdir -p "$HOME/.config/bardshell"
cp -rf config.toml "$HOME/.config/bardshell/config.toml"

rm -r env build geminishell.spec