import subprocess as sh

from libqtile.lazy import lazy
from libqtile.utils import send_notification


_PAD_NAME = ""
PAD_NEEDLE = "touchpad"
XINPUT_BIN = "xinput"
XINPUT_PROP = "Device Enabled"
XINPUT_SET_FMT = XINPUT_BIN + " --set-prop '{}' '" + XINPUT_PROP + "' {}"
TOUCHPAD_ID = 1010


def _get_pad_name(needle=PAD_NEEDLE):
    p = sh.Popen([XINPUT_BIN, "list", "--name-only"], stdout=sh.PIPE)
    l = p.communicate()[0].decode().split("\n")
    r = list(filter(lambda s: needle in s.lower(), l))
    return r[0] if r else ""


def _get_pad_state(name):
    p = sh.Popen([XINPUT_BIN, "--list-props", name], stdout=sh.PIPE)
    l = p.communicate()[0].decode().split("\n")
    r = list(filter(lambda s: XINPUT_PROP in s, l))
    if len(r) < 1 or ":" not in r[0]:
        return False
    v = r[0].split(":")[1].strip()
    return v == "1"


def _toggle_state(qtile, name=""):
    if name == "":
        send_notification(PAD_NEEDLE, "not found :(")
        return
    v, m = ("0", "disabled") if _get_pad_state(name) else ("1", "enabled")
    qtile.cmd_spawn(XINPUT_SET_FMT.format(name, v))
    send_notification(PAD_NEEDLE, m, id=TOUCHPAD_ID)


def toggle():
    @lazy.function
    def _inner(qtile):
        global _PAD_NAME
        if _PAD_NAME == "":
            _PAD_NAME = _get_pad_name()
        _toggle_state(qtile, _PAD_NAME)
    return _inner
