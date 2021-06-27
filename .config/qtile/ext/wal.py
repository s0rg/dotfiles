import os.path
import json
from operator import itemgetter
from collections import namedtuple

Theme = namedtuple("Theme", [
    "wallpaper",
    "fontname",
    "fontsize",
    "fontlarge",
    "background",
    "foreground",
    "important",
    "colors",
])

CACHE = os.path.expanduser("~/.cache/wal/colors.json")
NOTIFY = "#AA5100"

# calm dark-green theme
DEFAULT_COLORS = [
    "#070C04",
    "#535C21",
    "#416D50",
    "#3FA135",
    "#5DA111",
    "#77CF05",
    "#A2F103",
    "#c0e0a9",
    "#869c76",
],


def _load_colors(d):
    l = list(d.items())
    l.sort(key=itemgetter(0))
    return [v[1] for v in l]


def make_theme(fontname, fontsize, fontlarge, important=NOTIFY) -> Theme:
    if not os.path.exists(CACHE):
        return Theme(
            "",
            fontname,
            fontsize,
            fontlarge,
            DEFAULT_COLORS[0],
            DEFAULT_COLORS[7],
            important,
            DEFAULT_COLORS,
        )

    with open(CACHE, "rt", encoding="utf8") as fd:
        d = json.load(fd)
        return Theme(
            d["wallpaper"],
            fontname,
            fontsize,
            fontlarge,
            d["special"]["background"],
            d["special"]["foreground"],
            important,
            _load_colors(d.get("colors")),
        )
