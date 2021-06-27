from libqtile.lazy import lazy
from libqtile.config import (
    Click,
    Drag,
    Key,
    KeyChord,
)

from ext import rofifox, rofioff
from custom import backlight, touchpad

import variables


def make_keys():
    return [
        # Grow windows. If current window is on the edge of screen and direction
        # will be to screen edge - window would shrink.
        Key([variables.MOD, variables.CTRL],
            "Left",
            lazy.layout.grow_left(),
            desc="Grow window to the left"),
        Key([variables.MOD, variables.CTRL],
            "Right",
            lazy.layout.grow_right(),
            desc="Grow window to the right"),
        Key([variables.MOD, variables.CTRL],
            "Up",
            lazy.layout.grow_up(),
            desc="Grow window up"),
        Key([variables.MOD, variables.CTRL],
            "Down",
            lazy.layout.grow_down(),
            desc="Grow window down"),
        Key([variables.MOD, variables.CTRL],
            "n",
            lazy.layout.normalize(),
            desc="Reset all window sizes"),
        Key([variables.MOD, variables.CTRL],
            "r",
            lazy.restart(),
            desc="Restart Qtile"),

        # Movement between groups
        Key([variables.MOD],
            "Left",
            lazy.screen.prev_group(skip_empty=True),
            desc="Prev group"),
        Key([variables.MOD],
            "Right",
            lazy.screen.next_group(skip_empty=True),
            desc="Next group"),

        # Movement between windows
        Key([variables.MOD],
            "Up",
            lazy.group.next_window(),
            desc="Next window"),
        Key([variables.MOD],
            "Down",
            lazy.group.prev_window(),
            desc="Prev window"),

        # Utils
        Key([variables.MOD],
            "Return",
            lazy.spawn(variables.CMD_TERM),
            desc="Launch terminal"),
        Key([variables.MOD],
            "Tab",
            lazy.next_layout(),
            desc="Toggle between layouts"),
        Key([variables.MOD],
            "s",
            lazy.widget["widgetbox"].toggle(),
            desc="Toggle widgetbox"),

        # Toggles
        KeyChord([variables.MOD],
                 "t", [
                     Key([],
                         "r",
                         lazy.spawn(variables.CMD_REDSHIFT_TOGGLE),
                         desc="Toggle redshift"),
                     Key([], "t", touchpad.toggle(), desc="Toggle touchpad"),
                     Key([],
                         "m",
                         lazy.widget["volumeindicator"].toggle_mic(),
                         desc="Toggle mic"),
                 ],
                 mode="toggle"),

        # Rofi
        KeyChord(
            [variables.MOD],
            "r", [
                Key([],
                    "r",
                    lazy.spawn(variables.CMD_ROFI_COMBI),
                    desc="Combi menu"),
                Key([],
                    "w",
                    lazy.spawn(variables.CMD_ROFI_WINDOWS),
                    desc="Windows menu"),
                Key([], "q", lazy.spawn(rofioff.COMMAND), desc="Rofioff menu"),
                Key([], "f", lazy.spawn(rofifox.COMMAND), desc="Rofifox menu"),
            ],
            mode="rofi"),

        # Window handling
        KeyChord(
            [variables.MOD],
            "w",
            [
                Key([], "k", lazy.window.kill(), desc="Kill focused window"),
                Key([], "x", lazy.spawn("xkill"), desc="Spawn xkill"),
                Key([],
                    "f",
                    lazy.window.toggle_fullscreen(),
                    desc="Toggle fullscreen on currently focused window"),
                Key([],
                    "v",
                    lazy.window.toggle_floating(),
                    desc="Toggle floating on currently focused window"),
            ],
            mode="window"),

        # Multimedia keys
        Key([],
            "XF86AudioMute",
            lazy.widget["volumeindicator"].toggle_vol(),
            desc="Toggle volume"),
        Key([],
            "XF86AudioRaiseVolume",
            lazy.widget["volumeindicator"].vol_inc(),
            desc="Volume inc"),
        Key([],
            "XF86AudioLowerVolume",
            lazy.widget["volumeindicator"].vol_dec(),
            desc="Volume dec"),
        Key([], "XF86MonBrightnessUp", backlight.inc(), desc="Brightness Up"),
        Key([],
            "XF86MonBrightnessDown",
            backlight.dec(),
            desc="Brightness Down"),
        Key([],
            "XF86AudioPlay",
            lazy.spawn(variables.CMD_CMUS_PLAY_PAUSE),
            desc="Play/Pause cmus"),
        Key([],
            "XF86AudioNext",
            lazy.spawn(variables.CMD_CMUS_NEXT),
            desc="Next track"),
        Key([],
            "XF86AudioPrev",
            lazy.spawn(variables.CMD_CMUS_PREV),
            desc="Prev track"),
        Key([],
            "Print",
            lazy.spawn(variables.CMD_SCREENSHOT),
            desc="Spawn flameshot gui"),
        Key([variables.ALT],
            "Print",
            lazy.spawn(variables.CMD_SCREENSHOT_ALT),
            desc="Takes screenshot of entire screen to clipboard"),
    ]


def make_mouse():
    return [
        Drag([variables.MOD],
             "Button1",
             lazy.window.set_position_floating(),
             start=lazy.window.get_position()),
        Drag([variables.MOD],
             "Button3",
             lazy.window.set_size_floating(),
             start=lazy.window.get_size()),
        Click([variables.MOD], "Button1", lazy.window.bring_to_front())
    ]
