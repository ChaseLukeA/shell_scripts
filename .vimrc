
" my vimrc file.
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Use xterm for coloring
"set term=builtin_beos-ansi

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" -----------------------------------------------------------------------------
" Commands Added by ChaseLukeA
" -----------------------------------------------------------------------------

" Sets number lines on the left of screen
set number

" Sets search to highlight
set hls is

" Sets backup directory
set backupdir=$HOME/tmp/backup//
set directory=$HOME/tmp/backup//

" sets tab
set tabstop=2
set expandtab
set shiftwidth=2
set shiftround

" sets search options
set incsearch
set ignorecase

" sets map key to ,
let mapleader = ","

" reload VIMRC config file
map <leader>r :source $MYVIMRC<CR>

" tab new command
map <leader>e :tabe 

" tab next/previous command
map <leader>d :tabp<CR>
map <leader>f :tabn<CR>

" map jj in INSERT mode to write file to disk
imap jj <ESC>:w<CR>

" map kk in INSERT mode to escape from insert mode
imap kk <ESC>

" sets colorscheme for vim 
"colorscheme darkblue

" sets colored column at line 80 for programming
set colorcolumn=80

" underlines current line
set cursorline
highlight CursorLine cterm=bold
highlight CursorLine ctermbg=233

" highlights the current column
set cursorcolumn
highlight CursorColumn ctermbg=233

" changes vim to hex mode
map <leader>h :call HexMe()<CR>

let $in_hex=0
function HexMe()
  set binary
  set noeol
  if $in_hex>0
    :%!xxd -r
    let $in_hex=0
  else
    :%!xxd
    let $in_hex=1
  endif
endfunction

" sets 'g' to launch current file
if has('win32') || has ('win64')
  let $CLEAR_COMMAND="cls"
else
  let $CLEAR_COMMAND="clear"
endif
 
autocmd FileType ruby nmap <Leader>g :!"$CLEAR_COMMAND"; ruby "%"<cr>
autocmd FileType go  nmap <Leader>g :!"$CLEAR_COMMAND"; go run "%"<cr>
autocmd filetype java nmap <Leader>g :!"$CLEAR_COMMAND"; javac "%" && java "%:r"<cr>
 
if has('win32') || has ('win64')
  autocmd FileType html  nmap <Leader>g :silent ! start firefox "%"<cr>
elseif has('mac')
  autocmd FileType html  nmap <Leader>g :!open "%"<cr><cr>
endif
 
autocmd FileType js  nmap <Leader>g :!"$CLEAR_COMMAND"; node "%"<cr>
autocmd FileType coffee  nmap <Leader>g :!"$CLEAR_COMMAND"; coffee "%"<cr>
autocmd FileType markdown  nmap <Leader>g :!mark "%"<cr>
autocmd FileType groovy  nmap <Leader>g :!"$CLEAR_COMMAND"; groovy "%"<cr>
autocmd FileType sh  nmap <Leader>g :!"$CLEAR_COMMAND"; sh "%"<cr>
autocmd FileType python  nmap <Leader>g :!"$CLEAR_COMMAND"; python "%"<cr>
autocmd FileType elixir  nmap <Leader>g :!"$CLEAR_COMMAND"; elixir "%"<cr>

" set vertical/horizontal splits
nmap <Leader>1 :vs<cr>
nmap <Leader>2 :sp<cr>

" set 's' to next split
nmap <Leader>s <C-W><C-W>

" set color scheme
color darkblue
