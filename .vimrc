"Space and Tabs
set nocompatible " Back compatability.
set backspace=2

set autoindent " Copies indentation from previous line.
set smartindent " Adds a level of indentation in some situations. Mostly c-like files.

set tabstop=2 " Size of a tab in terms of spaces.
set shiftwidth=2 " Spaces when using >> or <<.
set expandtab " Expand tabs to equivalent spaces.


" Misc
set ruler " Side ruler.

set number " Line numbering.

set showmatch " Match braces

set visualbell " Visual bell.

set showmode " Display edit mode.

set nolist " Highligh Indent Guides.

set autoread " Reaload modified files. This does not seem to work for some people. Use :e to manually reload. It does not technically reload but does re-edit the file when changes are made outside of vim.

set nocursorline " Highlight current line.

set encoding=utf-8

" Syntax Colouring
syntax enable


" Highlight Trailing Whitespace
set list listchars=trail:.,tab:>.
highlight SpecialKey ctermfg=DarkGray ctermbg=Black


" Word Processing
set wrap " Softwrap

set linebreak

set textwidth=0

set modeline

set ls=2

" Owning the statusline.
set statusline+=%F%R\                               " Filename
set statusline+=[%H%M%R%W,\                         " Flags
set statusline+=%y,\                                " Filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc},\       " Ecoding
set statusline+=%{&fileformat}]                     " file format
set statusline+=%=                                  " left/right separator
set statusline+=%c:%l/%L                            " LineNum/TotLine:ColumnCur
set statusline+=\ %P                                " Percent through file

" Autosave
autocmd InsertLeave * silent! wall

" ctags tag list. Search until the root directory
set tags=tags;/

"call pathogen#infect()i

" Move this to ftplugin when you feel the need.
" InsertLeave works but its a bit slow
autocmd BufRead,BufNewFile,InsertLeave makefile setlocal noexpandtab nolist
autocmd BufWritePost makefile setlocal list
