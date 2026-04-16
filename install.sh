#!/bin/bash
set -e

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "==> Installing zsh..."
sudo apt-get update -q && sudo apt-get install -y -q zsh

echo "==> Installing oh-my-zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

echo "==> Linking oh-my-zsh..."
ln -sf "$DOTFILES_DIR/.oh-my-zsh" "$HOME/.oh-my-zsh"

echo "==> Linking .zshrc..."
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

echo "==> Copying custom themes..."
cp -r "$DOTFILES_DIR/custom/themes/." "$HOME/.oh-my-zsh/custom/themes/"

echo "==> Setting zsh as default shell..."
sudo chsh -s "$(which zsh)" "$(whoami)"

echo "==> Done!"