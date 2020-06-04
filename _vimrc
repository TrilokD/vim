syntax on
set clipboard=unnamed
let mapleader = ","
set number
set cursorline
set noeb vb t_vb=
set tabstop=4 softtabstop=4 shiftwidth=4
set shiftround
set expandtab
set smartindent
set nowrap
set smartcase
set hlsearch
set incsearch
set ignorecase
set noswapfile
set bs=2

" Mapping to reload configuration
nmap <leader>sv :source $HOME\_vimrc<CR>
nmap <leader>ev :edit $HOME\_vimrc<CR>

vnoremap <leader>s :sort<CR>

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
    set linespace=4
    set guioptions-=m  "menu bar
    set guioptions-=T  "toolbar
    set guioptions-=r  "scrollbar
    map <F11> <Esc>:call libcallnr("gvimfullscreen_64.dll", "ToggleFullScreen", 0)<CR>
  endif
endif

" - Avoid using standard Vim directory names like 'plugin'
set pythonthreehome=C:\Users\ADMIN\AppData\Local\Programs\Python\Python38\
set pythonthreedll=C:\Users\ADMIN\AppData\Local\Programs\Python\Python38\python38.dll


call plug#begin('~/.vim/plugged')

Plug 'chriskempson/base16-vim'
Plug 'junegunn/vim-easy-align'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/syntastic'
Plug 'dense-analysis/ale' "Ale
Plug 'vim-python/python-syntax'


" Initialize plugin system
call plug#end()

""""""""""""""""""""""" Ale
let b:ale_linters = {'python': ['flake8', 'pydocstyle', 'bandit', 'mypy']}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort'],
\}
let g:ale_fix_on_save = 1

" PySyntax
let g:python_highlight_all = 1

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Setting Lightline-Plugin
let g:lightline = {
      \ 'colorscheme': 'simpleblack',
      \ }

" base16
colorscheme base16-3024
set laststatus=2

set history=700
set undolevels=700

" General mapping
no <down> ddp
no <left> <Nop>
no <right> <Nop>
no <up> ddkP

vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>

vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>

nmap <C-Tab> :tabnext<CR>
nmap <C-S-Tab> :tabprevious<CR>
map <C-Tab> :tabnext<CR>
map <C-S-Tab> :tabprevious<CR>
imap <C-Tab> <ESC>:tabnext<CR>
imap <C-S-Tab> <ESC>:tabprevious<CR>
nmap <Leader>h :tabnew %:h<CR>

imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i

noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

noremap <leader>e :q<CR>
noremap <leader>E :qa!<CR>

" set <F5> to exec pythonFile
noremap <F5> :!python %<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" NERDTree
noremap <leader>n :NERDTreeToggle<CR>

" --INSERT-- is unnecessary anymore because the mode information is displayed in the statusline.
set noshowmode

" Syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" check every time you write a Python file
" autocmd BufWritePost *.py call flake8#Flake8()

set nofoldenable
