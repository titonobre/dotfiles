# dotfiles

Repository Structure

```txt
.
├── <package>
│   ├── .config
│   │   └── <application specific directory>
│   │       └── [files to place in the config directory]
│   └── [files to place in the home directory]
└── setup
```

## Install

```sh
./setup
```

## Adopt Existing Configs

```sh
# make new stow module
mkdir <new-package>
# add files matching the actual location
touch <new-package>/.config/<application specific directory>/somefile
# adopt files
stow --adopt <new-package>
```

## Additional Configuration

Put extra shell configuration files in `~/.config/shell/env.d/` and `~/.config/shell/shell.d/`.

Files in `env.d` are sourced in `.zshenv` and files in `shell.d` are sourced in `.zshrc`.

## Leaks

To prevent secrets from being leaked, use `gitleaks` in a pre-push hook.

```sh
echo -e 'gitleaks git' > .git/hooks/pre-push && chmod +x .git/hooks/pre-push
```

## Homebrew

Install Bundle

```sh
brew bundle install
```

Update Bundle

```sh
brew bundle dump --force --describe --no-vscode --no-upgrade
```

### Homebrew on Monterey

Freeze Homebrew and Homebrew Core

```sh
brew tap homebrew/core
git -C $(brew --repository)/Library/Taps/homebrew/homebrew-core/ checkout -b macOS-monterey-freeze da66cc3

git -C $(brew --repository) checkout -b macOS-monterey-freeze 9042eb9
```
