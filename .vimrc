set term=xterm-256color
set t_Co=256

" Le infect.
execute pathogen#infect()

"Space and Tabs
set nocompatible " Back compatability.
set backspace=2

set autoindent " Copies indentation from previous line.
set nosmartindent " Does not add a level of indentation in some situations. Mostly c-like files.

set tabstop=4 " Size of a tab in terms of spaces.
set shiftwidth=2 " Spaces when using >> or <<.
set expandtab " Expand tabs to equivalent spaces.

" Misc
set ruler " Side ruler.
set number " Line numbering.
set relativenumber
set showmatch " Match braces
set visualbell " Visual bell.
set showmode " Display edit mode.
set nolist " Highligh Indent Guides.
set autoread " Reaload modified files. This does not seem to work for some people.
             " Use :e to manually reload. It does not technically reload but does re-edit
             " the file when changes are made outside of vim.
set nocursorline " Highlight current line.
set encoding=utf-8
set scrolloff=15 " Give context when moving to a line.
set mouse=a

" Syntax Colouring
let g:solarized_termcolors=256
syntax enable
filetype plugin indent on
colorscheme solarized
set background=dark

" Highlight Trailing Whitespace
"set list listchars=trail:.,tab:>.
"set list listchars=trail:.
highlight SpecialKey ctermfg=DarkGray ctermbg=Black

" Word Processing
set wrap " Softwrap
set linebreak
set textwidth=0
set modeline
set ls=2
set statusline+=%F%R\                               " Filename
set statusline+=[%H%M%R%W,\                         " Flags
set statusline+=%y,\                                " Filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc},\       " Ecoding
set statusline+=%{&fileformat}]\                  " file format
"set statusline+=%{GitBranch()}                     " Show git branch
set statusline+=%=                                  " left/right separator
set statusline+=%l/%L\ :\ %c                            " ColumnCur:LineNum/TotLine
set statusline+=\ %P                                " Percent through file

" Autosave TODO Fix this.
"autocmd InsertLeave * silent! wall

" ctags tag list. Search until the home directory
set tags=./tags,tags;$HOME

" Move this to ftplugin when you feel the need.
" InsertLeave works but its a bit slow
"autocmd BufRead,BufNewFile,InsertLeave makefile setlocal noexpandtab nolist
"autocmd BufWritePost makefile setlocal list

" TODO Fix this. Show git branch on status line.
"autocmd BufEnter makefile setlocal statusline=%{GitBranch()}

" Nifty wordprocessing,
map j gj
map k gk

" Search
set hlsearch
nnoremap <space> :noh <return><esc>
set incsearch

" Clipboard
"vmap <C-C> "+y
