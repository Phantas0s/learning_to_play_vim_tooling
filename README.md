# Vim Book

This is the tooling I used for my book [Learning to Play Vim](). It's looks something like:

```
pandoc ->  lua filters -> latex/html -> pdf/epub.
```

See the Makefile to see how that works.

Generating the book:

```bash
make book.pdf
```

To create the docker image and have access to barebone Vim and Neovim, go to the `docker` folder and run the following:

```bash
docker build -t neovim-book .
```

To run the docker image:

```bash
docker run -v $WORKSPACE/vim_courses/book/:/root/book -ti neovim-book
```

## Inside Docker Container

Link a vimrc to current Vim instance:

```bash
ln -s /root/book/learning_to_play_vim_companion/rank_17/.vim /root
```

Link a init.lua to current Neovim instance:

```bash
mkdir /root/.config \
&& ln -s /root/book/learning_to_play_vim_companion/rank_17/nvim /root/.config/nvim \
&& alias nviml='nvim -u /root/.config/nvim/init.lua' \
&& alias nvim='nvim -u /root/.config/nvim/init.vim'
```

You might need vim-plug for some of them:

For Vim:

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

For Neovim:

```bash
sh -c 'curl -fLo \
"${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim\
 --create-dirs \
"https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
```

## Vim Mapping

There are some Vim user commands we can create to make our work easier.

This first one will create the current chapter we're editing in PDF:

```bash
command! W execute 'w | Make chapter='.expand('%').' chapter-print.pdf'
```

This one create the current chapter for the digital book, for the print version, and an epub also.

```bash
command! W execute 'w | Make chapter='.expand('%').' chapter-print.{pdf,epub} chapter.{pdf,epub}'
```

There are more in the file .vim/vimrc
