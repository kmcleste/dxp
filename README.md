# DXP (WIP)

This repository contains basic python dev environment scripts for macOS.

## Usage

Clone the repository and run the `install` script... that's all.

```zsh
./install.sh
```

Included in installation:

- [Homebrew](https://brew.sh/): macOS package manager
- Python build dependencies (openssl, readline, sqlite3, xz, zlib, tcl-tk)
- [Poetry](https://python-poetry.org/): Python package and dependency manager
- [Pyenv](https://github.com/pyenv/pyenv): Python environment and version manager
- [TFenv](https://github.com/tfutils/tfenv): Terraform version manager
- [Cookiecutter](https://github.com/cookiecutter/cookiecutter): Create project boilerplate

Installation could take a few minutes. Once everything is installed, you may need to start a new shell for the changes take effect. To update your packages in the future, simply run the install script again.

If you break something or decide you no longer need the bundled packages, you can remove everything (minus `brew`) using the `uninstall` script.

```zsh
./uninstall.sh
```
