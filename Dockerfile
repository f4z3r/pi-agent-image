FROM archlinux:base-20260419.0.517065@sha256:5ba8bb318666baef4d33afefc0e65db80f38b23503cb8e7b150d315cc2d4d5da

RUN pacman --noconfirm -Suy nodejs-lts-krypton npm \
      sudo \
      ripgrep fd \
      git \
      luajit \
      python \
      curl \
      cargo \
      stylua \
      prettier \
      neovim \
    && npm install -g @earendil-works/pi-coding-agent@0.75.3 @wcj/html-to-markdown@2.1.1 \
    && groupadd -g 100 f4z3r \
    && useradd -u 1000 -g 100 -m f4z3r \
    && usermod -aG wheel f4z3r \
    && echo "f4z3r ALL=(ALL) NOPASSWD: /usr/bin/pacman" >> /etc/sudoers.d/f4z3r \
    && echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/wheel;

USER 1000

ENV EDITOR="nvim"

RUN cargo install cbfmt@0.2.0;

# Split from cargo install to re-use layer cache
RUN mkdir -p /home/f4z3r/workspace/ \
    && mkdir -p /home/f4z3r/.config/nvim/;

COPY --chown=f4z3r:f4z3r ./assets/init.lua /home/f4z3r/.config/nvim/init.lua

WORKDIR /home/f4z3r/workspace
