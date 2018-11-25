set term=xterm-256color
set t_Co=256

" Le infect.
execute pathogen#infect()

let mapleader = ","
nnoremap <leader>f :NERDTreeToggle<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>e :wq<CR>

"Space and Tabs
set nocompatible " Back compatability.
set backspace=2

set autoindent " Copies indentation from previous line.
set nosmartindent " Does not add a level of indentation in some situations. Mostly c-like files.

set tabstop=4 " Size of a tab in terms of spaces.
set shiftwidth=4 " Spaces when using >> or <<.
set expandtab " Expand tabs to equivalent spaces.

" Misc
set ruler " Side ruler.
set number " Line numbering.
set relativenumber
set showmatch " Match braces
set visualbell " Visual bell.  set showmode " Display edit mode.
set nolist " Highligh Indent Guides.
set autoread " Reaload modified files. This does not seem to work for some people.
             " Use :e to manually reload. It does not technically reload but does re-edit
             " the file when changes are made outside of vim.
set nocursorline " Highlight current line.
set encoding=utf-8
set scrolloff=15 " Give context when moving to a line.

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

set textwidth=80
set fo+=t

set modeline
set ls=2
set statusline+=%F%R\                               " Filename
set statusline+=[%H%M%R%W,\                         " Flags
set statusline+=%y,\                                " Filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc},\       " Ecoding
set statusline+=%{&fileformat}]\                    " file format
set statusline+=%=                                  " left/right separator
set statusline+=%l/%L\ :\ %c                        " ColumnCur:LineNum/TotLine
set statusline+=\ %P                                " Percent through file

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
nnoremap <space> :noh <return><esc>
set incsearch
cnoremap <c-n> <CR>n/<c-p>

" Clipboard
"nmap <c-c> "+y

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nmap <leader>p <c-p>

set foldmethod=syntax
set foldlevel=1
let g:markdown_folding = 1

" Remember old position on open
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
