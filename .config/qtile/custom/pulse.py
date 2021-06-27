from math import ceil
from collections import namedtuple

from libqtile import widget
from libqtile.utils import send_notification

from pulsectl import Pulse

from .markup import Span

VOLUME_ID = 1100
MIC_ID = 1200

DevInfo = namedtuple("DevInfo", ["volume", "muted"])
VolInfo = namedtuple("VolInfo", ["vol", "mic"])

_CLIENT_NAME = "qtile:volume-indicator"

span_mic_tag = "mic"

span_mic_base = span_mic_tag
span_mic_mute = Span(span_mic_tag, strikethrough="true")

span_vol_tag = "vol:"
span_vol_val = "{:3.0f}"

span_vol_base = span_vol_tag + span_vol_val
span_vol_mute = Span(span_vol_base, strikethrough="true")

_vol_cap = 1.5
_vol_max = 1.0
_vol_step = 0.05

big_font = "32"

mic_norm = Span("\uF130", font=big_font)
mic_muted = Span("\uF131", font=big_font)

vol_norm = Span("\uFA7D", font=big_font)
vol_muted = Span("\uFA80", font=big_font)
vol_value = Span("\uFA7D", font=big_font) + Span(
    " {:.0%}", font="18", rise="6900")


class VolumeIndicator(widget.base.ThreadPoolText):
    orientations = widget.base.ORIENTATION_HORIZONTAL
    defaults = [
        ("active_color", "#FFFFFF", "Active text color"),
        ("vol_max", _vol_max, "Maximum volume value"),
        ("vol_step", _vol_step, "Step for volume up / down"),
    ]  # type: List[Tuple[str, Any, str]]

    def __init__(self, **config):
        super().__init__("", **config)
        self.add_defaults(VolumeIndicator.defaults)
        self._vol_norm = span_vol_tag + Span(span_vol_val,
                                             foreground=self.active_color)
        self._mic_norm = Span(span_mic_tag, foreground=self.active_color)
        self._state = VolInfo(None, None)
        self._cache = None

    @property
    def active_color(self):
        return self._active_color

    @active_color.setter
    def active_color(self, v):
        self._active_color = v
        self._vol_norm = span_vol_tag + Span(span_vol_val, foreground=v)
        self._mic_norm = Span(span_mic_tag, foreground=v)

    @property
    def vol_max(self):
        return self._vol_max

    @vol_max.setter
    def vol_max(self, v):
        self._vol_max = min(v, _vol_cap)

    @property
    def vol_step(self):
        return self._vol_step

    @vol_step.setter
    def vol_step(self, v):
        self._vol_step = v

    def poll(self):
        state = self._vol_info()
        if not state:
            return ""

        if self._state == state:
            return self._cache

        micf = self._mic_norm
        if state.mic.muted:
            micf = span_mic_mute
        elif state.mic.volume < 1:
            micf = span_mic_base

        volf = self._vol_norm
        if state.vol.muted:
            volf = span_vol_mute
        elif state.vol.volume < 1:
            volf = span_vol_base

        self._state = state
        self._cache = " ".join([micf, volf.format(state.vol.volume)])

        return self._cache

    def _vol_info(self):
        with Pulse(_CLIENT_NAME) as p:
            srv = p.server_info()
            out = first_by_name(srv.default_sink_name, p.sink_list())
            mic = first_by_name(srv.default_source_name, p.source_list())

            return VolInfo(
                DevInfo(ceil(out.volume.value_flat * 100.0), out.mute == 1),
                DevInfo(ceil(mic.volume.value_flat * 100.0), mic.mute == 1),
            )

    def _vol_change(self, val):
        with Pulse(_CLIENT_NAME) as p:
            srv = p.server_info()
            out = first_by_name(srv.default_sink_name, p.sink_list())
            val = min(_vol_max, max(0.0, out.volume.value_flat + val))
            if val != out.volume.value_flat:
                if out.mute == 1:
                    p.mute(out, 0)
                p.volume_set_all_chans(out, val)
                send_notification("pulse-audio",
                                  vol_value.format(val),
                                  id=VOLUME_ID)

    def cmd_toggle_vol(self):
        with Pulse(_CLIENT_NAME) as p:
            srv = p.server_info()
            out = first_by_name(srv.default_sink_name, p.sink_list())
            p.mute(out, not out.mute)
            send_notification("pulse-audio",
                              (vol_muted if out.mute else vol_norm),
                              id=VOLUME_ID)

    def cmd_toggle_mic(self):
        with Pulse(_CLIENT_NAME) as p:
            srv = p.server_info()
            mic = first_by_name(srv.default_source_name, p.source_list())
            p.mute(mic, not mic.mute)
            send_notification("pulse-audio",
                              (mic_muted if mic.mute else mic_norm),
                              id=MIC_ID)

    def cmd_vol_inc(self):
        self._vol_change(self.vol_step)

    def cmd_vol_dec(self):
        self._vol_change(-self.vol_step)


def first_by_name(name, it):
    for v in it:
        if v.name == name:
            return v
    return None
