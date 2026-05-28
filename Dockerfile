FROM archlinux:base-20260517.0.530531@sha256:1047e6e7878d58e4ee47e1cd6459a32fab41246b0efc4109e11b7ef16f50b14d

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
    && npm install -g @earendil-works/pi-coding-agent@0.75.5 @wcj/html-to-markdown@2.1.1 \
    && groupadd -g 100 f4z3r \
    && useradd -u 1000 -g 100 -m f4z3r \
    && usermod -aG wheel f4z3r \
    && echo "f4z3r ALL=(ALL) NOPASSWD: /usr/bin/pacman" >> /etc/sudoers.d/f4z3r \
    && echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/wheel;

USER 1000

ENV EDITOR="nvim"

RUN cargo install cbfmt@0.2.0;

ENV PATH="$PATH:~/.cargo/bin"

RUN mkdir -p /home/f4z3r/workspace/ \
    && mkdir -p /home/f4z3r/.config/nvim/;

COPY --chown=f4z3r:f4z3r ./assets/init.lua /home/f4z3r/.config/nvim/init.lua

WORKDIR /home/f4z3r/workspace
