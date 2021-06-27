import subprocess as sh


def get_uptime_items():
    p = sh.Popen(["uptime", "-p"], stdout=sh.PIPE)
    l = p.communicate()[0].decode().split("\n")
    if not l:
        return []

    c = l[0].split()[1:]
    return [(c[i], c[i + 1][0]) for i in range(0, len(c), 2)]
