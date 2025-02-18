# dotfiles

## Install

```sh
./setup
```

## Homebrew

Install Bundle

```sh
brew bundle install
```

Update Bundle

```sh
brew bundle dump --force --describe --no-vscode
```

### Homebrew on Monterey

Freeze Homebrew and Homebrew Core

```sh
brew tap homebrew/core
git -C $(brew --repository)/Library/Taps/homebrew/homebrew-core/ checkout -b macOS-monterey-freeze da66cc3

git -C $(brew --repository) checkout -b macOS-monterey-freeze 9042eb9
```
