from typing import Any, List, Tuple

from libqtile import bar, hook
from libqtile.widget import base


class WindowCount(base._TextBox):
    """A simple widget to show the number of windows in the current group."""
    orientations = base.ORIENTATION_HORIZONTAL
    defaults = [
        ("font", "sans", "Text font"),
        ("fontsize", None, "Font pixel size. Calculated if None."),
        ("fontshadow", None, "font shadow color, default is None(no shadow)"),
        ("padding", None, "Padding left and right. Calculated if None."),
        ("foreground", "#ffffff", "Foreground colour."),
        ("text_format", "{num}", "Format for message"),
        ("show_zero", False, "Show window count when no windows")
    ]  # type: List[Tuple[str, Any, str]]

    def __init__(self, text=" ", width=bar.CALCULATED, **config):
        base._TextBox.__init__(self, text=text, width=width, **config)
        self.add_defaults(WindowCount.defaults)
        self._count = 0

    def _configure(self, qtile, qbar):
        base._TextBox._configure(self, qtile, qbar)
        self._setup_hooks()
        self._wincount()

    def _setup_hooks(self):
        hook.subscribe.client_killed(self._win_killed)
        hook.subscribe.client_managed(self._wincount)
        hook.subscribe.current_screen_change(self._wincount)
        hook.subscribe.setgroup(self._wincount)

    def _wincount(self, *args):
        try:
            self._count = len(self.qtile.current_group.windows)
        except AttributeError:
            self._count = 0

        self.update()

    def _win_killed(self, window):
        if window.group != self.qtile.current_group:
            return

        try:
            self._count = len(self.qtile.current_group.windows)
        except AttributeError:
            self._count = 0

        if self._count and getattr(window, "group", None):
            self._count -= 1

        self.update()

    def calculate_length(self):
        if self.text and (self._count or self.show_zero):
            return min(
                self.layout.width,
                self.bar.width
            ) + self.actual_padding * 2
        return 0

    def update(self):
        self.text = self.text_format.format(num=self._count)
        self.bar.draw()

    def cmd_get(self):
        """Retrieve the current text."""
        return self.text