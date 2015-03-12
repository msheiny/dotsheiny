
"------------------
"-- Vundle Setup
"------------------
"

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'davidhalter/jedi-vim.git'
Plugin 'msanders/snipmate.vim.git'
Plugin 'majutsushi/tagbar.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'chase/vim-ansible-yaml.git'
Plugin 'airblade/vim-gitgutter.git'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic.git'
Plugin 'saltstack/salt-vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"------------------
"-- TEXT OPTIONS
"------------------
"

" Relative numbering and number for 704
if v:version >= 704
    set relativenumber 
    set number
elseif v:version == 703
    set relativenumber 
else
    set number
endif

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
"  Airline plugin
"-----------------
let g:airline_powerline_fonts = 1
