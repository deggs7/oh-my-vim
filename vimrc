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
Plugin 'Shutnik/jshint2.vim'
Plugin 'majutsushi/tagbar'
Plugin 'digitaltoad/vim-jade'
Plugin 'mileszs/ack.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/nerdcommenter'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'The-NERD-tree'
Plugin 'authorinfo'
Plugin 'Command-T'	" conflict with macvim
Plugin 'mayansmoke'

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
" filetype plugin on
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
autocmd FileType less setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType scss setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType jade setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 textwidth=80
autocmd FileType text setlocal wrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable

if has("gui_running") || has("gui_macvim")
    " good for eyes
    colorscheme mayansmoke 
    let g:colors_name="mayansmoke"

    " colorscheme molokai
    " let g:colors_name="molokai"
endif

if MySys() == "mac"
    set guifont=Monaco:h16
    " set guifontwide=Hei_Regular:h14
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
    let g:NERDTreeWinSize = 32
    :NERDTree
endfunction

" JSHint setting
nmap <silent> <leader>jh :call OpenJSHint()<cr>
function! OpenJSHint()
    :JSHint
endfunction

" Tagbar setting
nmap <silent> <leader>tb :TagbarToggle<cr>

" Command-T
nmap <silent> <leader>ct :CommandT<cr>

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_autoclose_preview_window_after_completion = 1
nmap <silent> <leader>gg :YcmCompleter GoToDefinition<cr>
nmap <silent> <leader>rr :YcmCompleter GoToReferences<cr>
nmap <silent> <leader>tt :YcmCompleter GetType<cr>
" nmap <silent> <leader>dc:YcmCompleter GetDoc<cr>
command! -nargs=1 RR :call s:RefactorRename(<f-args>)
function s:RefactorRename(newName)
    echo a:newName
    :execute ":YcmCompleter RefactorRename " a:newName
endfunction

" Nerd Commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Author Info
nmap <F4> :AuthorInfoDetect<cr> 
let g:vimrc_author='DeKun' 
let g:vimrc_email='deggs.k@gmail.com' 
let g:vimrc_homepage='https://github.com/deggs7' 
