
echo -e "\e[32mChanging shell to zsh\e[0m"
sudo chsh -s $(which zsh) $(whoami)
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc



cp ./.config/.zshrc ~/.zshrc
echo "Restart to have zsh as default shell"
zsh
