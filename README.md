Here are some confiration files that I use on my linux laptop. You can clone it to your machine and then link the files into where they should live, execute the following from this directory after ensuring that the target files have been removed.

* init.vim -> `ln -s $PWD/init.vim ~/.config/nvim/init.vim`
* .tmux.conf -> `ln -s $PWD.tmux.conf ~/.tmux.conf`

## nvim configuration

The nvim configuration needs dein installed, which includes setting a dein directory. You can read about it here: (dein install)[https://github.com/Shougo/dein.vim]. Make sure that your dein is installed according to the init.vim (or change the content of the init.vim)
