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
brew bundle dump --force --describe --no-vscode
```

### Homebrew on Monterey

Freeze Homebrew and Homebrew Core

```sh
brew tap homebrew/core
git -C $(brew --repository)/Library/Taps/homebrew/homebrew-core/ checkout -b macOS-monterey-freeze da66cc3

git -C $(brew --repository) checkout -b macOS-monterey-freeze 9042eb9
```
