".vimrc
" Author: Carey Janecka

" Enable true colors in terminal
if (empty($TMUX))
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Configure Vundle
call plug#begin('~/.local/share/nvim/site/plugged')

Plug 'joshdick/onedark.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'

Plug 'neoclide/coc.nvim', { 'tag': '*', 'do': './install.sh' }

Plug 'reasonml-editor/vim-reason-plus'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'benmills/vimux'

Plug 'jparise/vim-graphql'
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'

call plug#end()

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

noremap <C-t> :NERDTreeToggle<CR>

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

"""""""""""""""""""""""
" Config for coc.nvim "
"""""""""""""""""""""""

" Some language servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c 

set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostics-prev)
nmap <silent> ]c <Plug>(coc-diagnostics-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> K :call CocAction('doHover')<CR>

" Use `:Format` to format the current buffer
command! -nargs=0 Format :call CocAction('format')

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" configure fzf for vim
set rtp+=/usr/local/opt/fzf

" configure ack.vim to use ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

nmap <C-p> :FZF<CR>
