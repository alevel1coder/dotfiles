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
"Plug 'yuezk/vim-js'
"Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'othree/yajs.vim'

" General tools
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

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
set signcolumn=yes
set guicursor=n-v-c:block-Cursor

" No backups and better undo
set nobackup
set undodir=~/.vim/undodir
set undofile
set noswapfile
set hidden

" Better searching
set incsearch
set smartcase

" Always display the status line
set laststatus=2

" Don't wrap text
set nowrap

" Turn on syntax
syntax on

" scroll the file when you hit X lines away from bottom/top
set scrolloff=8

" Display hidden characters
set list
set listchars=tab:•\ ,trail:•,extends:»,precedes:«

" Give more space for displaying messages
set cmdheight=2

" Having longer updatetime (default is 4000ms = 4s) leads to
" noticable delays and poor user experience
set updatetime=300

" Don't pass messages to |ins-completion-menu|
set shortmess+=c



" ----VISUAL STUFF----
" Set some themeing options like colorscheme and background colors
set t_Co=256
set t_ut=
colorscheme nord
" Manual color overrides
highlight Character cterm=NONE ctermfg=044
highlight String cterm=NONE ctermfg=044
highlight Number cterm=NONE ctermfg=117
highlight Float cterm=NONE ctermfg=117
highlight Type cterm=NONE ctermfg=105
highlight Function cterm=NONE ctermfg=141
highlight Statement cterm=NONE ctermfg=147
highlight PreProc cterm=None ctermfg=075

" Add a column 80 characters in if it is a python file
autocmd FileType python set colorcolumn=80
autocmd FileType python highlight ColorColumn ctermbg=darkgrey guibg=lightgrey

" Set highlight options
highlight Visual ctermbg=239
highlight Comment ctermfg=243
highlight MatchParen term=reverse ctermfg=white ctermbg=darkgreen

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
let g:airline_theme='bubblegum'

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


"                        -------- CoC Remaps --------
" Use TAB for trigger completion with characters ahead and navigate
noremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-@> coc#refresh()


" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
map <silent> gd <Plug>(coc-definition)
map <silent> gy <Plug>(coc-type-definition)
map <silent> gi <Plug>(coc-implementation)
map <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>


function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" Highlight the symbol and it's references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

