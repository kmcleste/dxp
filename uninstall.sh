#!/usr/bin/env zsh

# Uninstall poetry
if command -v poetry &> /dev/null
then
    curl -sSL https://install.python-poetry.org | python3 - --uninstall
    # TODO: Update zshrc poetry path
fi

# Uninstall pyenv
if command -v pyenv &> /dev/null
then
    brew uninstall pyenv
fi

# Uninstall tfenv
if command -v tfenv &> /dev/null
then
    brew uninstall tfenv
fi

# Uninstall cookiecutter
if command -v cookiecutter &> /dev/null
then
    brew uninstall cookiecutter
fi