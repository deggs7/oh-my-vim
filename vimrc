""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" plugin on GitHub repo
" Plugin 'scrooloose/nerdtree'
Plugin 'tomasr/molokai'
Plugin 'mattn/emmet-vim'
Plugin 'nvie/vim-flake8'
Plugin 'Lokaltog/vim-powerline'
Plugin 'Valloric/YouCompleteMe'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'The-NERD-tree'
" Plugin 'Command-T'	" conflict with macvim

" plugin not on GitHub
" Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MySys()
    if has("win32") || has("win64")
        return "windows"
    elseif has("mac")
        return "mac"
    else
        return "linux"
    endif
endfunction

set t_Co=256

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,gbk,gb2312

" Move Backup Files to ~/.vim/backups/
set backupdir=~/.vim/backups
set undodir=~/.vim/undos

set laststatus=2   " Always show the statusline
set nu
set ruler

set showmatch
set ignorecase
set incsearch

set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set nowrap

set autoindent
set smartindent

set backspace=indent,eol,start

" language support
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 textwidth=80
autocmd FileType css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType scss setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 textwidth=80
autocmd FileType text setlocal wrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable

if has("gui_running") || has("gui_macvim")
    colorscheme molokai 
    let g:colors_name="molokai"
endif

if MySys() == "mac"
    set guifont=Monaco:h13
    " set guifontwide=Hei_Regular:h13
elseif MySys() == "linux"
    set guifont=Monospace
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mapleader=","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree setting
nmap <silent> <leader>nt :call OpenNERDTree()<cr>
function! OpenNERDTree()
    :NERDTree
endfunction

