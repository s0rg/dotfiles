from libqtile import layout, widget, qtile
from libqtile.lazy import lazy

import custom

import vars
from grouper import make_class_matcher


# color indexes
focused = 2
graph = 3
active = 6


def make_floating(cls, d):
    r = layout.Floating.default_float_rules[:]
    r.append(make_class_matcher(cls))
    return layout.Floating(float_rules=r, **d)


def click_spawner(cmd):
    def _spawn():
        qtile.cmd_spawn(cmd)
    return _spawn


def make_layouts(theme, floaters, tiles_margin=5):
    d = dict(
        font=theme.fontname,
        border_width=1,
        border_focus=theme.colors[focused],
        border_normal=theme.background,
    )

    return (
        [
            layout.Max(**d),
            layout.Tile(
                add_after_last=True,
                margin=tiles_margin,
                **d,
            ),
            layout.VerticalTile(margin=tiles_margin, **d),
            layout.Floating(**d),
        ],
        make_floating(floaters, d),
    )


def make_widgets_defaults(theme):
    return dict(
        font=theme.fontname,
        fontsize=theme.fontsize,
        background=theme.background,
        foreground=theme.foreground,
        rounded=False,
        borderwidth=1,
        highlight_method="border",
    )


def graph_defaults(color, border, width, border_width=1, margin_x=2):
    return dict(
        width=width,
        line_width=1,
        graph_color=color,
        margin_x=margin_x,
        border_color=border,
        border_width=border_width,
        fill_color="{}.3".format(color),
        samples=width - (border_width*2 + margin_x),
    )


def icon(sym, size):
    return widget.TextBox(
        sym,
        margin_y=0,
        padding_y=0,
        fontsize=size,
    )


def make_main_bar_widgets(theme):
    fc = theme.colors[focused]
    gc = theme.colors[graph]
    ac = theme.colors[active]

    sep = widget.Sep(size_percent=50, foreground=fc)

    return [
        widget.GroupBox(
            fontsize=theme.fontlarge,
            active=fc,
            this_current_screen_border=fc,
            block_highlight_text_color=theme.foreground,
            urgent_border=theme.important,
            hide_unused=True,
            disable_drag=True,
            use_mouse_wheel=False,
        ),
        widget.WindowCount(show_zero=True),

        sep,

        widget.WindowName(),
        widget.Chord(fmt="[:{}:]", foreground=ac),

        sep,

        widget.WidgetBox(
            foreground=fc,
            text_open=" > ",
            text_closed=" < ",
            close_button_location="right",
            widgets=[
                widget.GenPollText(
                    func=custom.markup.UptimeFunc(fc),
                    update_interval=30,
                ),
                widget.DF(
                    partition="/home",
                    format=custom.markup.DiskFree(fc),
                    warn_space=5,
                    warn_color=theme.important,
                    visible_on_warn=False,
                    mouse_callbacks={
                        "Button1": click_spawner(vars.CMD_NCDU),
                    },
                ),
                widget.DF(
                    partition="/",
                    format=custom.markup.DiskFree(fc),
                    warn_space=5,
                    warn_color=theme.important,
                ),

                widget.Spacer(length=3),

                #widget.Cmus(
                #    play_color=theme.foreground,
                #    noplay_color=fc,
                #),

                custom.VolumeIndicator(
                    foreground=fc,
                    active_color=theme.foreground,
                    update_interval=0.3,
                    mouse_callbacks={
                        "Button1": click_spawner(vars.CMD_MIXER),
                    },
                ),
        ]),
        widget.CPUGraph(**graph_defaults(ac, fc, 22)),
        widget.MemoryGraph(**graph_defaults(gc, fc, 22)),
        widget.ThermalSensor(
            foreground=theme.foreground,
            foreground_alert=theme.important,
        ),

        sep,

        widget.Systray(
            icon_size=16,
            padding=4,
        ),

        widget.Spacer(length=4),

        custom.CapsNumLockIndicator(
            foreground=fc,
            active_color=ac,
            update_interval=0.3,
            padding=1,
            margin=0,
        ),
        widget.KeyboardKbdd(
            fmt=custom.markup.Bold("{}"),
            configured_keyboards=["US", "RU"],
            update_interval=0.3,
        ),

        sep,

        custom.ClockWidget(
            fontsize=theme.fontlarge,
            foreground=fc,
            clock=theme.foreground,
            holiday=ac,
        ),
        widget.CurrentLayoutIcon(
            padding=0,
            scale=0.6,
        ),
    ]

