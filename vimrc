set nocompatible
filetype off

" ---------------------------------
" Initialize Plugins
" ---------------------------------

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'chase/vim-ansible-yaml'
Plugin 'danro/rename.vim'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-ruby/vim-ruby'
Plugin 'junegunn/vim-easy-align'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-markdown'

call vundle#end()

" ---------------------------------
" UI
" ---------------------------------

set encoding=utf-8
set background=light
colorscheme tir_black
syntax on
set mouse=a
set visualbell t_vb=
set title
set titleold=

" Lines
set number
set nolist
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set noshowcmd
set showmode
set linespace=0

" Searching
set gdefault
set ignorecase
set smartcase
set grepprg=ack
set grepformat=%f:%l:%m
set iskeyword+=_,$,@,%,#,-
set hlsearch
set incsearch

" Indentation
filetype plugin indent on
set autoindent
set preserveindent
set shiftround
set nosmartindent
set backspace=indent,eol,start
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Wrapping
set nowrap
set linebreak
set breakat=\ |@-+;:,./?^I

" Status line
set laststatus=2
set statusline+=%f\ [%{fugitive#head()}]
set statusline+=%=
set statusline+=%{SyntasticStatuslineFlag()}%*
set statusline+=\ [%{strlen(&ft)?&ft:'none'}]
set statusline+=\ [%l,%c]\ %P

" Undo
set undofile
set undoreload=10000

" VCS markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Netrw
let g:netrw_banner=0


" ---------------------------------
" Completion
" ---------------------------------

set completeopt=longest,menuone,preview
set wildmode=list:longest,list:full

set wildignore+=*/.hg,*/.git,*/.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.fla,*.swf
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.pyc
set wildignore+=*.class
set wildignore+=*.sw?
set wildignore+=.DS_Store

set wildmenu
set complete=.,t


" ---------------------------------
" Buffers
" ---------------------------------

set hidden
set noswapfile
set dir=~/.vim/tmp/swap/
set backupdir=~/.vim/tmp/backup/
set undodir=~/.vim/tmp/undo/
call system("mkdir -p ~/.vim/tmp/swap")
call system("mkdir -p ~/.vim/tmp/backup")
call system("mkdir -p ~/.vim/tmp/undo")


" ---------------------------------
" Mappings
" ---------------------------------

command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g

let mapleader = ","
nnoremap ; :

" cd to current file's directory
nnoremap <leader>cd %:p:h

nnoremap <F2> :set hlsearch!<cr>
nnoremap <F3> :set wrap!<cr>
nnoremap <F4> :set number!<cr>
nnoremap <F5> :set paste!<cr>

" Sane movement
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" Indentation
vnoremap < <gv
vnoremap > >gv

" Select all
nnoremap vaa ggvGg_
nnoremap Vaa ggVG

" Window movement
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-q> <C-w>q

" Tagbar
let g:tagbar_width = 50
nnoremap <leader>t :TagbarToggle<CR>

nnoremap <leader>f :Unite -start-insert -auto-resize -buffer-name=files file_rec/async<cr>
nnoremap <leader>F :UniteWithBufferDir -start-insert -auto-resize -buffer-name=files file<cr>
nnoremap <leader>b :Unite -start-insert -auto-resize -buffer-name=buffers buffer<cr>
nnoremap <leader>h :Unite -start-insert -auto-resize -buffer-name=history history/yank<cr>
nnoremap <leader>r :Unite -start-insert -auto-resize -buffer-name=register register<cr>
nnoremap <leader>/ :Unite -start-insert -auto-resize -toggle grep:.<cr>
nnoremap <leader>d :Explore<CR>

nnoremap Y y$

" Insert mode completion
inoremap <C-L> <C-X><C-L>
inoremap <C-F> <C-X><C-F>
inoremap <C-O> <C-X><C-O>

" Formatting
nnoremap Q gqip
vnoremap Q gq

" Sane regexp for search
nnoremap / /\v
vnoremap / /\v

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Keep search matches in the middle of window
nnoremap n nzzzv
nnoremap N Nzzzv

" Save even if we forgot to open the file with sudo
cmap w!! %!sudo tee > /dev/null %


" ---------------------------------
" Plugins
" ---------------------------------

" Go
let go_highlight_structs = 0
let go_highlight_methods = 0

" Syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_disabled_filetypes = ['html']
let g:syntastic_java_javac_config_file_enabled = 1

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_cpp_include_dirs = ['../lib', 'lib']

let g:syntastic_mode_map = { 
    \ 'mode': 'active',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': ['html'] }

" Unite
let g:unite_source_history_yank_enable = 1
let g:unite_source_grep_command = 'ack'
let g:unite_source_rec_async_command = 'ack -f --nofilter'
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
function! s:unite_settings()
    let b:SuperTabDisabled=1
    imap <buffer> <C-j> <Plug>(unite_select_next_line)
    imap <buffer> <C-k> <Plug>(unite_select_previous_line)
    nmap <buffer> <C-c> <Plug>(unite_exit)
endfunction
 

" ---------------------------------
" Auto Commands
" ---------------------------------

augroup main
    " Resize splits when window is resized
    autocmd VimResized * exe "normal! \<c-w>="

    autocmd BufRead *.css.php set filetype=css
    autocmd BufRead *.less set filetype=css
    autocmd BufRead,BufNewFile *.scss set filetype=scss
    autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby
    autocmd BufRead *.js.php set filetype=javascript
    autocmd BufRead *.jsx set filetype=javascript
    autocmd BufRead *.md set filetype=markdown
    autocmd BufRead *.mkd set filetype=markdown
    autocmd BufRead *.markdown set filetype=markdown
    autocmd BufRead *.god set filetype=ruby
    autocmd BufRead *.as set filetype=actionscript
    autocmd BufRead *.sls set filetype=yaml
    autocmd BufRead *.yml set filetype=yaml
    autocmd BufRead,BufNewFile *.go set filetype=go

    autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType javascript setlocal nocindent omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP iskeyword-=- keywordprg=pman
    autocmd FileType c setlocal omnifunc=ccomplete#Complete
    autocmd FileType java setlocal omnifunc=javacomplete#Complete completefunc=javacomplete#CompleteParamsInfo
    autocmd Filetype gitcommit setlocal tw=68 spell
    autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2

    " Plugins
    autocmd FileType unite call s:unite_settings()
augroup END


" ---------------------------------
" OS X Stuff
" ---------------------------------

if system('uname') =~ 'Darwin'
  let $PATH = $HOME .
    \ '/usr/local/bin:/usr/local/sbin:' .
    \ '/usr/pkg/bin:' .
    \ '/opt/local/bin:/opt/local/sbin:' .
    \ $PATH
endif

if filereadable(expand($HOME . "/.vimrc.local"))
    source $HOME/.vimrc.local
endif
