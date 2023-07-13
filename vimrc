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

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/AutoClose'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

Plug 'jparise/vim-graphql'
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'rust-lang/rust.vim'
Plug 'pantharshit00/vim-prisma'
Plug 'hashivim/vim-terraform'
Plug 'lervag/vimtex'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'navarasu/onedark.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'mfussenegger/nvim-dap'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-neorg/neorg'
Plug 'Pocco81/true-zen.nvim'
Plug 'ggandor/leap.nvim'
Plug 'kevinhwang91/nvim-bqf'
Plug 'lewis6991/gitsigns.nvim'

Plug 'vim-denops/denops.vim'
Plug 'skanehira/denops-graphql.vim'

Plug 'vimpostor/vim-tpipeline'

call plug#end()

syntax on
let g:onedark_config = {
  \ 'style': 'darker',
\}
colorscheme onedark

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

set number relativenumber " enable line numbers
set cursorline            " highlights current row
set wildmenu              " visual autocomplete for command menu
set lazyredraw            " redraw only when we need to
set showmatch             " highlight matching []/{}/()

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" turn off search highlighting
nnoremap <leader><space> :nohlsearch<CR>

set scrolloff=30         " keep 30 lines above/below cursor

set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max

" space opens/closes folds
nnoremap <space> za

set foldmethod=indent   " fold off of current indent

set backspace=2         " make backspace work like most other apps

let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1

" configure terraform
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1

" easier split navigations
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" easier buffer navigations
noremap <leader>] :BufferNext<CR>
noremap <leader>[ :BufferPrev<CR>
noremap <leader>x :BufferClose<CR>

" move vertically by visual line
noremap j gj
noremap k gk

noremap <C-t> :NvimTreeToggle<CR>

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

""""""""""""""""""""
" Config for neorg "
""""""""""""""""""""

nnoremap <leader>n :Neorg workspace notes<CR>

" ToggleTermVisual Selection
vnoremap <leader>t :ToggleTermSendVisualSelection<CR>

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
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#previous(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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

"""""""""""""""""
" NeoVim Config "
"""""""""""""""""

if has('nvim')
lua <<EOF

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "typescript", "graphql", "vim", "lua" },

  auto_install = true,

  highlight = {
    enable = true,
  }
}

-- empty setup using defaults
require('nvim-tree').setup()

local nvim_tree_events = require('nvim-tree.events')
local bufferline_api = require('bufferline.api')

local function get_tree_size()
  return require'nvim-tree.view'.View.width
end

nvim_tree_events.subscribe('TreeOpen', function()
  bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('Resize', function()
  bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('TreeClose', function()
  bufferline_api.set_offset(0)
end)

require("toggleterm").setup{
  open_mapping = [[<c-\>]],
  direction = 'horizontal',
  size = 20
}

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  -- vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<leader>q', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float"
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap(
  "n", "<leader>g",
  "<cmd>lua _lazygit_toggle()<CR>",
  {noremap = true, silent = true}
)

require("true-zen").setup{
  -- true-zen config
}

require("nvim-treesitter.install").compilers = { "gcc-12" }
require('neorg').setup {
  load = {
    ["core.defaults"] = {}, -- Loads default behaviour
    ["core.keybinds"] = {
      config = {
        hook = function(keybinds)
          keybinds.map(
            "norg", "n", "<C-l>o",
            "<cmd>Neorg keybind all core.looking-glass.magnify-code-block"
          )
          keybinds.remap("norg", "n", "<Leader>n", "core.neorgcmd.commands.return")
        end,
      },
    },
    ["core.concealer"] = {}, -- Adds pretty icons to your documents
    ["core.integrations.truezen"] = {}, -- Adds support for true-zen integration
    ["core.dirman"] = { -- Manages Neorg workspaces
      config = {
        workspaces = {
          notes = "~/notes",
          lassie = "~/src/lassie/notes"
        },
      },
    },
  },
}

local nvimTree = require("nvim-tree.api")
vim.keymap.set({'n', 'v', 'i'}, '<C-t>', nvimTree.tree.toggle)

require('leap').add_default_mappings()

-- setup gitsigns
require('gitsigns').setup()
EOF
endif

nmap <C-p> :FZF<CR>

