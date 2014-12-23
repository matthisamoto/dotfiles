set nocompatible

" ---------------------------------
" Plugins
" ---------------------------------

set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'danro/rename.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'vim-ruby/vim-ruby'

call vundle#end()

let g:netrw_banner=0
let g:syntastic_enable_signs=1
let g:syntastic_ruby_mri_exec="$HOME/.rbenv/shims/ruby"
let g:unite_source_file_rec_max_cache_files=0
let g:unite_source_grep_command='ack'
let g:unite_source_grep_default_opts="-i --noheading --nocolor --known-types --with-filename"
let g:unite_source_rec_async_command="ack -f --nofilter --nocolor"

call unite#custom#source("file_mru,file_rec,file_rec/async", "max_candidates", 0)
call unite#filters#matcher_default#use(["matcher_fuzzy"])
call unite#filters#sorter_default#use(["sorter_rank"])

function! s:unite_settings()
  nmap <buffer> <C-c> <Plug>(unite_exit)
endfunction

" ---------------------------------
" Options
" ---------------------------------

colorscheme tir_black
filetype plugin indent on
syntax on

set autoindent
set autoread
set backspace=indent,eol,start
set backupdir=~/.vim/tmp/backup/
set breakat=\ |@-+;:,./?^I
set dir=~/.vim/tmp/swap/
set encoding=utf-8
set expandtab
set formatoptions=cqrt
set hidden
set hlsearch
set incsearch
set laststatus=2
set linebreak
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set mouse=a
set preserveindent
set ruler
set shiftround
set shiftwidth=2
set shortmess=at
set showcmd
set showmode
set softtabstop=2
set spelllang=en_us
set statusline+=%f
set statusline+=%=
set statusline+=%{SyntasticStatuslineFlag()}%*
set statusline+=\ [%l,%c\ %P]
set statusline+=\ [%{strlen(&ft)?&ft:'none'}]
set statusline+=\ [%{fugitive#head()}]
set tabstop=2
set textwidth=120
set undodir=~/.vim/tmp/undo/
set undofile
set undoreload=10000
set whichwrap=<,>,h,l
set wildmenu

set noerrorbells
set nolist
set nosmartindent
set nostartofline
set noswapfile
set nowrap


" ---------------------------------
" Mappings
" ---------------------------------

let mapleader = ","
nnoremap ; :

" Unite
nnoremap <leader>f :Unite -start-insert -auto-resize -buffer-name=files file_rec/async<CR>
nnoremap <leader>F :UniteWithBufferDir -start-insert -auto-resize -buffer-name=relative-files file<CR>
nnoremap <leader>b :Unite -start-insert -auto-resize -buffer-name=buffers buffer<CR>

" Sane movement
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Center search results
nnoremap n nzzzv
nnoremap N Nzzzv

" Indent selected text
vnoremap < <gv
vnoremap > >gv

" Formatting long lines (uses textwidth)
nnoremap Q gqip
vnoremap Q gq

" Sane regular expressions in search
nnoremap / /\v
vnoremap / /\v


" ---------------------------------
" Auto Commands
" ---------------------------------

augroup main
  autocmd BufWritePre * :%s/\s\+$//e
  autocmd VimResized * exe "normal! \<c-w>="
  autocmd FileType unite call s:unite_settings()
augroup END

augroup filetypes
  autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby
  autocmd BufRead,BufNewFile *.go set filetype=go
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.mkd set filetype=markdown
  autocmd BufRead,BufNewFile *.markdown set filetype=markdown
  autocmd BufRead,BufNewFile *.yml set filetype=yaml

  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  autocmd Filetype gitcommit setlocal textwidth=72 spell
  autocmd Filetype text setlocal spell
  autocmd Filetype markdown setlocal spell
augroup END

if filereadable(expand($HOME . "/.vimrc.local"))
  source $HOME/.vimrc.local
endif

call system("mkdir -p ~/.vim/tmp/swap")
call system("mkdir -p ~/.vim/tmp/backup")
call system("mkdir -p ~/.vim/tmp/undo")
