echo "Welcome to Dax initial configurationn for Fedora"
echo "Stable <=41"
echo "Press enter to continue"
read
echo "Updating system"
sudo dnf update -y
echo "Installing RPM Fusion"
sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "Installing packages"
sudo dnf install git alacritty zsh neovim htop tmux wget lsd snapd -y
echo "Wanna add Brave and VSCode repositories? [y/n]"
read brave
if [ $brave == "y" ]; then
  sudo dnf install dnf-plugins-core -y
  sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
  sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
  sudo dnf install brave-browser -y
  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
  sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/vscode
  sudo dnf install code -y
fi

echo "Adding Hack Nerd fonts"
./common/add_hack_nerd_fonts.bash
mv ./common/.config/alacritty ~/.config/alacritty
echo "Wanna change shell to zsh? [y/n]"
read zsh
if [ $zsh == "y" ]; then
  ./common/change_shell.bash
fi

echo "Installing snap store"
snap install snap-store


