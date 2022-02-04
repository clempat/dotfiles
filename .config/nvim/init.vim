set path+=**

set exrc
set number relativenumber
set nohlsearch
set incsearch
set hidden
set noerrorbells
set smartcase
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
" set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noselect
set signcolumn=yes
set colorcolumn=120
set autoread

call plug#begin('~/.vim/plugged')

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'glepnir/lspsaga.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'onsails/lspkind-nvim'
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" Neovim Tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'gruvbox-community/gruvbox'
Plug 'mbbill/undotree'
Plug 'tpope/vim-dispatch'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'tpope/vim-fugitive'

Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'

" Prettier
Plug 'sbdchd/neoformat'
Plug 'ThePrimeagen/vim-be-good'
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'darrikonn/vim-gofmt'

" GIT
Plug 'junegunn/gv.vim'


Plug 'hoob3rt/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'

Plug 'wakatime/vim-wakatime'
Plug 'tpope/vim-rhubarb'

call plug#end()

" LSP
lua require 'clempat'

" Allow neoformat to use local prettier
let g:neoformat_try_node_exe = 1

colorscheme gruvbox
" transparency background
highlight Normal guibg=none ctermbg=none
highlight ColorColumn ctermbg=238

let mapleader = " "
inoremap jk <esc>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
"Copy the path to the file
nnoremap <leader>cp :let @+=expand("%")<CR> 
nnoremap <leader>cl :let @+=expand("%") . ":" . line(".")<CR> 
" Prettier on save
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

augroup filetype_jsx
    autocmd!
    autocmd FileType javascript set filetype=javascriptreact
augroup END
