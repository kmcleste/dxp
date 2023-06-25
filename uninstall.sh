#!/usr/bin/env zsh

# Uninstall poetry
if command -v poetry &> /dev/null
then
    curl -sSL https://install.python-poetry.org | python3 - --uninstall
    sed -i -e '/export PATH=\$HOME\/.local\/bin:\$PATH/d' ~/.zshrc
fi

# Uninstall pyenv
if command -v pyenv &> /dev/null
then
    brew uninstall pyenv
    sed -i -e '/export PYENV_ROOT=\$HOME\/.pyenv/d' ~/.zshrc
    sed -i -e '/export PATH=\$PYENV_ROOT\/bin:\$PATH/d' ~/.zshrc
    sed -i -e '/eval "\$(pyenv init -)"/d' ~/.zshrc
    sed -i -e '/export PYENV_ROOT=\$HOME\/.pyenv/d' ~/.zprofile
    sed -i -e '/export PATH=\$PYENV_ROOT\/bin:\$PATH/d' ~/.zprofile
    sed -i -e '/eval "\$(pyenv init -)"/d' ~/.zprofile
fi

# Uninstall tfenv
if command -v tfenv &> /dev/null
then
    brew uninstall tfenv
    sed -i -e '/export PATH=\$HOME\/.tfenv\/bin:\$PATH/d' ~/.zshrc
    sed -i -e '/export PATH=\$HOME\/.tfenv\/bin:\$PATH/d' ~/.zprofile
fi
