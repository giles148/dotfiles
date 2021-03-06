"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable filetype plugins
filetype plugin on
filetype indent on

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast closing
nmap <leader>q :q!<cr>

" Better command-line completion
set wildmenu

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" Line numbers
set number

" Mouse
set mouse=a
set ttymouse=xterm2

" Visual block mode
set virtualedit+=block

" Spelling
set spelllang=en_us

" Title
set title

" Switch - https://github.com/AndrewRadev/switch.vim
nnoremap - :Switch<cr>

" Sideways
nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>

" Up/Down
nnoremap <c-k> <c-c>ddkkp
nnoremap <c-k> <c-c>ddp
vnoremap <c-k> dkkp
vnoremap <c-k> dp

" More fun with return...
nnoremap <Return> o<Esc>
nnoremap <s-Return> O<Esc>

" Visual search/replace
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" scroll 8 lines befores the edge
set scrolloff=8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Pathogen
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CSS splitting/joining
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Split one-line declarations
nmap " <Esc>:s/\([{;]\)[ ^I]*\(}*\)/\1\r\2  /g<CR> 
" Join multi-line declarations
vmap " :s/\([;{]\)\n[ ^I]*/\1 /g<CR> 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PDV -- phpDoc for Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.vim/plugin/php-doc.vim 
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-P> :call PhpDocSingle()<CR> 
vnoremap <C-P> :call PhpDocRange()<CR> 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" ...unless I'm editing CSS or ruby
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

colorscheme miso
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" PHP
let php_sql_query          = 1
let PHP_removeCRwhenUnix   = 1
let php_show_semicolon     = 0

let g:debuggerPort = 9999

" Javascript
let javaScript_alternateSwitch = 1

" JSON
au BufNewFile,BufRead *.json setf javascript
au BufNewFile,BufRead *.json set filetype=javascript

" LessCSS
au BufNewFile,BufRead *.less set filetype=less

" HTML Syntax Conversion Options
let html_use_css	= 1
let html_no_hyperlinks	= 1
let use_xhtml		= 1
let html_ignore_folding	= 1
au BufNewFile,BufRead *.mustache set filetype=html
if exists('html_no_pre')
	unlet html_no_pre
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
