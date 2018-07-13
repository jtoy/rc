set nocompatible              " be iMproved
filetype off                  " required!
set fileencoding=utf-8
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
let g:ruby_path = system('echo $HOME/.rbenv/shims')



" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-surround.git'
Bundle 'vim-scripts/paredit.vim.git'
Bundle 'Shougo/neocomplcache.vim.git'
Bundle 'luochen1990/rainbow'

let g:rainbow_active = 1 
let g:acp_enableAtStartup = 0
let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_temporary_dir = "$HOME/.vim/tmp/neocomplcache"
let g:neocomplcache_auto_completion_start_length = 2
let g:neocomplete#max_list = 15

set clipboard=unnamed
Bundle 'Lokaltog/vim-easymotion.git'


Bundle 'airblade/vim-gitgutter'

Bundle 'myusuf3/numbers.vim.git'
Bundle 'ahw/vim-pbcopy.git'

set nu " Line numbers on

Bundle 'tpope/vim-fugitive.git'


Bundle 'dockyard/vim-easydir.git'
let g:EasyMotion_leader_key = ','

Bundle 'guns/vim-clojure-static.git'
let g:clojure_align_multiline_strings = 1

Bundle 'tpope/vim-vividchalk.git'
Bundle 'altercation/vim-colors-solarized.git'

Bundle 'bling/vim-bufferline.git'

au BufRead,BufNewFile *.pde     setf java

syntax on
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme vividchalk
let mapleader = ','
filetype plugin indent on     " required!
set mouse=a
set history=1000
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set wrapscan                    " wrap the search
set ignorecase                  " ignore case while searching
set smartcase                   " no ignore case when pattern has uppercase
set magic                       " changes special characters in search patterns
set shiftwidth=2                " Use indents of 2 spaces
set expandtab                   " Tabs are spaces, not tabs
set showmode 
set ruler                       " show line,col info at the bottom
set showmode " show the mode INSERT/REPLACE/...
set visualbell                  " no sounds

set statusline=%<%f\                     " Filename
set statusline+=%w%h%m%r                 " Options
set statusline+=%{fugitive#statusline()} " Git Hotness
set statusline+=\ [%{&ff}/%Y]            " Filetype
set statusline+=\ [%{getcwd()}]          " Current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

vmap <C-x> :!pbcopy<CR>  
vmap <C-c> :w !pbcopy<CR><CR> 
