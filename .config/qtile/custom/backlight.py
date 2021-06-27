import subprocess as sh
from math import floor
from time import sleep

from libqtile.lazy import lazy
from libqtile.utils import send_notification

from .markup import Span

XBACKLIGHT_BIN = "xbacklight"
CHANGE_DEFAULT = 5
BACKLIGHT_ID = 1000

backlight_fmt = Span("\uF5DE", font="32") + Span(
    " {}%", font="18", rise="6900")


def _notify_state():
    sleep(0.3)  # wait for backlight to apply
    p = sh.Popen([XBACKLIGHT_BIN, "-get"], stdout=sh.PIPE)
    l = p.communicate()[0].decode().split("\n")
    v = floor(float(l[0]))
    send_notification("screen", backlight_fmt.format(v), id=BACKLIGHT_ID)


def _inc(qtile, val):
    qtile.cmd_spawn([XBACKLIGHT_BIN, "-inc", str(val)])
    _notify_state()


def _dec(qtile, val):
    qtile.cmd_spawn([XBACKLIGHT_BIN, "-dec", str(val)])
    _notify_state()


def inc(val=CHANGE_DEFAULT):
    @lazy.function
    def _inner(qtile):
        _inc(qtile, val)

    return _inner


def dec(val=CHANGE_DEFAULT):
    @lazy.function
    def _inner(qtile):
        _dec(qtile, val)

    return _inner
