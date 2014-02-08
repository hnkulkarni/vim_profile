execute pathogen#infect()
call pathogen#infect()
call pathogen#helptags()



" Enabe line numbers by default
set number
" Toggle line numbers
nnoremap <F2> :set nonumber!<CR>

set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

filetype plugin on
filetype indent on

set laststatus=2

" Set lines to scroll with ^-U and ^-D
set scroll=5

" Toggle paste mode for code that's already indented
nnoremap <F9> :set invpaste paste?<CR>
set pastetoggle=<F9>
set showmode

highlight LineNr term=NONE

highlight Comment  term=italic cterm=italic ctermfg=10 gui=italic guifg=#303030


if has('gui_running')
    let g:solarized_termcolors=256
    set background=dark
    colorscheme solarized
else
    syntax on
    set t_Co=16
    set background=dark
    let g:solarized_termtrans=1
    colorscheme solarized
endif


" Turn off highlighting of searched term by default
set hlsearch!
" Map <F3> to toggle highlighting of searched term
nnoremap <F3> :set hlsearch!<CR>


"_ Toggle Syntax:  http://tech.groups.yahoo.com/group/vim/message/38714
nnoremap <F4> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>


" Run Python scripts from within the editor
map <C-K> :!clear; python %<CR>


" http://stackoverflow.com/a/13940805
" Show the stack of syntax highlighting classes affecting whatever is under the cursor.
 function! SynStack()
     echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), " > ")
endfunc
nnoremap <F8> :call SynStack()<CR>


" Python-mode
set nofoldenable
" Activate rope
" Keys:
" K             Show python docs
"   Rope autocomplete
" g     Rope goto definition
" d     Rope show documentation
" f     Rope find occurrences
" b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin

let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = 'b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0


" http://stackoverflow.com/a/3107159
" If you prefer the Omni-Completion tip window to close when a selection is
" " made, these lines close it on movement in insert mode or when leaving
" " insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


autocmd FileType python set omnifunc=pythoncomplete#Complete



"  Fn keys used thus far: F2, F3, F4, F8, F9



