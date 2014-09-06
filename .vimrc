set number
set background=dark
syntax enable

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
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  autocmd BufRead,BufNewFile *.json set filetype=json
  autocmd BufRead,BufNewFile,FileReadPost *.py source ~/.vim/python2
  autocmd BufNewFile *.py 0r ~/.vim/skel/python.py

  autocmd BufRead,BufNewFile,FileReadPost *.html set tabstop=2 noexpandtab autoindent shiftwidth=2
  autocmd BufRead,BufNewFile,FileReadPost *.erb set tabstop=2 shiftwidth=2 softtabstop=2 expandtab autoindent
  autocmd BufNewFile *.html 0r ~/.vim/skel/index.html

  autocmd BufRead,BufNewFile,FileReadPost *.php set tabstop=4 noexpandtab autoindent shiftwidth=4
  " autocmd BufRead,BufNewFile,FileReadPost *.php set tabstop=4 shiftwidth=4 softtabstop=4 expandtab autoindent
  autocmd BufRead,BufNewFile,FileReadPost *.css set tabstop=4 noexpandtab autoindent shiftwidth=4
  " autocmd BufRead,BufNewFile,FileReadPost *.css set tabstop=2 shiftwidth=2 softtabstop=2 expandtab autoindent
  autocmd BufRead,BufNewFile,FileReadPost *.less set tabstop=2 shiftwidth=2 softtabstop=2 expandtab autoindent
  autocmd BufRead,BufNewFile,FileReadPost *.c set tabstop=4 noexpandtab autoindent smartindent shiftwidth=4
  autocmd FileType haskell set expandtab tabstop=4 shiftwidth=4 softtabstop=4 autoindent smartindent
  autocmd BufRead,BufNewFile,FileReadPost *.rb set expandtab tabstop=2 shiftwidth=2 softtabstop=2 autoindent smartindent
  autocmd FileType erlang set expandtab tabstop=4 shiftwidth=4 softtabstop=4 autoindent smartindent
  autocmd FileType rust set expandtab tabstop=4 shiftwidth=4 softtabstop=4 autoindent smartindent
  autocmd BufRead,BufNewFile,FileReadPost *.axlsx set filetype=ruby
endif

execute pathogen#infect()
