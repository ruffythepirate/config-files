"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

" Activate folding.
set foldmethod=indent
set foldlevelstart=20

" Required:
if dein#load_state('/home/johan/.local/share/dein')
  call dein#begin('/home/johan/.local/share/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/johan/.local/share/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  " call dein#add('xolox/misc')
  call dein#add('xolox/vim-misc')
  call dein#add('xolox/vim-notes')
  call dein#add('flazz/vim-colorschemes')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('tmux-plugins/vim-tmux-focus-events')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" Configure Notes directory:
:let g:notes_directories = ['~/Documents/Notes']

" Tab line when shown for all buffers.
let g:airline#extensions#tabline#enabled = 1

let g:gitgutter_sign_column_always = 1

" don't hide all of the backticks etc.
let g:vim_markdown_conceal = 0

set expandtab
set shiftwidth=2
set softtabstop=2
set noswapfile


" Ctags configuration:

set tags=./.tags,.tags,./tags,tags

" Key mappings
" ==============
" Buffer Navigation
nmap <C-j> :bp<cr>
nmap <C-k> :bn<cr>
nmap <C-l><C-l> :ls<cr>
nmap <C-l><C-k> :bw<cr>

" Window Navigation
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>

" Goto definition
nmap gr gdlbvey:%s/<C-R>"//gc<left><left><left>
nmap gR gdlbvey[{V%::s/<C-R>"//gc<left><left><left>

" AutoClose of brackes
autocmd FileType c,cpp,java,rust,kotlin,scala inoremap { {<CR>}<Esc>O
autocmd FileType c,cpp,java,rust,kotlin,scala inoremap ( ()<Left>
autocmd FileType c,cpp,java,rust,kotlin,scala inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

" displays line numbers
set nu

" Enables reading external changes
set autoread
autocmd FocusGained * checktime

" Enables so that buffers are autosaved on change.
set autowriteall
" autocmd FocusLost * writeall
" Enables that buffers can be hidden.
set hidden

" Extra Windows

"set hidden
"set number
"colo desert 
"filetype plugin indent on
