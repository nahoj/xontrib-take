#!/fake/python

"""
Make and cd into a dir, or fetch and cd into a git repo or archive file. A port of Oh My Zsh's take command to Xonsh.
"""
import re
from pathlib import Path


__all__ = ()


if bool($XONSH_INTERACTIVE):

    _TAR_URL_RE = re.compile(r"^(https?|ftp).*\.(tar\.(gz|bz2|xz)|tgz)$")
    _ZIP_URL_RE = re.compile(r"^(https?|ftp).*\.zip$")
    _GIT_URL_RE = re.compile(r"^([A-Za-z0-9]\+@|https?|git|ssh|ftps?|rsync).*\.git/?$")

    def _archive_root(name: str) -> str | None:
        cleaned = name.strip().strip('/').split('/', 1)[0]
        return cleaned or None

    @aliases.register
    def _mkcd(args):
        if not args:
            return 1

        paths = [str(Path(arg).expanduser()) for arg in args]
        mkdir -p @(paths)
        cd @(paths[-1])
        return 0

    aliases['takedir'] = 'mkcd'

    @aliases.register
    def _takeurl(args):
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

    @aliases.register
    def _takezip(args):
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

    @aliases.register
    def _takegit(args):
        if not args:
            return 1

        url = args[0]
        git clone @(url)
        cd @(Path(url.removesuffix('/').removesuffix('.git')).name)
        return 0

    @aliases.register
    def _take(args):
        if not args:
            return 1

        target = args[0]
        if _TAR_URL_RE.match(target):
            return _takeurl([target])
        if _ZIP_URL_RE.match(target):
            return _takezip([target])
        if _GIT_URL_RE.match(target):
            return _takegit([target])
        return _mkcd(list(args))
