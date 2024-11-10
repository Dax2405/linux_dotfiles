cd ~/Descargas
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip
mkdir Hack_Nerd_Fonts
unzip Hack.zip -d Hack_Nerd_Fonts
cd Hack_Nerd_Fonts
rm *.md
cd ..
sudo mv Hack_Nerd_Fonts /usr/share/fonts/