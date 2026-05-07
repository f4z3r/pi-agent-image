FROM archlinux:base-20260419.0.517065

RUN pacman --noconfirm -Suy nodejs-lts-krypton npm \
      ripgrep fd \
      git \
      luajit \
      python \
      curl \
      cargo \
      stylua \
      prettier \
    && npm install -g @earendil-works/pi-coding-agent @wcj/html-to-markdown \
    && groupadd -g 100 f4z3r \
    && useradd -u 1000 -g 100 -m f4z3r;

USER 1000

RUN cargo install cbfmt;

RUN mkdir -p /home/f4z3r/workspace/;

WORKDIR /home/f4z3r/workspace
