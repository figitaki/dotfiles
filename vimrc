".vimrc
" Author: Carey Janecka

" Enable true colors in terminal
if (empty($TMUX))
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Load pathogen.vim and all plugins
call pathogen#infect()
call pathogen#helptags()

syntax on
colorscheme onedark       " cool colorscheme

" Disable the background color
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight CursorLine ctermbg=none

set encoding=utf-8

let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2

set nocompatible
set hidden

let mapleader=','       " leader is comma

set expandtab             " convert tabs to spaces
set shiftwidth=2          " set number for autoindent
set softtabstop=2         " number of spaces in tab when editing

set autoindent            " enable autoindent
filetype plugin indent on " enable filetype detection

set mouse=a

set list
set listchars=eol:¬,tab:»-,space:·

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Shortcut to launch Vimux prompt
map <leader>vp :VimuxPromptCommand<CR>
map <leader>vl :VimuxRunLastCommand<CR>

set number              " enable line numbers
set cursorline          " highlights current row
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to
set showmatch           " highlight matching []/{}/()

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" turn off search highlighting
nnoremap <leader><space> :nohlsearch<CR>

set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max

" space opens/closes folds
nnoremap <space> za

set foldmethod=indent   " fold off of current indent

set backspace=2         " make backspace work like most other apps

let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1

" easier split navigations
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" easier buffer navigations
noremap <leader>] :bn<CR>
noremap <leader>[ :bp<CR>
noremap <leader>x :bd<CR>

" move vertically by visual line
noremap j gj
noremap k gk

map <C-\> :NERDTreeToggle<CR>

" move to beginning/end of a line
nnoremap B ^
nnoremap E $

" ^/$ doesn't do anything
nnoremap ^ <nop>
nnoremap $ <nop>

" highlight last inserted text
nnoremap gV `[v`]

" map ,w to overwrite readonly hack
nnoremap <leader>w :w !sudo tee %<CR>

" vv to generate new vertical split
nnoremap <silent> vv <C-w>v

" configure fzf for vim
set rtp+=/usr/local/opt/fzf
