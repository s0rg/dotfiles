def _mkcolor(code):
    def _color_fn(value, bold=False):
        raw = "\x1B["
        if bold:
            raw += "1;"
        return raw + code + "m" + value + "\x1B[0m"

    return _color_fn


gray = _mkcolor("30")
red = _mkcolor("31")
green = _mkcolor("32")
blue = _mkcolor("34")
white = _mkcolor("37")
