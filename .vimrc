scriptencoding utf-8

set nocompatible

" never use arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

syntax on

set background=dark " light
" colorscheme solarized

" General options
set exrc secure             " Enable per-directory .vimrc files and disable unsafe commands in them

" Buffer options
set hidden                  " hide buffers when they are abandoned
set autoread                " auto reload changed files

" Display options
" set title                   " show file name in window title
set novisualbell            " mute error bell

set ttyfast                 " Optimize for fast terminal connections
set shortmess=atI           " Don’t show the intro message when starting Vim
set nostartofline

" Tab options
set autoindent              " copy indent from previous line
set smartindent             " enable nice indent
set expandtab               " tab with spaces
set smarttab                " indent using shiftwidth"
set shiftwidth=2            " number of spaces to use for each step of indent
set tabstop=2
set softtabstop=2           " tab like 4 spaces
set shiftround              " drop unused spaces

" Search options
set gdefault                " Add the g flag to search/replace by default
set hlsearch                " Highlight search results
set ignorecase              " Ignore case in search patterns
set smartcase               " Override the 'ignorecase' option if the search pattern contains upper case characters
set incsearch               " While typing a search command, show where the pattern
nnoremap <silent> <cr> :nohlsearch<cr><cr>

" Matching characters
set showmatch               " Show matching brackets
set matchpairs+=<:>         " Make < and > match as well

set encoding=utf-8           " Default encoding
set fileencodings=utf-8,cp1251,koi8-r,cp866
set termencoding=utf-8
set fileformat=unix

" Edit
set backspace=indent,eol,start " Allow backspace to remove indents, newlines and old tex"

set nobackup
set nowritebackup
set noswapfile
set noeol

" show linebreak symbol
if has("linebreak")
    let &sbr = nr2char(8618).' '
endif

    " \s
        " Shortcut for :%s///
        nnoremap <leader>s :<C-u>%s///<left><left>
        vnoremap <leader>s :s///<left><left>

    " Save file with root permissions
    " :w!! saves the file as if you opened it with sudo
        command! W exec 'w !sudo tee % > /dev/null' | e!
    " Bind :Q to :q
        command! Q q

    " ,c
        " camelCase => camel_case
        vnoremap <silent> <Leader>c :s/\v\C(([a-z]+)([A-Z]))/\2_\l\3/g<CR>

    " ,ts
        " Fix trailing white space
        nnoremap <leader>ts :<C-u>%s/\s\+$//e<CR>

    " ,u
        " Change case to uppercase (without visual selection)
        nnoremap <Leader>u gUiw
        inoremap <Leader>u <esc>gUiwea

    " Ctrl+s
        noremap <C-s> <esc>:w<CR>
        inoremap <C-s> <esc>:w<CR>

    " tip: use Ctrl-C instead of ESC


imap jjj <Esc> " easy go normal mode from editing mode

" shared with system clipboard
set clipboard=unnamed

" PACKAGES {{{ ===============================================================

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'

Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-repeat'

" cs"' - change surround " to '
" ds'  - delete surround '
" cst' - change surround <tag> to '
" ysiw] (iw is a text object) - insert surround text-object(inner word) ]
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
  let g:gitgutter_realtime = 0
  let g:gitgutter_eager = 0
  set shell=/bin/zsh
  nmap ]h <Plug>GitGutterNextHunk
  nmap [h <Plug>GitGutterPrevHunk
  nmap <Leader><Leader>s <Plug>GitGutterStageHunk
  nmap ]r <Plug>GitGutterRevertHunk
  let g:gitgutter_override_sign_column_highlight = 1
Plug 'ConradIrwin/vim-bracketed-paste'
" cxiW, .
" cxx, . - for lines
Plug 'tommcdo/vim-exchange'
" vim path:line
Plug 'dsiroky/file-line'
Plug 'easymotion/vim-easymotion'
  nmap <Leader>j <Plug>(easymotion-s)

" Conflict markers (<<<<<<<, ======= and >>>>>>> as default) are highlighted automatically
" ct for themselves, co for ourselves, cn for none and cb for both
" Jump among Conflict Markers: [x and ]x
Plug 'rhysd/conflict-marker.vim'

" daf/dif - del a/in fun
Plug 'kana/vim-textobj-user'
Plug 'zhaocai/vim-textobj-function'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'


" }}}


" Initialize plugin system
call plug#end()
