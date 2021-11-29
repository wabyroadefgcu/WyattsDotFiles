set nocompatible

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

set backup

" Set location of .vim folder so it resides inside WyattsDotFiles repository
set runtimepath=~/.config/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.config/.vim/after
set packpath=~/.config/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.config/.vim/after


" Set location of backup and undo files, the .vimfiles folder may need
" to be created before this works. Not using .vim so I don't accidentally
" push all of my temp files to repository
set backupdir=$HOME/.vimfiles/tmp
set dir=$HOME/.vimfiles/tmp
set undodir=$HOME/.vimfiles/tmp

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab


" =============== Other Settings ====================

set history=500
set ruler
set showcmd
set incsearch
set number
set ignorecase
set smartcase
set visualbell

colo slate

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
set clipboard=unnamed



" ================ Status Bar and Airline ===========
"set laststatus=2
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"filetype off                  " required
let g:airline_powerline_fonts = 1



filetype plugin on
filetype indent on


set wrap       "Wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Completion =======================

set wildmode=list:longest
"set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif




" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" packadd matchit

" Hack to fix arrow keys while typing into find after /
" imap OA <ESC>ki
" imap OB <ESC>ji
" imap OC <ESC>li
" imap OD <ESC>hi
" set t_ku=OA
" set t_kd=OB
" set t_kl=OD
" set t_kr=OC
