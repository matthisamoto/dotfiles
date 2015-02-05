set nocompatible

" ---------------------------------
" Plugins
" ---------------------------------

if filereadable(expand($HOME . '/.vimrc.bundles'))
  source $HOME/.vimrc.bundles
endif

let g:netrw_banner=0
let g:syntastic_enable_signs=1

" ---------------------------------
" Options
" ---------------------------------

colorscheme solarized
filetype plugin indent on
syntax on

set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set backupdir=~/.vim/tmp/backup/
set breakat=\ |@-+;:,./?^I
set cursorline
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
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.fla,*.swf,*.o,*.obj,*.exe,*.dll,*.manifest,*.pyc,*.class,*.sw?,.DS_Store,.vagrant
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

let mapleader = ','
nnoremap ; :

noremap <leader>f :CtrlP<CR>
noremap <leader>b :CtrlPBuffer<CR>

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
  autocmd VimResized * exe 'normal! \<c-w>='
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

if filereadable(expand($HOME . '/.vimrc.local'))
  source $HOME/.vimrc.local
endif

call system('mkdir -p ~/.vim/tmp/swap')
call system('mkdir -p ~/.vim/tmp/backup')
call system('mkdir -p ~/.vim/tmp/undo')
