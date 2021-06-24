from libqtile import widget
from .markup import Bold, Span


class CapsNumLockIndicator(widget.CapsNumLockIndicator):
    defaults = [
        ("active_color", "#FFFFFF", "Active text color"),
    ] # type: List[Tuple[str, Any, str]]

    def __init__(self, **config):
        super().__init__(**config)
        self.add_defaults(CapsNumLockIndicator.defaults)
        self._def_span = Span("{}", foreground=self.foreground)
        self._act_span = Span(Bold("{}"), foreground=self.active_color)

    @property
    def active_color(self):
        return self._active_color

    @active_color.setter
    def active_color(self, c):
        self._active_color = c
        self._act_span = Span(Bold("{}"), foreground=c)

    def _render(self, pair):
        v, s = pair
        on = s == "on"
        fmt = self._act_span if on else self._def_span
        val = v[:1].upper() if on else v[:1].lower()
        return fmt.format(val)

    def poll(self):
        p = super().poll().split()
        if not p:
            return "[ none ]"

        return " ".join([
            self._render(v) for v in [p[:2], p[2:]]
        ])

