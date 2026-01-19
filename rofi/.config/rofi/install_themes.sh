#!/bin/sh

mkdir tmp_themes
cd tmp_themes
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi
chmod +x setup.sh
./setup.sh
