#!/usr/bin/env zsh

# Install homebrew
if ! command -v brew &> /dev/null
then
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
else
    brew update
fi

# Install python build dependencies
brew install openssl readline sqlite3 xz zlib tcl-tk ca-certificates

# Install pyenv
if ! command -v pyenv &> /dev/null
then
    brew install pyenv
    if ! grep -Fxq "export PYENV_ROOT=\$HOME/.pyenv" ~/.zshrc &> /dev/null
    then
        echo export PYENV_ROOT="\$HOME/.pyenv" >> ~/.zshrc 
    fi
    if ! grep -Fxq "export PATH=\$PYENV_ROOT/bin:\$PATH" ~/.zshrc &> /dev/null
    then
        echo export PATH="\$PYENV_ROOT/bin:\$PATH" >> ~/.zshrc
    fi
    if ! grep -Fxq 'eval "$(pyenv init -)"' ~/.zshrc &> /dev/null
    then
        echo 'eval "$(pyenv init -)"' >> ~/.zshrc
    fi
    if ! grep -Fxq "export PYENV_ROOT=\$HOME/.pyenv" ~/.zprofile &> /dev/null
    then
        echo export PYENV_ROOT="\$HOME/.pyenv" >> ~/.zprofile
    fi
    if ! grep -Fxq "export PATH=\$PYENV_ROOT/bin:\$PATH" ~/.zprofile &> /dev/null
    then
        echo export PATH="\$PYENV_ROOT/bin:\$PATH" >> ~/.zprofile
    fi
    if ! grep -Fxq 'eval "$(pyenv init -)"' ~/.zprofile &> /dev/null
    then
        echo 'eval "$(pyenv init -)"' >> ~/.zprofile
    fi
else
    brew upgrade pyenv
fi

# Install poetry
if ! command -v poetry &> /dev/null
then
    curl -sSL https://install.python-poetry.org | python3 -
    if ! grep -Fxq "export PATH=\$HOME/.local/bin:\$PATH" ~/.zshrc &> /dev/null
    then
        echo export PATH="\$HOME/.local/bin:\$PATH" >> ~/.zshrc
    fi
else
    poetry self update
fi

# Install tfenv
if ! command -v tfenv &> /dev/null
then
    brew install tfenv
    if ! grep -Fxq "export PATH=\$HOME/.tfenv/bin:\$PATH" ~/.zshrc &> /dev/null
    then
        echo export PATH="\$HOME/.tfenv/bin:\$PATH" >> ~/.zshrc
    fi
    if ! grep -Fxq "export PATH=\$HOME/.tfenv/bin:\$PATH" ~/.zprofile &> /dev/null
    then
        echo export PATH="\$HOME/.tfenv/bin:\$PATH" >> ~/.zprofile
    fi
    tfenv install
    tfenv use
else
    brew upgrade tfenv
fi
