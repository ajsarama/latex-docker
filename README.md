INSTRUCTIONS TO SETUP CONTAINER

1. Run the following commands to get the installer
wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
zcat < install-tl-unx.tar.gz | tar xf -
cd install-tl-*

2. Run the installer
perl ./install-tl --no-interaction

3. Update $PATH to include TexLive binaries
PATH=$PATH:/usr/local/texlive/2023/bin/x86_64-linux

4. Commands need to be run like so:
pdflatex -shell-escape file.tex
