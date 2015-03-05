set nocompatible
autocmd!

" ---------------------------------
" Plugins
" ---------------------------------

if filereadable(glob('~/.vimrc.bundles'))
  source ~/.vimrc.bundles
endif

let g:ctrlp_by_filename   = 1
let g:ctrlp_match_window  = 'bottom,order:btt,min:1,max:10,results:100'
let g:ctrlp_max_depth     = 40
let g:ctrlp_max_files     = 0
let g:ctrlp_user_command  = 'ag %s --files-with-matches --nocolor --nogroup -g "" --ignore "vendor$\|node_modules$\|\.git$\|\.hg$\|\.svn$"'

let g:syntastic_enable_signs  = 1
let g:syntastic_ruby_mri_exec = expand('~/.rvm/rubies/ruby-2.2.0/bin/ruby')

" ---------------------------------
" Options
" ---------------------------------

colorscheme jellybeans
filetype plugin indent on
syntax on

set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set backupdir=~/.vim/tmp/backup/
set breakat=\ |@-+;:,./?^I
set dir=~/.vim/tmp/swap/
set encoding=utf-8
set expandtab
set formatoptions=cqrt
set hidden
set hlsearch
set grepprg=ag\ --nogroup\ --nocolor
set incsearch
set laststatus=2
set linebreak
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set mouse=a
set number
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

" File and buffer navigation
noremap <leader>f :CtrlP<CR>
noremap <leader>b :CtrlPBuffer<CR>

" Toggle Location and Quickfix Lists
nmap <script> <silent> <leader>l :call ToggleLocationList()<CR>
nmap <script> <silent> <leader>q :call ToggleQuickfixList()<CR>

" Sane movement
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" Pane movement
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

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
" Commands
" ---------------------------------

command! TrimWhitespace call TrimWhitespace()

function! TrimWhitespace()
  %s/\s\+$//e
endfunction


" ---------------------------------
" Auto Commands
" ---------------------------------

augroup main
  autocmd!

  autocmd VimResized * exe 'normal! \<c-w>='
augroup END

augroup filetypes
  autocmd!

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
  autocmd Filetype javascript setlocal tabstop=4 shiftwidth=4 softtabstop=4
augroup END

if filereadable(glob('~/.vimrc.local'))
  source ~/.vimrc.local
endif

silent execute '!mkdir -p $HOME/.tmp/swap'
silent execute '!mkdir -p $HOME/.tmp/backup'
silent execute '!mkdir -p $HOME/.tmp/undo'
