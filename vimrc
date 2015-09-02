" VUNDLE
set shell=/bin/bash
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" CtrlP
Plugin 'https://github.com/kien/ctrlp.vim.git'

" Ag
Plugin 'rking/ag.vim'

"ColorSchemes
Plugin 'flazz/vim-colorschemes'

"Thematic
"Plugin 'reedes/vim-thematic.git'

"Airline
Plugin 'bling/vim-airline.git'

"Lua-Support-2
"Plugin 'WolfgangMehner/lua-support.git'

"LuaInspect
"Plugin 'xolox/vim-lua-inspect'

"Rainbow Parentheses Improved
Plugin 'luochen1990/rainbow'

"Vim-Misc
Plugin 'xolox/vim-misc'

"Bad white-space
Plugin 'bitc/vim-bad-whitespace.git'

"NerdCommenter
Plugin 'scrooloose/nerdcommenter.git'

"Fugitive
Plugin 'tpope/vim-fugitive.git'

"Startify
Plugin 'mhinz/vim-startify.git'

"Syntastic
Plugin 'scrooloose/syntastic.git'

"VimTmuxNavigator
Plugin 'christoomey/vim-tmux-navigator.git'

"NerdTree
Plugin 'scrooloose/nerdtree.git'

"TmuxLine
Plugin 'edkolev/tmuxline.vim'

"GitGutter
Plugin 'airblade/vim-gitgutter'

"SuperTab
Plugin 'ervandew/supertab'

"Vim-Fish
Plugin 'dag/vim-fish'

"Clojure 1
Plugin 'guns/vim-clojure-static'

"Clojure 2
Plugin 'guns/vim-clojure-highlight'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" Put your non-Plugin stuff after this line
syntax enable
set ts=3
set laststatus=2

"Set colorscheme
colorscheme Chasing_Logic

"Airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"Strip all trailing whitespaces when saving
"autocmd BufWritePre * :%s/\s\+$//e

" Fix Tabs
" size of a hard tabstop
set tabstop=3
" size of an "indent"
set shiftwidth=3
" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=3
" make "tab" insert indents instead of tabs at the beginning of a line
set smarttab"
" " always uses spaces instead of tab characters
set expandtab

"Startify
let g:startify_bookmarks = [ '~/.vimrc' ]
let g:startify_custom_header =
    \ map(split(system('fortune -a | fmt -80 -s | cowsay -$(shuf -n 1 -e b d g p s t w y) -f $(shuf -n 1 -e $(cowsay -l | tail -n +2)) -n;'), '\n'), '"   ". v:val') + ['','']
autocmd User Startified setlocal buftype=

"CtrlP shortcut
map <leader>y :CtrlPBuffer<cr>s

set t_Co=256
set t_ut=

"Show line numbers
set number

"Replace all, under cursor
:nnoremap <leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

"Rainbow Parentheses
let g:rainbow_active = 1

let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'lua': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/\<\(function\|do\|then\)\>/ end=/\<\(end\|elseif\)\>/', 'start=/{/ end=/}/' ]
    \       }
    \   }
    \}

"Press C-r to replace the selected text in visual mode
vnoremap <C-r> "hy:%s,<C-r>h,,gc<left><left><left>

"Improved Searching
"set hlsearch
set incsearch
nnoremap <F3> :set hlsearch!<CR>

"Speed up <Esc>
set ttimeout
set ttimeoutlen=25
set notimeout
