#!/bin/bash

# Check if zprofile / zshrc exists, if so, back it up
if [ -f ~/.zprofile ]; then
    echo "Backing up existing .zprofile..."
  mv ~/.zprofile ~/.zprofile.bak
fi

if [ -f ~/.zshrc ]; then
    echo "Backing up existing .zshrc..."
  mv ~/.zshrc ~/.zshrc.bak
fi

# Copy zprofile and zshrc to home directory
echo "Copying .zprofile and .zshrc to home directory..."
cp assets/.zprofile ~/.zprofile
cp assets/.zshrc ~/.zshrc

# Install XCode Command Line Tools
echo "Installing XCode Command Line Tools..."
xcode-select --install

# Copy git config
cp assets/.gitconfig ~/.gitconfig

# Install homebrew
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install brew packages
echo "Installing Homebrew packages..."
while IFS= read -r package; do
  brew install "$package"
done < assets/homebrew

# Install brew casks
echo "Installing Homebrew casks..."
while IFS= read -r package; do
  brew install --cask "$package"
done < assets/homebrew-cask

# Copy VS Code settings
echo "Copying VS Code settings..."
cp -r assets/vscode ~/Library/Application\ Support/Code/User

# Install VS Code extensions
if command -v code &> /dev/null; then
    echo "Installing VS Code extensions..."
    while IFS= read -r extension; do
        code --install-extension "$extension"
    done < assets/vscode/extensions
else
    echo "VS Code not installed. Skipping extension installation..."
fi