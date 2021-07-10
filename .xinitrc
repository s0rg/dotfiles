systemctl --user import-environment DISPLAY

setxkbmap \
    -model pc105 \
    -layout us,ru \
    -option terminate:ctrl_alt_bksp,grp:ctrl_shift_toggle

xset m 20/10 10 r rate 400 30 b on s 600

# exec qtile start

