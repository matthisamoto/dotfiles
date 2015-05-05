set nocompatible
autocmd!

" ---------------------------------
" Plugins
" ---------------------------------

if filereadable(glob('~/.vimrc.bundles'))
  source ~/.vimrc.bundles
endif

let g:ctrlp_map           = ''
let g:ctrlp_match_func    = {'match': 'matcher#cmatch'}
let g:ctrlp_match_window  = 'bottom,order:btt,min:1,max:10,results:1000'
let g:ctrlp_max_depth     = 40
let g:ctrlp_max_files     = 0
let g:ctrlp_user_command  = 'ag %s --files-with-matches --nocolor --nogroup -g "" --ignore="build/" --ignore "vendor/" --ignore="Godeps/" --ignore="node_modules/"'

let g:syntastic_enable_signs  = 1
let g:syntastic_ruby_mri_exec = expand('~/.rvm/rubies/ruby-2.2.0/bin/ruby')
let g:syntastic_java_javac_custom_classpath_command = 'gradle buildClassPath'
let g:syntastic_mode_map = {
  \ "mode": "active",
  \ "passive_filetypes": ["java"] }

" ---------------------------------
" Options
" ---------------------------------

colorscheme buddin
filetype plugin indent on
syntax on

set autoindent
set autoread
set background=light
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
set preserveindent
set ruler
set scrolloff=3
set shiftround
set shiftwidth=4
set shortmess=atI
set showcmd
set showmode
set sidescroll=1
set sidescrolloff=7
set softtabstop=2
set spelllang=en_us
set statusline+=%f
set statusline+=\ [%{fugitive#head()}]
set statusline+=%=
set statusline+=%{SyntasticStatuslineFlag()}%*
set statusline+=\ [%l,%c\ %P]
set statusline+=\ [%{strlen(&ft)?&ft:'none'}]
set suffixes=.bak,~,.o,.h,.info,.swp,.class
set tabstop=4
set textwidth=120
set undodir=~/.vim/tmp/undo/
set undofile
set undoreload=10000
set whichwrap=<,>,h,l
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.fla,*.swf,*.o,*.obj,*.exe,*.dll,*.manifest,*.pyc,*.class,*.sw?,.DS_Store,.vagrant
set wildmenu

set noerrorbells
set nolist
set nonumber
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
noremap <leader>r :CtrlPMRUFiles<CR>
noremap <leader>u :CtrlPUndo<CR>

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

" Clear highlight and redraw
nnoremap <C-L> :nohlsearch<CR><C-L>
inoremap <C-L> <C-O>:nohlsearch<CR>

nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


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
  autocmd BufRead,BufNewFile *.gradle set filetype=groovy

  autocmd Filetype java setlocal omnifunc=javacomplete#Complete
  autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 omnifunc=rubycomplete#Complete
  autocmd Filetype gitcommit setlocal textwidth=72 spell
  autocmd Filetype text setlocal spell
  autocmd Filetype markdown setlocal spell
augroup END

if filereadable(glob('~/.vimrc.local'))
  source ~/.vimrc.local
endif

silent execute '!mkdir -p $HOME/.tmp/swap'
silent execute '!mkdir -p $HOME/.tmp/backup'
silent execute '!mkdir -p $HOME/.tmp/undo'
