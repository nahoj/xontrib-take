#!/fake/python

"""
Make and cd into a dir, or fetch and cd into a git repo or archive file. A port of Oh My Zsh's take command to Xonsh.
"""
import re
from pathlib import Path
from xonsh.built_ins import XonshSession


__all__ = ()


_TAR_URL_RE = re.compile(r"^(https?|ftp).*\.(tar\.(gz|bz2|xz)|tgz)$")
_ZIP_URL_RE = re.compile(r"^(https?|ftp).*\.zip$")
_GIT_URL_RE = re.compile(r"^([A-Za-z0-9]\+@|https?|git|ssh|ftps?|rsync).*\.git/?$")


def _archive_root(name: str) -> str | None:
    cleaned = name.strip().strip('/').split('/', 1)[0]
    return cleaned or None


def mkcd(args):
    if not args:
        return 1
    paths = [str(Path(arg).expanduser()) for arg in args]
    mkdir -p @(paths)
    cd @(paths[-1])
    return 0


def takeurl(args):
    if not args:
        return 1
    data = $(mktemp).strip()
    curl -L @(args[0]) > @(data)
    thedir = _archive_root($(tar tf @(data) | head -n 1))
    tar xf @(data)
    rm @(data)
    if thedir:
        cd @(thedir)
    return 0


def takezip(args):
    if not args:
        return 1
    data = $(mktemp).strip()
    curl -L @(args[0]) > @(data)
    unzip @(data) -d ./
    thedir = _archive_root($(unzip -Z1 @(data) | head -n 1))
    rm @(data)
    if thedir:
        cd @(thedir)
    return 0


def takegit(args):
    if not args:
        return 1
    url = args[0]
    git clone @(url)
    cd @(Path(url.removesuffix('/').removesuffix('.git')).name)
    return 0


def take(args):
    if not args:
        return 1
    target = args[0]
    if _TAR_URL_RE.match(target):
        return takeurl([target])
    if _ZIP_URL_RE.match(target):
        return takezip([target])
    if _GIT_URL_RE.match(target):
        return takegit([target])
    return mkcd(list(args))


_ALIASES = {
    'mkcd': mkcd,
    'takedir': mkcd,
    'takeurl': takeurl,
    'takezip': takezip,
    'takegit': takegit,
    'take': take,
}


def _load_xontrib_(xsh: XonshSession, **kwargs) -> dict:
    xsh.aliases.update(_ALIASES)
    return {}


def _unload_xontrib_(xsh: XonshSession, **kwargs) -> dict:
    for name in _ALIASES:
        xsh.aliases.pop(name, None)
    return {}
