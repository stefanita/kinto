#!/bin/bash
mkdir -p ~/.kbd/{keymap,symbols}
cp ./.xkb/symbols/chromebook ~/.xkb/symbols/chromebook
setxkbmap -option
setxkbmap -print > ~/.xkb/keymap/kbd.gui
line=$(cat ~/.testkbd/keymap/mykbd | grep -n 'xkb_symbols' | cut -f1 -d:)
sed -ie "${line}s/)\"/)+chromebook(swap_lalt_lctrl)\"/g" ~/.xkb/keymap/kbd.gui
#xkbcomp -w0 -I$HOME/.xkb ~/.xkb/keymap/kbd.gui $DISPLAY