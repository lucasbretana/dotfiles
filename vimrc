" enter in the current millenium
set nocompatible

" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Vundle, plugin manager
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/vim/vundle-pluging')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" using vim natural plugins (and maybe more)
filetype plugin on

" colors are on this season
syntax on

" fuzzy finder: use to find fils on vim
set path+=**
" NOW WE CAN
" - Hit the <tab>  to :find by partial match
" - Use regex to make it fuzzy

" THINGS TO CONSIDER
" - :b lets you autocomplete any open 

" tags: creates a tags file to find references
" tags dependes on: ctags
command! MakeTags !ctags -R .
" NOW WE CAN USE
" - use  ^] to jump to tag under cursor
" - use g^] for ambiguos tags
" - use  ^i to jump in, entering one on tag stack
" - use  ^o to jump out, backing one on tag stack
" - use  ^t to jump out, but also pop out something from the tag stack

" autocomplete: used to autocomplete based on several information, such as
" tags file, the current file, some know stuff about a certain language, ...
" NOW WE CAN
" - ^n to suggest completation based pn any know stuff
" - ^x^n to suggest from only the current file
" - ^x^] to suggest from tags file
" - ^x^f for paths names (works great with the path trick)
"
" THINGS TO CONSIDER
" - use ^n and ^p to go back and forward on suggestions
" - no need to do any extra command
" - vim already know how to read tags and know some stuff about languages

" THINGS TO CONSIDER
" - you can use zt to move the current line to the top with scrolloff lines
"   from the top

" file browsing: a small and simple (in my use) file browser inside vim
let g:netrw_banner        = 0   " disable annoying banner
let g:netrw_browser_split = 4   " open in prior window
let g:netrw_altv          = 1   " open split to the right
let g:netrw_winsize       = 99  " control initial window size
let g:netrw_liststyle     = 3   " tree view
let g:netrw_list_hide     = netrw_gitignore#Hide()
let g:netrw_list_hide    .= ',\(^\|\s\s\)\zs\.\S\='

" tabs usefull remaps
" DEFAULT: use gt, gT, #gt
"noremap <C-a>      :tabfirst<CR>
"noremap <C-h>      :tabprevious<CR>
"noremap <C-l>      :tabnext<CR>
"noremap <C-j>      :tabmove -1<CR>
"noremap <C-k>      :tabmove +1<CR>
"noremap <C-w>      :tabclose <CR>
"noremap <C-q>      :qall <CR>
"noremap <C-e>      :tabonly <CR>
"noremap <C-n>      :tabnew <CR>

" NOW WE CAN
" - :edit a folder to a file file browser
" - <CR>/v/t to open in an h-split/h-split/tab
" - check | netrw-browse-maps| for more examples
"
" THINGS TO CONSIDER
" - while using tab and window
"   - :tabedit <file> edits a file in a new tab
"   - :tabfirst
"   - :tabnext or <C-Left> and <C-Right>
"   - :tabclose and :tabonly

" snippets: combine command
nnoremap ,html        :-1read $TEMPLATES/Programming/index.html<CR>4jwf>
nnoremap ,php         :-1read $TEMPLATES/Programming/index.php<CR>j$
nnoremap ,mainC       :-1read $TEMPLATES/Programming/main.c<CR>10j$
nnoremap ,mainCC      :-1read $TEMPLATES/Programming/main.cc<CR>10j$
nnoremap ,classCC     :-1read $TEMPLATES/Programming/Test.cc<CR>2j$
nnoremap ,mainJava    :-1read $TEMPLATES/Programming/Main.java<CR>7j$
nnoremap ,classJava   :-1read $TEMPLATES/Programming/Test.java<CR>3j$
nnoremap ,shell       :-1read $TEMPLATES/Programming/shell.sh<CR>3j:s/-setdate-/\=strftime("%c")<CR>3j$
nnoremap ,css         :-1read $TEMPLATES/Programming/style.css<CR>
nnoremap ,js          :-1read $TEMPLATES/Programming/utils.js<CR>6j
" NOW WE CAN CONQUER THE WORLD!
" - with much less keyword
" 
" THINGS TO CONSIDER
" - the interface of the snippets is the cooler stuff
" - the nnoremap start with an n so this commnad is to be used on normal mode
" - the comma (,) is to enter command mode and execute whatever comes after
"   after :
" - the -1 is to back a line before prints the read content (so there is no
"   extra line)
" - the <CR> is to enter the command descibre above, and when in command mode
"   it executes a command it goes back to normal mode, now every thing that
"   works on normal mode works
" - 3j is to jump 3 lines


" menu to tab complete (and maybe more)
set wildmenu

set autoindent

set list
set number
set relativenumber
set numberwidth=1

set ignorecase
set smartcase

" set tabstop=2
set shiftwidth=2
set softtabstop=2
"set expandtab
set noexpandtab

set scrolloff=5
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd

" status line
set laststatus=2
"set statusline=%-5.20f:%-2.4L,%-2.4c[%-2.4p%%]w:%3.10m%-3.4r
set statusline=%-5.20f:%-2.4L,%-2.4c[%-2.4p%%]

" New characters for the list option
set showbreak=↪\ 
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨

" Color
" Is is all about using less lines, amirite?
execute 'colorscheme ' . (strftime('%H') < 20 ? 'desert' : 'ron')
"set background=dark
"if strftime("%H") < 13
"  colorscheme desert
"else
"  colorscheme desert
"endif

" Wrap
set linebreak
set columns=150
