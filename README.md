Here are some confiration files that I use on my linux laptop. You can clone it to your machine and then link the files into where they should live, execute the following from this directory after ensuring that the target files have been removed.

* init.vim -> `ln -s $PWD/init.vim ~/.config/nvim/init.vim`
* .tmux.conf -> `ln -s $PWD.tmux.conf ~/.tmux.conf`

## nvim configuration

The nvim configuration needs "Plug" to work. You can install it from [here](https://github.com/junegunn/vim-plug)

You need to install `fzy`, `node` and `silver_searcher` for some of the plugins to work.

### Coc

The Coc plugin of nvim also has a plugin system of itself. I recommend installing:
* coc-java
* coc-python
* coc-snippets
* coc-tsserver
* coc-rls (rust)
* coc-json

Also, remember running `PlugUpdate` once in a while, might be needed to install new `coc` plugins.
