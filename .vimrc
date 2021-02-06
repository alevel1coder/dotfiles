" ---------------------------------------------------------------------------
"
"                            (_)
"                    __   __  _   _ __ ___    _ __    ___
"                    \ \ / / | | | '_ ` _ \  | '__|  / __|
"                     \ V /  | | | | | | | | | |    | (__
"                      \_/   |_| |_| |_| |_| |_|     \___|
"
"
"  This is the 'config' file for controlling how vim behaves and looks.
"
" ----------------------------------------------------------------------------
"
"                     ------- Plugins Install Start --------
"
" Install vim-plug and plugins if vim-plug is not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Themes and visuals
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Language tools and support
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prettier/vim-prettier', { 'do': 'npm install'  }

" Javascript and React tools
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'

" General tools
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'jiangmiao/auto-pairs'

" Git and task management tools
Plug 'tpope/vim-fugitive'

" Navigation
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


call plug#end()
"
"                     ------- Plugins install End -------
"
" ----------------------------------------------------------------------------
"
"                     ------- General vim settings -------
"

" No noise
set noerrorbells

" Set proper tabs and indents
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Show line numbers
set nu
set ruler

" Don't make the vim swap files
set noswapfile

" No backups and better undo
set nobackup
set undodir=~/.vim/undodir
set undofile

" Better searching
set incsearch
set smartcase

" Always display the status line
set laststatus=2

" Don't wrap text
set nowrap

" Turn on syntax
syntax on

" Set some themeing options like colorscheme and background colors
set t_Co=256
set t_ut=
colorscheme nord
" set background=dark

" Add a column 80 characters in if it is a python file
autocmd FileType python set colorcolumn=80 highlight ColorColumn ctermbg=darkgrey guibg=lightgrey

" Set highlight options
highlight Visual ctermbg=darkgreen
highlight Comment ctermfg=darkgrey 

" Display hidden characters
" set list
" set listchars=tab:•\ ,trail:•,extends:»,precedes:«


"
" ---------------------------------------------------------------------------
"
"                     -------- Plugins Settings -------
"
"                          ------- NerdTree -------
let NERDTreeShowHidden=1

"                             ------- FZF ------
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'


"                           ------- Airline -------
let g:airline#extensions#coc#enabled=1


"
" ----------------------------------------------------------------------------
"
"                      ------- Custom Key remaps -------
"
" Map the 'leader' key, which is used for some user set commands
let mapleader = " "

"                        ------- General Remaps -------
" Window movement
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

" For simple sizing of splits.
map - <C-W>-
map + <C-W>+

