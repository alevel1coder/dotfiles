" ----------------------------------------------------------------------------
"                             _                           
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
call plug#begin('~/.vim/plugged')
" Themes and visuals
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'

" Language tools and support
Plug 'leafgarland/typescript-vim'
Plug 'lyuts/vim-rtags' 
Plug 'sheerun/vim-polyglot'

" General tools
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git and task management tools
Plug 'tpope/vim-fugitive'
Plug 'vuciv/vim-bujo'

" Navigation
Plug 'scrooloose/nerdtree'


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

" Set some themeing options like colorscheme and background colors
syntax on
set colorcolumn=80
highlight ColorColoumn ctermbg=0 guibg=lightgrey
colorscheme gruvbox
set background=dark

"
" ----------------------------------------------------------------------------
" 
"                     -------- Plugins Settings -------
"
"                          ------- NerdTree -------
let NERDTreeShowHidden=1

"                             ------- FZF ------
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

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

"                          ------- NerdTree -------
" 
"
"                             ------- FZF ------
