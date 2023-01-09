" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/rename.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'cloudhead/neovim-fuzzy'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
"Plug 'jiangmiao/auto-pairs'
Plug 'yegappan/grep'
Plug 'mileszs/ack.vim'
Plug 'zivyangll/git-blame.vim'
"Plug 'tpope/vim-commentary'
Plug 'terrortylor/nvim-comment'
Plug 'github/copilot.vim'
Plug 'mattn/emmet-vim'
Plug 'vim-scripts/BufOnly.vim'
Plug 'OmniSharp/omnisharp-vim'
call plug#end()

""" Define Leader
:let mapleader = ","

""" Commentary

" gc with motion is the shortcut.

""" Airline configuration

let g:airline#extensions#tabline#enabled = 1

" Configure Fuzzy Finder
nnoremap <C-o> :FuzzyOpen<CR>

" Close all buffers but this

"nnoremap <C-g>c :%bd|e#|bd#

" Configure NerdTree
nnoremap <silent> <A-1> :NERDTreeToggle<CR>
nnoremap <silent><leader>n :NERDTreeFind<CR>


let NERDTreeShowHidden=1

"augroup nerdtree_open
"    autocmd!
"    autocmd VimEnter * NERDTree | wincmd p
"augroup END

" Spaces & Tabs {{{
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line
" " }}} Spaces & Tabs

" numbers
set number

" Code folding
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=1

" close all buffers
" nnoremap <silent> gqo ":%bd|e#|bd#<CR>"

" ------------------------------------
" Setting up CoC Conquer of Completion
" ------------------------------------

" TextEdit might fail if hidden is not set.
set hidden
set autowrite

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <C-tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<c-g>u\<CR>"

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#_select_confirm()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() :  "\<c-g>u\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> grr <Plug>(coc-references)
nmap <silent> grn <Plug>(coc-rename)
nmap <silent> gsw :CocDiagnostics<cr>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" CoC Snippets

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

let g:coc_snippet_next = '<tab>'

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

command Bd execute "%bd|e#|bd#"

""" Searcher 

" Uses Silver searcher instead of ack, since that should be nicer.
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

nnoremap <silent> <C-f> :Ack 

""" map git blame
nnoremap gb :<C-u>call gitblame#echo()<CR>

nnoremap <C-c> :bufdo q<CR>

""" Navigation 

nnoremap <silent> <C-k> :bnext<CR>
nnoremap <silent> <C-j> :bprevious<CR>

""" Commentary

lua require('nvim_comment').setup()
