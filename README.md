<div align="center">

A single Xonsh command to create and cd into a directory, or into a fetched git repo or archive file. A port of Oh My Zsh's take command.

I reckon [the source](https://github.com/nahoj/xontrib-take/blob/main/xontrib/take.xsh) is a good showcase of mixing Python and shell commands in Xonsh.

**Status:** It works. Issues and PRs for additional features are welcome!

If you like the idea click ⭐ on the repo and <a href="https://x.com/intent/tweet?text=Nice%20xontrib%20for%20the%20xonsh%20shell!&url=https://github.com/nahoj/xontrib-take" target="_blank">tweet</a>.
</div>

## Installation

I haven't uploaded this to PyPi, I will if anyone expresses interest.

```xsh
xpip install -U git+https://github.com/nahoj/xontrib-take
```

Then:

```xsh
xontrib load take
```

## Examples

```xsh
~/test @ ls
~/test @ take foo/bar
~/test/foo/bar @
```

```xsh
~/test @ take https://github.com/nahoj/xontrib-take.git
Clonage dans 'xontrib-take'...
...
…/xontrib-take main @
```

```xsh
~/test @ take https://github.com/nahoj/xontrib-take/archive/refs/heads/main.zip
...
Archive:  /tmp/tmp.n2rudhhtF0
   creating: ./xontrib-take-main/
...
~/test/xontrib-take-main @
```

## Development

- activate [pre-commit](https://github.com/pre-commit/pre-commit) hooks
```sh
# install pre-commit plugins and activate the commit hook
pre-commit install
pre-commit autoupdate
```

## Releasing your package

- Bump the version of your package.
- Create a GitHub release (The release notes are automatically generated as a draft release after each push).
- And publish with `poetry publish --build` or `twine`

## Credits

This xontrib is a direct translation of Oh My Zsh's handy `take` command, inspired by `mkcd` aliases around the world :)

This package was created with [xontrib template](https://github.com/xonsh/xontrib-template).


--------------------

## Xontrib Promotion (DO and REMOVE THIS SECTION)

* Publish your xontrib to PyPi via Github Actions and users can install your xontrib via `xpip install xontrib-myxontrib`. Easiest way to achieve it is to use Github Actions. Register to https://pypi.org/ and [create API token](https://pypi.org/help/#apitoken). Go to repository "Settings" - "Secrets" and your PyPI API token as `PYPI_API_TOKEN` as a "Repository Secret". Now when you create new Release the Github Actions will publish the xontrib to PyPi automatically. Release status will be in Actions sction. See also `.github/workflows/release.yml`.
