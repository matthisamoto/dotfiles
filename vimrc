set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'scrooloose/syntastic'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'
Plugin 'danro/rename.vim'
Plugin 'ScrollColors'
Plugin 'chase/vim-ansible-yaml'

call vundle#end()
filetype plugin indent on

" ---------------------------------
" UI
" ---------------------------------

set encoding=utf-8
set t_Co=256
syntax on
colorscheme grb256
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
set autoindent
set preserveindent
set shiftround
set nosmartindent
set backspace=indent,eol,start
set expandtab
set tabstop=4 
set shiftwidth=4
set softtabstop=4

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
inoremap jk <esc>
nnoremap ; :

" cd to current file's directory
nnoremap <leader>cd %:p:h

nnoremap <F2> :set hlsearch!<cr>
nnoremap <F3> :set wrap!<cr>
nnoremap <F4> :set number!<cr>
nnoremap <F5> :set paste!<cr>

" sane movement
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" indentation
vnoremap < <gv
vnoremap > >gv

" select all
nnoremap vaa ggvGg_
nnoremap Vaa ggVG

" window movement
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-q> <C-w>q


" Unite settings
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_selecta'])
let g:unite_source_history_yank_enable = 1
let g:unite_winheight = 10
nnoremap <leader>f :Unite -buffer-name=files -start-insert file_rec/async<cr>
nnoremap <leader>F :UniteWithBufferDir -buffer-name=files -start-insert file<cr>
nnoremap <leader>b :Unite -buffer-name=buffers -start-insert buffer<cr>
nnoremap <leader>h :Unite -buffer-name=history history/yank<cr>
nnoremap <leader>r :Unite -buffer-name=register register<cr>
nnoremap <leader>/ :Unite -toggle grep:.<cr>
nnoremap <leader>d :Explore<CR>

autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
    let b:SuperTabDisabled=1
    imap <buffer> <C-j> <Plug>(unite_select_next_line)
    imap <buffer> <C-k> <Plug>(unite_select_previous_line)
    nmap <buffer> <C-c> <Plug>(unite_exit)
endfunction
 
nnoremap Y y$

" insert mode completion
inoremap <C-L> <C-X><C-L>
inoremap <C-F> <C-X><C-F>
inoremap <C-O> <C-X><C-O>

" formatting
nnoremap Q gqip
vnoremap Q gq

" sane regexp for search
nnoremap / /\v
vnoremap / /\v

" keep the cursor in place while joining lines
nnoremap J mzJ`z

" keep search matches in the middle of window
nnoremap n nzzzv
nnoremap N Nzzzv

" Save even if we forgot to open the file with sudo
cmap w!! %!sudo tee > /dev/null %

" ---------------------------------
" Plugins
" ---------------------------------
let go_highlight_structs = 0
let go_highlight_methods = 0

let g:fuf_file_exclude = '\v\.DS_Store|\.bak|\.swp'
let g:statline_show_encoding = 0

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

let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn)|vendor|coverage$',
    \ 'file': '\v\.(eot|woff|svg|ttf|jpg|gif|png)$' }

" ---------------------------------
" Auto Commands
" ---------------------------------

augroup main
    " Resize splits when window is resized
    autocmd VimResized * exe "normal! \<c-w>="

    " Filetype
    autocmd BufRead *.css.php set filetype=css
    autocmd BufRead *.less set filetype=css
    autocmd BufRead,BufNewFile *.scss set filetype=scss
    autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby
    autocmd BufRead *.js.php set filetype=javascript
    autocmd BufRead *.jsx set filetype=javascript
    autocmd BufRead *.md set filetype=mkd
    autocmd BufRead *.mkd set filetype=mkd
    autocmd BufRead *.markdown set filetype=mkd
    autocmd BufRead *.god set filetype=ruby
    autocmd BufRead *.as set filetype=actionscript
    autocmd BufRead *.sls set filetype=yaml
    autocmd BufRead,BufNewFile *.go set filetype=go

    " Completion
    autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType javascript setlocal nocindent omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP iskeyword-=- keywordprg=pman
    autocmd FileType c setlocal omnifunc=ccomplete#Complete
    autocmd FileType java setlocal omnifunc=javacomplete#Complete completefunc=javacomplete#CompleteParamsInfo
    autocmd Filetype gitcommit setlocal tw=68 spell
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
