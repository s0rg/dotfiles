from libqtile.lazy import lazy
from libqtile.config import (
    Key,
    KeyChord,
    Group,
    Match,
    ScratchPad,
    DropDown,
)
from libqtile.log_utils import logger


height_key = "height"
height_default = 0.9


class Navigator(object):
    def __init__(self, apps):
        self._names = []
        for name, _ in apps:
            self._names.append(name)

    def _index(self, name):
        for i, n in enumerate(self._names):
            if n == name:
                return i
        return -1

    def prev_for(self, name):
        idx = self._index(name)
        if idx == -1:
            return []

        head = self._names[:idx]
        tail = self._names[idx+1:]

        if head:
            head = list(reversed(head))

        return head + tail


def one_sub_half(v):
    return (1.0 - v) / 2.0


def make_drop_defaults(height, width=0.9):
    return {
        "opacity": 1.0,
        "width": width,
        height_key: height,
        "warp_pointer": False,
        "x": one_sub_half(width),
        "y": one_sub_half(height),
        "on_focus_lost_hide": True,
    }


def make_class_matcher(cls):
    return Match(wm_class=cls)


def lower_all(it):
    return [s.lower() for s in it]


def make_groups(
    apps,
    mod_key,
    mov_key=None, # key to move windows between groups
    drops=[],
    scratchpad="drops",
    scratchpad_key="d",
):
    groups, grkeys, known = [], [], []
    known_classes = frozenset()

    def _app_matcher(c) -> bool:
        cls = c.window.get_wm_class()
        logger.debug("matching: {} against: {}".format(cls, known_classes))
        return not (cls[0].lower() in known_classes)

    for i, (name, args) in enumerate(apps, 1):
        match = []

        cls = args.pop("class", None)
        if cls:
            match = [make_class_matcher(cls)]
            known.extend(lower_all(cls))
        elif args.pop("default", False):
            match = [Match(func=_app_matcher)]

        args.update({
            "init": True,
            "position": i,
            "matches": match,
        })

        groups.append(Group(name, **args))
        grkeys.append(Key([mod_key], str(i),
            lazy.screen.toggle_group(name)))
        if mov_key is not None:
            grkeys.append(Key([mod_key, mov_key], str(i),
                lazy.window.togroup(name)))

    # update `known_classes` value for later use in `_app_matcher`.
    known_classes = frozenset(known)

    if drops:
        items, keys = [], []
        for i, d in enumerate(drops, 1):
            h = d.get(height_key, height_default)
            n = "{}-{}".format(scratchpad, i)

            items.append(DropDown(n, d["command"], **make_drop_defaults(h)))
            keys.append(Key([], str(i),
                lazy.group[scratchpad].dropdown_toggle(n),
                desc="Toggle {} drop-down".format(i),
            ))

        groups.append(ScratchPad(scratchpad, items))
        grkeys.append(KeyChord([mod_key], scratchpad_key, keys, mode=scratchpad))

    return (groups, grkeys)

