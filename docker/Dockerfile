# To create container: 
    # docker build -t neovim-book .
# To run container for both Vim and Neovim:
    # docker run -v $WORKSPACE/vim_courses/book/docker/vim:/root/.vim \
    # -v $WORKSPACE/vim_courses/book/docker/nvim:/root/.config/nvim  \
    # -v $WORKSPACE/vim_courses/book/:/root/book \
    # -ti neovim-book

FROM archlinux:base

RUN pacman-key --init && \
    pacman-key --populate archlinux && \
    pacman -Sy --noconfirm archlinux-keyring && \
    pacman -Syu --noconfirm && \
    pacman -S --noconfirm ripgrep perl xdg-utils ctags tree rust jq diffutils yamllint luacheck go neovim gvim ed vi man man-pages lua git xclip xsel pandoc

RUN mkdir -p /root/book
RUN rm -rf /var/cache/pacman/* /tmp/* /var/tmp/*

ENTRYPOINT [ "bash" ]

# docker run -ti neovim-book
