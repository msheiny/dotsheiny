"------------------
"-- TEXT OPTIONS
"------------------
"

"  Make 81 column highlighted
highlight ColorColumn ctermbg=magenta
set colorcolumn=81
set tw=80

" tab (character) is 4 spaces
set tabstop=4
 
" tab (key) is 4 spaces
set softtabstop=4
 
" indent width is 4 spaces
set shiftwidth=4
 
" allow backspacing over indentation, end-of-line, and
" start-of-line; see 'help bs'.
set backspace=indent,eol,start
 
set encoding=utf-8
 
" enables automatic C program indenting
set autoindent
set smartindent
"set copyindent

" expands tab to spaces
set expandtab

 
" dont act as vi
set nocompatible
 
" turn off the beep!
set noerrorbells
 
" search as we type
set incsearch
 
" ignore case if only lowercase chars used, otherwise
" use case, use \C to get Case Sensitive
set ignorecase
set smartcase
 
" update the title of the window...
set title
 
" alot of undolevels
set undolevels=500
 
" skip suffixes for filename completation
set suffixes+=.class,.hi,.o,.so,.a,.pyc,.la
set suffixes-=.h
 
set history=1000
 
" sharing windows clipboard
set clipboard+=unnamed
 
" improves performance -- let OS decide when to flush disk
set nofsync
 
" write buffer when leaving
set autowrite
 
" autoread when a file is changed from the outside
set autoread

" turn off swap
set noswapfile
set nobackup

"code folding
set foldmethod=indent
set foldlevel=99

"spell checking
set spell spelllang=en
map <f5> :setlocal spell! spelllang=en_us<CR>

"------------------
"-- VISUAL OPTIONS
"------------------
 
" always display the statusline
set laststatus=2
 
" when no beep or flash is wanted
set visualbell t_vb=
 
" time to show the matching bracket
set matchtime=2
 
" print the line number in front of each line?
set number
nnoremap <F2> :set nonumber!<CR>
 
" number of lines for the command area; more eliminates
" many 'hit-enter'
set cmdheight=2
 
" set how tabs, eols look when you use :set list
set lcs=tab:>-,eol:$,nbsp:%,trail:X,extends:>,precedes:<
 
" some feedback on position
set ruler
" highlight all its matches.
set hlsearch
" set toggle paste 
set pastetoggle=<leader>p

"------------------
"-- Random 
"------------------
filetype plugin indent on


"-----------------
"  NERD plugin
"-----------------
:nmap \e :NERDTreeToggle<CR>


"-----------------
"  Tagbar  plugin
"-----------------
nmap <F8> :TagbarToggle<CR>


"-----------------
"  Markdown plugin
"-----------------
let g:vim_markdown_folding_disabled=1

"-----------------
"  Pathogen - enables dropping plugins in ~/.vim/bundle for easy enabling
"-----------------
execute pathogen#infect()

