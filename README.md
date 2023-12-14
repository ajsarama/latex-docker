# Simple LaTeX Container

This is an extremely barebones LaTeX container setup. Follow the instructions below to setup the container and use it to generate PDFs for any LaTeX source file. 

## Instructions

1. Clone the repository

Use the following command to clone the repository somewhere on your local machine:
```bash
git clone ...
```

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
