FROM archlinux:base-20260823.0.578598@sha256:b860afd5823683f7ea389ba5f00d812f4fe55f6f286dea329d2abeefa535e309

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
      mise \
    && npm install -g @earendil-works/pi-coding-agent@0.85.1 @wcj/html-to-markdown@2.1.1 \
    && groupadd -g 100 f4z3r \
    && useradd -u 1000 -g 100 -m f4z3r \
    && usermod -aG wheel f4z3r \
    && echo "f4z3r ALL=(ALL) NOPASSWD: /usr/bin/pacman" >> /etc/sudoers.d/f4z3r \
    && echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/wheel;

USER 1000

ENV EDITOR="nvim"

RUN cargo install cbfmt@0.2.0;

ENV PATH="$PATH:/home/f4z3r/.cargo/bin:/home/f4z3r/.local/bin"

RUN mkdir -p /home/f4z3r/.local/share \
    && mise settings trusted_config_paths="/" \
    && mkdir -p /home/f4z3r/workspace/ \
    && mkdir -p /home/f4z3r/.config/nvim/;

COPY --chown=f4z3r:f4z3r ./assets/init.lua /home/f4z3r/.config/nvim/init.lua

WORKDIR /home/f4z3r/workspace
