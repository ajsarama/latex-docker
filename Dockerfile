FROM ubuntu

RUN apt-get -y update && apt-get -y install wget perl python3-pygments vim
WORKDIR latex/
COPY ./README.md .

RUN wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
RUN zcat < install-tl-unx.tar.gz | tar xf -
RUN perl "$(ls -d install-tl-* | head -n 1)/install-tl" --no-interaction
ENV PATH="${PATH}:rusr/local/texlive/2023/bin/x86_64-linux"
