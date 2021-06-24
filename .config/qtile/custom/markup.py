# some pango helpers
from .uptime import get_uptime_items


def Bold(t):
    return "<b>" + t + "</b>"


def Span(t, **attrs):
    vals = ['{}="{}"'.format(k, v) for k, v in attrs.items()]
    return "<span " + " ".join(vals) + ">" + t + "</span>"


def DiskFree(c):
    rv = ""
    rv += Span("{p}: ", foreground=c)
    rv += "{uf}"
    rv += Span("{m}B ", foreground=c)
    rv += "{r:.0f}%"
    return rv


def UptimeFunc(c):
    sp = "{}" + Span("{}", foreground=c)
    up = Span("up: ", foreground=c)

    def _getter():
        t = [sp.format(v, m) for v, m in get_uptime_items()]
        return up + " ".join(t)

    return _getter


