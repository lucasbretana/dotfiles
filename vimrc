" ==============================================================================
" -- MAIN CONFIGS DEPENDENCIES -------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" ==============================================================================
" -- VUNDLE PLUGIN ----------------------------------------
" add Vundle to runtime
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'wakatime/vim-wakatime'        " Waka Time integration
Plugin 'preservim/nerdtree'           " file tree explorer
Plugin 'Xuyuanp/nerdtree-git-plugin'  " a nice complementary plugin for NERDTree
Plugin 'jacoborus/tender.vim'         " tender theme
"
"git plugins
Plugin 'tpope/vim-fugitive'           " integration with git
Plugin 'tpope/vim-unimpaired'         " tpope has the best shortcuts
Plugin 'airblade/vim-gitgutter'       " git indication on modified lines

" Vundle manages Vundle, mandatory
Plugin 'VundleVim/Vundle.vim'
" Vundle brief
" :PluginList              - lists configured plugins
" :PluginInstall           - installs plugins;       `!` updates them
" :PluginSearch <foo>      - searches for foo;       `!` refreshes local cache
" :PluginClean             - removes unused plugins; `!` to auto-approve removal
" :h vundle                - for more details or wiki for FAQ

call vundle#end()                " end of Vundle, required
"
" ==============================================================================
" -- MAIN CONFIGS --------------------------------------------------------------
set updatetime=100               " quickly update

" ==============================================================================
" -- NAVIGATION N' AUTOCOMPLETE ------------------------------------------------
set path+=**                    " fuzzy finder, regex and tab completion
" NOTE: :b lets you autocomplete any open buffer

" vim can navigate through files with that
command! MakeTags !ctags -R .
" NOTE: use  ^] to jump to tag under cursor
" NOTE: use g^] for ambiguous tags
" NOTE: use  ^i, ^o, ^t to jump in, out, pop out tags on the stack

set wildmenu                    " menu to tab complete
" AUTOCOMPLETE: use tags, names, etc. in file and about the language..
" NOTE: ^n to suggest completion based on any know stuff
" NOTE: ^x^n to suggest from only the current file
" NOTE: ^x^] to suggest from tags file
" NOTE: ^x^f for paths names (works great with the path trick)
" NOTE: use ^n and ^p to go back and forward on suggestions

" modification hunk navigation (Git Gutter)
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)


" NERDTree shortcut
map <C-n> :NERDTreeToggle<CR>

" ==============================================================================
" -- SNIPPETS AND TEMPLATES -----------------------------------------------------
" SNIPPETS: combine command from $TEMPLATES folder
nnoremap ,html        :-1read $TEMPLATES/Programming/index.html<CR>4jwf>
nnoremap ,php         :-1read $TEMPLATES/Programming/index.php<CR>j$
nnoremap ,mainC       :-1read $TEMPLATES/Programming/main.c<CR>10j$
nnoremap ,mainCC      :-1read $TEMPLATES/Programming/main.cc<CR>10j$
nnoremap ,classCC     :-1read $TEMPLATES/Programming/Test.cc<CR>2j$
nnoremap ,mainJava    :-1read $TEMPLATES/Programming/Main.java<CR>7j$
nnoremap ,classJava   :-1read $TEMPLATES/Programming/Test.java<CR>3j$
nnoremap ,shell       :-1read $TEMPLATES/Programming/shell.sh<CR>3j:s/-setdate-/\=strftime("%c")<CR>3j$
nnoremap ,css         :-1read $TEMPLATES/Programming/style.css<CR>

" ==============================================================================
" -- DEF PLUGINS N' VISUALIZATION -----------------------------------------------
filetype indent plugin on       " lots of cool stuff by file specific type

" ==============================================================================
" -- INTERFACE -----------------------------------------------------------------
" NERDTree open by default, with cursor on other buffer
"autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | wincmd p | endif

" exit vim on NERDTree only buffer left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set termguicolors                " color
" nice theme
execute 'colorscheme tender'
syntax on                        " colors are on this season
set scrolloff=3                  " scrollbar offset

set list                         " show invisible characters (space, enter..)
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨

set number                       " line number
set relativenumber               " more cool line number
set numberwidth=5                " line number width, Vim defaults is 4

set ignorecase                   " ignore case in search..
set smartcase                    " ..except if use UPPER

set laststatus=2                 " always display status line
set showmode                     " display mode on status line
set showcmd                      " display commands on status line
set statusline=
set statusline+=%{FugitiveStatusline()}
set statusline+=%5.20f:%-2.4L,%-2.4c[%-2.4p%%]

set autoindent                   " copy indent from other lines

" ==============================================================================
" -- EDITING DEFAULTS ----------------------------------------------------------
"set textwidth 0                  " no line breaking with line breaking
set wrap                         " line wrapping (doesn't change the buffer)
set linebreak                    " breaks between words
set breakindent                  " indent wrapped lines

" tab/space war solved
set shiftwidth=2                 " use 2 spaces on <<, >>, ==
set expandtab                    " replace tab for spaces
set softtabstop=2                " use 2 spaces instead of tab on insert

" ==============================================================================
" -- CLOSING VI ----------------------------------------------------------------
" clear trailing white spaces on file save
autocmd BufWritePre * :%s/\s\+$//e

" save with privileges using w!!
cabbr w!! w !sudo tee > /dev/null %

" =========================================================
" -- SYSTEM DEPENDENCIES ----------------------------------
" ctags : used by :MakeTags command
