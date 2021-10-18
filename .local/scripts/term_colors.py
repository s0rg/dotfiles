def _mkcolor(code):
    def _inner(value, bold=False, underline=False):
        head = "\x1B["
        if bold:
            head += "1;"
        if underline:
            head += "4;"
        return head + code + "m" + str(value) + "\x1B[0m"

    return _inner


black = _mkcolor("30")
red = _mkcolor("31")
green = _mkcolor("32")
brown = _mkcolor("33")
blue = _mkcolor("34")
purple = _mkcolor("35")
cyan = _mkcolor("36")
gray = _mkcolor("37")
