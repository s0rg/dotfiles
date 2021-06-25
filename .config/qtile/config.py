import os
from subprocess import Popen
from typing import List  # noqa: F401

from libqtile import bar, hook, qtile
from libqtile.config import Screen

from ext.wal import make_theme

import vars

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
    vars.APPS,
    vars.MOD,
    mov_key=vars.CTRL,
    drops=vars.DROPS,
)
grp_nav = Navigator(vars.APPS)


# input

keys.extend(make_keys())
mouse = make_mouse()


# ui

theme = make_theme(
    vars.FONT_NAME,
    vars.FONT_SIZE,
    vars.FONT_BIG,
)
layouts, floating_layout = make_layouts(theme, vars.FLOATERS)
widget_defaults = make_widgets_defaults(theme)
extension_defaults = widget_defaults.copy()

screens = [Screen(
    wallpaper=theme.wallpaper,
    wallpaper_mode="fill",
    top=bar.Bar(
        make_main_bar_widgets(theme),
        vars.BAR_HEIGHT,
        background=theme.background,
    ),
)]


# hooks

# Dealing with dialog windows
@hook.subscribe.client_new
def floating_dialogs(client):
    w = client.window
    is_dialog = w.get_wm_type() in vars.DIALOGS
    if is_dialog or w.get_wm_transient_for():
        client.floating = True


# Dealing with last window in group
@hook.subscribe.client_killed
def fallback(client):
    cg = client.group

    if qtile.current_group != cg:
        return

    if len(cg.windows) > 1:
        return

    for n in grp_nav.prev_for(cg.name):
        g = qtile.groups_map[n]
        if g.windows:
            g.cmd_toscreen()
            return


@hook.subscribe.setgroup
def auto_focus():
    r = qtile.core.conn.conn.core.QueryPointer(qtile.root.wid).reply()
    win = qtile.windows_map.get(r.child, None)
    if win and win.group is qtile.current_group:
        win.group.focus(win, False)


@hook.subscribe.startup
def reload():
    Popen(vars.CMD_RELOAD)


@hook.subscribe.startup_once
def auto_start():
    os.environ["UI_FONT_NAME"] = vars.FONT_NAME
    os.environ["TERM"] = vars.CMD_TERM

    Popen(vars.CMD_START)


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

