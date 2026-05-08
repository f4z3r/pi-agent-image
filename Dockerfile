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
      neovim \
    && npm install -g @earendil-works/pi-coding-agent @wcj/html-to-markdown \
    && groupadd -g 100 f4z3r \
    && useradd -u 1000 -g 100 -m f4z3r;

USER 1000

ENV EDITOR="nvim"

RUN cargo install cbfmt;

# Split from cargo install to re-use layer cache
RUN mkdir -p /home/f4z3r/workspace/ \
    && mkdir -p /home/f4z3r/.config/nvim/;

COPY --chown=f4z3r:f4z3r ./assets/init.lua /home/f4z3r/.config/nvim/init.lua

WORKDIR /home/f4z3r/workspace
