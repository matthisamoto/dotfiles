highlight clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name="buddin"

highlight Char           cterm=None           ctermbg=None      ctermfg=None
highlight ColorColumn                         ctermbg=255
highlight Comment        cterm=None           ctermbg=None      ctermfg=245
highlight Constant       cterm=None           ctermbg=None      ctermfg=None
highlight DiffAdd        cterm=Bold           ctermbg=None      ctermfg=None
highlight DiffChange     cterm=Bold           ctermbg=None      ctermfg=None
highlight DiffDelete     cterm=Bold           ctermbg=None      ctermfg=None
highlight DiffText       cterm=Reverse        ctermbg=None      ctermfg=None
highlight Directory      cterm=Bold           ctermbg=None      ctermfg=None
highlight Error          cterm=Reverse        ctermbg=None      ctermfg=Red
highlight ErrorMsg       cterm=Standout       ctermbg=None      ctermfg=Red
highlight ExtraWhitespace                     ctermbg=Red
highlight FoldColumn     cterm=Standout       ctermbg=None      ctermfg=None
highlight Folded         cterm=Standout       ctermbg=None      ctermfg=None
highlight Func           cterm=None           ctermbg=None      ctermfg=None
highlight Identifier     cterm=None           ctermbg=None      ctermfg=None
highlight Ignore         cterm=Bold           ctermbg=None      ctermfg=None
highlight IncSearch      cterm=Reverse        ctermbg=None      ctermfg=None
highlight LineNr         cterm=None           ctermbg=None      ctermfg=235
highlight MatchParen     cterm=Bold           ctermbg=250       ctermfg=None
highlight ModeMsg        cterm=Bold           ctermbg=None      ctermfg=None
highlight MoreMsg        cterm=Bold           ctermbg=None      ctermfg=None
highlight NonText        cterm=Bold           ctermbg=None      ctermfg=None
highlight Normal         cterm=None           ctermbg=White     ctermfg=235
highlight Number         cterm=None           ctermbg=None      ctermfg=None
highlight PreProc        cterm=None           ctermbg=None      ctermfg=None
highlight Question       cterm=Standout       ctermbg=None      ctermfg=None
highlight Search         cterm=None           ctermbg=250       ctermfg=None
highlight Special        cterm=Bold           ctermbg=None      ctermfg=None
highlight SpecialKey     cterm=Bold           ctermbg=None      ctermfg=None
highlight Statement      cterm=Bold           ctermbg=None      ctermfg=None
highlight StatusLine     cterm=None           ctermbg=250       ctermfg=None
highlight StatusLineNC   cterm=None           ctermbg=250       ctermfg=None
highlight String         cterm=Underline      ctermbg=None      ctermfg=None
highlight Title          cterm=Bold           ctermbg=None      ctermfg=None
highlight Todo           cterm=None           ctermbg=None      ctermfg=None
highlight Type           cterm=None           ctermbg=None      ctermfg=None
highlight Underlined     cterm=Underline      ctermbg=None      ctermfg=None
highlight VertSplit      cterm=None           ctermbg=None      ctermfg=None
highlight Visual         cterm=Reverse        ctermbg=None      ctermfg=None
highlight VisualNOS      cterm=Bold,Underline ctermbg=None      ctermfg=None
highlight WarningMsg     cterm=Standout       ctermbg=None      ctermfg=None
highlight WildMenu       cterm=Standout       ctermbg=None      ctermfg=None

highlight javaExternal   cterm=Bold           ctermbg=None      ctermfg=None
highlight javaScopeDecl  cterm=Bold           ctermbg=None      ctermfg=None
highlight javaClassDecl  cterm=Bold           ctermbg=None      ctermfg=None
highlight javaFuncDecl   cterm=Bold           ctermbg=None      ctermfg=None

" trailing whitespace
match ExtraWhitespace /\s\+$/

" trailing whitespace before a tab
match ExtraWhitespace /\s\+$\| \+\ze\t/
