#!/bin/bash

setxkbmap \
    -model pc105 \
    -layout us,ru \
    -option terminate:ctrl_alt_bksp,grp:ctrl_shift_toggle

xset m 20/10 10 r rate 400 30 b on s 600

xss-lock wal-xsecurelock &

kbdd

# network tray
nm-applet &

# media mounter
udiskie -a -s --file-manager=pcmanfm-qt --terminal=kitty &

# bluetooth stuff
# blueman-applet &

# fix terminal size for some TUI apps
unset LINES
unset COLUMNS

