import os
from subprocess import Popen
from typing import List  # noqa: F401

from libqtile import bar, hook, qtile
from libqtile.config import Screen

from ext.wal import make_theme

import variables

from grouper import (
    Navigator,
    make_groups,
)
from input import (
    make_keys,
    make_mouse,
)
from view import (
    make_layouts,
    make_widgets_defaults,
    make_main_bar_widgets,
)


# groups

groups, keys = make_groups(
    variables.APPS,
    variables.MOD,
    mov_key=variables.CTRL,
    drops=variables.DROPS,
)
grp_nav = Navigator(variables.APPS)


# input

keys.extend(make_keys())
mouse = make_mouse()


# ui

theme = make_theme(
    variables.FONT_NAME,
    variables.FONT_SIZE,
    variables.FONT_BIG,
)
layouts, floating_layout = make_layouts(theme, variables.FLOATERS)
widget_defaults = make_widgets_defaults(theme)
extension_defaults = widget_defaults.copy()

screens = [Screen(
    wallpaper=theme.wallpaper,
    wallpaper_mode="fill",
    top=bar.Bar(
        make_main_bar_widgets(theme),
        variables.BAR_HEIGHT,
        background=theme.background,
    ),
)]


# hooks

# Dealing with dialog windows
@hook.subscribe.client_new
def floating_dialogs(client):
    win = client.window
    is_dialog = win.get_wm_type() in variables.DIALOGS
    if is_dialog or win.get_wm_transient_for():
        client.floating = True
        win.cmd_bring_to_front()
        win.cmd_focus()


# Dealing with last window in group
@hook.subscribe.client_killed
def fallback(client):
    grp = client.group

    if qtile.current_group != grp:
        return

    if len(grp.windows) > 1:
        return

    for name in grp_nav.prev_for(grp.name):
        grp = qtile.groups_map[name]
        if grp.windows:
            grp.cmd_toscreen()
            return


@hook.subscribe.setgroup
def auto_focus():
    for win in qtile.currentGroup.windows:
        if win.floating:
            win.cmd_bring_to_front()
            win.cmd_focus()
            return

    cur = qtile.core.conn.conn.core.QueryPointer(qtile.root.wid).reply()
    win = qtile.windows_map.get(cur.child, None)
    if win and win.group is qtile.current_group:
        win.group.focus(win, False)


@hook.subscribe.startup
def reload():
    Popen(variables.CMD_RELOAD)


@hook.subscribe.startup_once
def auto_start():
    os.environ["UI_FONT_NAME"] = variables.FONT_NAME

    Popen(variables.CMD_START)


# main

wmname = "Qtile"
focus_on_window_activation = "smart"

reconfigure_screens = True
follow_mouse_focus = True
bring_front_click = True
auto_fullscreen = True
auto_minimize = True
cursor_warp = False

dgroups_key_binder = None
dgroups_app_rules = []  # type: List

main = None  # WARNING: this is deprecated and will be removed soon
