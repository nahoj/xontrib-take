<p align="center">
A single command to create and cd into a dir, or into a fetched git repo or archive file. A port of Oh My Zsh's take command to Xonsh.
</p>

<p align="center">
If you like the idea click ⭐ on the repo and <a href="https://twitter.com/intent/tweet?text=Nice%20xontrib%20for%20the%20xonsh%20shell!&url=https://github.com/nahoj/xontrib-take" target="_blank">tweet</a>.
</p>


## Installation

To install use pip:

```xsh
# xpip install xontrib-take  # not yet on pypi
xpip install -U git+https://github.com/nahoj/xontrib-take
```

## Usage

```xsh
xontrib load take
take path/to/new/dir
take https://some.example/git/or?archive=url
```

## Examples

```xsh
~/test @ ls
~/test @ take foo
~/test/foo @
~/test/foo @ take https://github.com/nahoj/xontrib-take.git
Clonage dans 'xontrib-take'...
remote: Enumerating objects: 83, done.
remote: Counting objects: 100% (83/83), done.
remote: Compressing objects: 100% (50/50), done.
remote: Total 83 (delta 42), reused 64 (delta 25), pack-reused 0 (from 0)
Réception d'objets: 100% (83/83), 14.38 Kio | 1.44 Mio/s, fait.
Résolution des deltas: 100% (42/42), fait.
…/xontrib-take main @ popd
~/test/foo @
~/test/foo @ take https://github.com/nahoj/xontrib-take/archive/refs/heads/main.zip
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100 11842    0 11842    0     0  25590      0 --:--:-- --:--:-- --:--:-- 25590
Archive:  /tmp/tmp.n2rudhhtF0
   creating: ./xontrib-take-main/
# ...
~/test/foo/xontrib-take-main @
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

* Add xontrib to the [awesome-xontribs](https://github.com/xonsh/awesome-xontribs).

* Publish your xontrib to PyPi via Github Actions and users can install your xontrib via `xpip install xontrib-myxontrib`. Easiest way to achieve it is to use Github Actions. Register to https://pypi.org/ and [create API token](https://pypi.org/help/#apitoken). Go to repository "Settings" - "Secrets" and your PyPI API token as `PYPI_API_TOKEN` as a "Repository Secret". Now when you create new Release the Github Actions will publish the xontrib to PyPi automatically. Release status will be in Actions sction. See also `.github/workflows/release.yml`.

* Write a message to: [xonsh Gitter chat](https://gitter.im/xonsh/xonsh?utm_source=xontrib-template&utm_medium=xontrib-template-promo&utm_campaign=xontrib-template-promo&utm_content=xontrib-template-promo), [Twitter](https://twitter.com/intent/tweet?text=xonsh%20is%20a%20Python-powered,%20cross-platform,%20Unix-gazing%20shell%20language%20and%20command%20prompt.&url=https://github.com/nahoj/xontrib-take), [Reddit](https://www.reddit.com/r/xonsh), [Mastodon](https://mastodon.online/).
