set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" For letting local folders have vimrc-files
Plugin 'thinca/vim-localrc'

" Filebrowser inside vim
Plugin 'scrooloose/nerdtree'

" Syntax-higlightning
Plugin 'ledger/vim-ledger'
Plugin 'groenewege/vim-less'

" Use git from inside vim
Plugin 'tpope/vim-fugitive'

" Add statusbar
Plugin 'bling/vim-airline'

Plugin 'kien/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" General config
scriptencoding utf-8
set encoding=utf-8
set number
set background=dark
syntax enable

" Airline-config
set laststatus=2
set timeoutlen=50
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1

" Highlight end of line whitespace.
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" Highlight everything after character 80 on a line.
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" NERDTree
nnoremap nt :NERDTree<CR>
autocmd vimenter * if !argc() | NERDTree | endif " Open if no files were specified

" Make tabs, trailing whitespace, and non-breaking spaces visible
set listchars=tab:»\ ,nbsp:~
set list

" Stupid mac
set backspace=indent,eol,start
