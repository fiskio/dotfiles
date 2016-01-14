" VUNDLE
set shell=/bin/bash
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"" PLUGINS

" CtrlP
Plugin 'https://github.com/kien/ctrlp.vim.git'

" Ag
Plugin 'rking/ag.vim'

"ColorSchemes
Plugin 'flazz/vim-colorschemes'

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
"Plugin 'scrooloose/syntastic.git'

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

"EasyTags
Plugin 'xolox/vim-easytags'

"Markdown
Plugin 'tpope/vim-markdown'

"HardMode
"Plugin 'wikitopian/hardmode'

"EasyMotion
Plugin 'easymotion/vim-easymotion'

"CamelCaseMotion
Plugin 'bkad/CamelCaseMotion'

"Clojure 1
Plugin 'guns/vim-clojure-static'

"Clojure 2
Plugin 'guns/vim-clojure-highlight'

"Gradle
Plugin 'tfnico/vim-gradle'

call vundle#end()            " required
filetype plugin indent on    " required

" CONFIG

syntax enable
set laststatus=2

"Set colorscheme
colorscheme Chasing_Logic

"Airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'

"Strip all trailing whitespaces when saving
"autocmd BufWritePre * :%s/\s\+$//e

" Fix Tabs
autocmd Filetype lua    setlocal ts=3 sw=3 expandtab
autocmd Filetype python setlocal ts=4 sw=4 expandtab

"Startify
let g:startify_bookmarks = [ '~/.vimrc' ]
let g:startify_custom_header =
         \ map(split(system('fortune -s -o | fmt -80 -s | cowsay -$(gshuf -n 1 -e b d g p s t w y) -f $(gshuf -n 1 -e $(cowsay -l | tail -n +2)) -n;'), '\n'), '"   ". v:val') + ['','']
"autocmd User Startified setlocal buftype=
108

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

"Move aross buffers
:nnoremap <C-n> :bnext<CR>
:nnoremap <C-p> :bprevious<CR>
:set autowrite

" Persist undo
set undofile
"maximum number of changes that can be undone
set undolevels=9999
"maximum number lines to save for undo on a buffer reload
set undoreload=9999
" set location
set undodir=$HOME/.vimundo//

"HardMode settings
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
"nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" avoid creating .swp files
set noswapfile
" avoid adding comments in new lines
set formatoptions-=or

" map Ctrl-S to page down
" works for colmak
:nnoremap <C-s> <C-b>
"Reopen files at the last edit location
if has("autocmd")
   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
