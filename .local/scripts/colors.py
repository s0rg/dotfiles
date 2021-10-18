def _mkcolor(code):
    def _inner(value, bold=False):
        head = "\x1B["
        if bold:
            head += "1;"
        return head + code + "m" + str(value) + "\x1B[0m"

    return _inner


gray = _mkcolor("30")
red = _mkcolor("31")
green = _mkcolor("32")
blue = _mkcolor("34")
white = _mkcolor("37")
