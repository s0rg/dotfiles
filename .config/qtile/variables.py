import os.path as path

ALT = "mod1"
MOD = "mod4" # win key
CTRL = "control"

FONT_NAME = "ubuntumono nerd font mono"

BAR_HEIGHT = 24
FONT_SIZE = BAR_HEIGHT // 2
FONT_BIG  = FONT_SIZE + 2

CMD_TERM  = "kitty"
CMD_NCDU  = CMD_TERM + " ncdu-home"
CMD_CMUS  = CMD_TERM + " cmus"
CMD_TOP   = CMD_TERM + " gotop"
CMD_MIXER = "pavucontrol-qt"

CMD_ROFI_COMBI = "rofi -show combi -display-combi 'run '"
CMD_ROFI_WINDOWS = "rofi -show window -display-window 'win '"

CMD_REDSHIFT_TOGGLE = "pkill -USR1 redshift"

CMD_CMUS_PLAY_PAUSE = "cmus-remote --pause"
CMD_CMUS_NEXT = "cmus-remote --next"
CMD_CMUS_PREV = "cmus-remote --prev"

SCREENSHOTS_PATH = path.expanduser("~/Documents/screenshots")

CMD_SCREENSHOT = "flameshot gui -p {}".format(SCREENSHOTS_PATH)
CMD_SCREENSHOT_ALT = "flameshot full -c"

CMD_START = [path.expanduser("~/.config/qtile/autostart.sh")]
CMD_RELOAD = ['xsetroot', '-cursor_name', 'left_ptr']

# drop-downs
DROPS = [
    {"command": CMD_TOP},
    {"command": CMD_CMUS},
]

# app groups
APPS = [
    ("tty", {"class": [CMD_TERM], "spawn": CMD_TERM}),
    ("net", {"class": ["Firefox", "Tor Browser", "Telegram", "qbittorrent"]}),
    ("doc", {"class": ["okular", "pcmanfm-qt", "qimgv", "featherpad"]}),
    ("app", {"default": True}),
    ("zum", {"class": ["zoom"], "exclusive": True}),
]

# dialog types
DIALOGS = frozenset([
    "notification",
    "toolbar",
    "splash",
    "dialog",
    "utility",
    "menu",
    "dropdown_menu",
    "popup_menu",
    "tooltip",
    "dock",
])

# floating classes
FLOATERS = frozenset([
    "ssh-askpass",
    "pavucontrol-qt",
])

