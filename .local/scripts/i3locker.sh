#!/bin/bash

# set en layout
dbus-send --dest=ru.gentoo.KbddService /ru/gentoo/KbddService ru.gentoo.kbdd.set_layout uint32:0

# lock
i3lock-fancy
