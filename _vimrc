syntax on
set clipboard=unnamed
let mapleader = ","
set number
set number relativenumber

" Mapping to reload configuration
nmap <leader>so :source $HOME\_vimrc<CR>

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

set pythonthreehome=C:\Users\ADMIN\AppData\Local\Programs\Python\Python38\
set pythonthreedll=C:\Users\ADMIN\AppData\Local\Programs\Python\Python38\python38.dll

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Colorscheme
Plug 'chriskempson/base16-vim'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Lightline; statusline/tabline; fetches https://github.com/itchyny/lightline.vim
Plug 'itchyny/lightline.vim'

" nnn; File manager https://github.com/mcchrish/nnn.vim.git
" Plug 'mcchrish/nnn.vim'

" Plug 'vifm/vifm.vim' " vifm file manager

Plug 'ap/vim-css-color' " Preview colours while editing; fetches https://github.com/ap/vim-css-color.git


" Initialize plugin system
call plug#end()

colorscheme base16-black-metal-bathory

" Unmap the Arrow keys
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>

ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>

" Setting Lightline-Plugin
set laststatus=2

" --INSERT-- is unnecessary anymore because the mode information is displayed in the statusline.
set noshowmode
