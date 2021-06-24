from libqtile.lazy import lazy
from libqtile.config import (
    Click,
    Drag,
    Key,
    KeyChord,
)

from ext import rofifox, rofioff
from custom import backlight, touchpad

import vars


def make_keys():
    return [
        # Switch between windows
        Key([vars.MOD], "h", lazy.layout.left(), desc="Move focus to left"),
        Key([vars.MOD], "l", lazy.layout.right(), desc="Move focus to right"),
        Key([vars.MOD], "j", lazy.layout.down(), desc="Move focus down"),
        Key([vars.MOD], "k", lazy.layout.up(), desc="Move focus up"),

        # Grow windows. If current window is on the edge of screen and direction
        # will be to screen edge - window would shrink.
        Key([vars.MOD, vars.CTRL], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
        Key([vars.MOD, vars.CTRL], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
        Key([vars.MOD, vars.CTRL], "j", lazy.layout.grow_down(), desc="Grow window down"),
        Key([vars.MOD, vars.CTRL], "k", lazy.layout.grow_up(), desc="Grow window up"),
        Key([vars.MOD, vars.CTRL], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

        Key([vars.MOD, vars.CTRL], "r", lazy.restart(), desc="Restart Qtile"),

        # Movement between groups
        Key([vars.MOD], "Left", lazy.screen.prev_group(skip_empty=True), desc="Prev group"),
        Key([vars.MOD], "Right", lazy.screen.next_group(skip_empty=True), desc="Next group"),

        # Movement between windows
        Key([vars.MOD], "Up", lazy.group.next_window(), desc="Next window"),
        Key([vars.MOD], "Down", lazy.group.prev_window(), desc="Prev window"),

        # Utils
        Key([vars.MOD], "Return", lazy.spawn(vars.CMD_TERM), desc="Launch terminal"),
        Key([vars.MOD], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
        Key([vars.MOD], "s", lazy.widget["widgetbox"].toggle(), desc="Toggle widgetbox"),

        # Toggles
        KeyChord([vars.MOD], "t", [
            Key([], "r", lazy.spawn(vars.CMD_REDSHIFT_TOGGLE), desc="Toggle redshift"),
            Key([], "t", touchpad.toggle(), desc="Toggle touchpad"),
            Key([], "m", lazy.widget["volumeindicator"].toggle_mic(), desc="Toggle mic"),
            # Key([], "n", lazy.spawn("dunstctl set-paused toggle"), desc="Toggle dunst notifies"),
        ], mode="toggle"),

        # Rofi
        KeyChord([vars.MOD], "r", [
            Key([], "r", lazy.spawn(vars.CMD_ROFI_COMBI), desc="Combi menu"),
            Key([], "w", lazy.spawn(vars.CMD_ROFI_WINDOWS), desc="Windows menu"),
            Key([], "q", lazy.spawn(rofioff.COMMAND), desc="Rofioff menu"),
            Key([], "f", lazy.spawn(rofifox.COMMAND), desc="Rofifox menu"),
        ], mode="rofi"),

        # Window handling
        KeyChord([vars.MOD], "w", [
            Key([], "k", lazy.window.kill(), desc="Kill focused window"),
            Key([], "x", lazy.spawn("xkill"), desc="Spawn xkill"),
            Key([], "f", lazy.window.toggle_fullscreen(),
                desc="Toggle fullscreen on currently focused window"),
            Key([], "v", lazy.window.toggle_floating(),
                desc="Toggle floating on currently focused window"),
        ], mode="window"),

        # Multimedia keys
        Key([], "XF86AudioMute", lazy.widget["volumeindicator"].toggle_vol(), desc="Toggle volume"),
        Key([], "XF86AudioRaiseVolume", lazy.widget["volumeindicator"].vol_inc(), desc="Volume inc"),
        Key([], "XF86AudioLowerVolume", lazy.widget["volumeindicator"].vol_dec(), desc="Volume dec"),

        Key([], "XF86MonBrightnessUp", backlight.inc()),
        Key([], "XF86MonBrightnessDown", backlight.dec()),

        Key([], "XF86AudioPlay", lazy.spawn(vars.CMD_CMUS_PLAY_PAUSE)),
        Key([], "XF86AudioNext", lazy.spawn(vars.CMD_CMUS_NEXT)),
        Key([], "XF86AudioPrev", lazy.spawn(vars.CMD_CMUS_PREV)),

        Key([], "Print", lazy.spawn(vars.CMD_SCREENSHOT), desc="Spawn flameshot gui"),
        Key([vars.ALT], "Print", lazy.spawn(vars.CMD_SCREENSHOT_ALT),
            desc="Takes screenshot of entire screen to clipboard"),
    ]


def make_mouse():
    return [
        Drag([vars.MOD], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
        Drag([vars.MOD], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
        Click([vars.MOD], "Button1", lazy.window.bring_to_front())
    ]

