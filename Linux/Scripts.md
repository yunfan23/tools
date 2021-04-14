# How to install font in Linux

1. download font into local

curl -L -O https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.tar.gz

1. unpack the font archive

tar -xzvf Hack-v3.003-ttf.tar.gz

1. Install font

mkdir ~/.local/share/fonts

mv ttf/* ~/.local/share/fonts

1. clear and regenerate font cache

fc-cache -f -v

1. verify installation

fc-list | grep Hack