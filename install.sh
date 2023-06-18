#!/usr/bin/env zsh

# Install homebrew
if ! command -v brew &> /dev/null
then
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
else
    brew update
fi

# Install python build dependencies
brew install openssl readline sqlite3 xz zlib tcl-tk

# Install poetry
if ! command -v poetry &> /dev/null
then
    curl -sSL https://install.python-poetry.org | python3 -
    echo export PATH="\$HOME/.local/bin:\$PATH" >> ~/.zshrc
    source ~/.zshrc
else
    poetry self update
fi

# Install pyenv
if ! command -v pyenv &> /dev/null
then
    brew install pyenv
    echo export PYENV_ROOT="\$HOME/.pyenv" >> ~/.zshrc
    echo export PATH="\$PYENV_ROOT/bin:\$PATH" >> ~/.zshrc
    echo eval "$(pyenv init -)" >> ~/.zshrc
    echo export PYENV_ROOT="\$HOME/.pyenv" >> ~/.zprofile
    echo export PATH="\$PYENV_ROOT/bin:\$PATH" >> ~/.zprofile
    echo eval "$(pyenv init -)" >> ~/.zprofile
else
    brew upgrade pyenv
fi

# Install tfenv
if ! command -v tfenv &> /dev/null
then
    brew install tfenv
    tfenv install
    tfenv use
    echo export PATH="\$HOME/.tfenv/bin:\$PATH" >> ~/.zshrc
    echo export PATH="\$HOME/.tfenv/bin:\$PATH" >> ~/.zprofile
else
    brew upgrade tfenv
fi
