#!/bin/bash

set -e

echo "🛠️ Starting Zsh environment setup..."

# 1. Install necessary packages
sudo apt update
sudo apt install -y zsh git curl

# 2. Install Oh My Zsh (non-interactive)
export RUNZSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 3. Install zsh-autosuggestions
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions

# 4. Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting

# 5. Install Powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM}/themes/powerlevel10k

# 6. Set Zsh as the default shell
chsh -s $(which zsh)

# 7. Modify ~/.zshrc to include plugins and theme
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
sed -i 's/^plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

echo "🎉 Zsh setup complete. Please log out and log back in to apply the default shell change."
echo "Then run: source ~/.zshrc"
