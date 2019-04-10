#!/bin/bash
set -e 

echo "Zipping $1 as $1.zip..."
zip -r $1.zip $1

echo "Installing $1.zip into ~/.../factorio/mods..."
mv $1.zip ~/Library/Application\ Support/factorio/mods

echo "Starting Factorio in sandbox..."
factorio --window-size "1440x900" --disable-audio --load-game ~/Library/Application\ Support/factorio/saves/sandbox.zip
