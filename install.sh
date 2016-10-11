#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Install and setup OMZ
if test ! $(which upgrade_oh_my_zsh); then
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  # Use the completions provided Homebrew's git-flow-avh instead of OMZ's plugin
  ln -sf /usr/local/share/zsh/site-functions/git-flow-completion.zsh $HOME/.oh-my-zsh/custom/plugins/git-flow-avh.plugin.zsh
  ln -sf $HOME/.dotfiles/.zshrc $HOME/.zshrc
fi

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
