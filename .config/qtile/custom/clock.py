from datetime import datetime

from libqtile.widget import base

from .markup import Span, Bold


class ClockWidget(base.InLoopPollText):
    """A simple but flexible text-based clock"""
    orientations = base.ORIENTATION_HORIZONTAL
    defaults = [
        ("update_interval", 1., "Update interval for the clock"),
        ("clock", "#FFFFFF", "clock time color"),
        ("holiday", "#00FF00", "holiday (saturday and sunday) color for day"),
    ]

    def __init__(self, **config):
        super().__init__(**config)
        self.add_defaults(ClockWidget.defaults)
        self._last_min = -1
        self._cached = ""

    def poll(self):
        now = datetime.now()

        if now.minute == self._last_min:
            return self._cached

        self._last_min = now.minute

        dayfg = self.holiday if now.isoweekday() > 5 else self.foreground
        sday = Span("{day} ", size="small", foreground=dayfg)
        clock = Span(Bold("{clock}"), foreground=self.clock)
        fullsp = sday + Span("{date} ", size="small") + clock
        full = Span(fullsp, gravity_hint="line")

        args = {
            "day": now.strftime("%a").lower(),
            "date": now.strftime("%Y-%m-%d"),
            "clock": now.strftime("%H:%M"),
        }

        self._cached = full.format(**args)

        return self._cached
