inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O
inoremap [ []<Esc>i
inoremap < <><Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>iet showmatch

set ruler
set smarttab
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=0

let mapleader = ","

inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O
inoremap [ []<Esc>i
inoremap < <><Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

call plug#begin()

	Plug 'voldikss/vim-floaterm'
	Plug 'preservim/nerdtree'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'		
	Plug 'vim-airline/vim-airline'
	Plug 'kyoz/purify', { 'rtp': 'vim' }
	Plug 'neoclide/coc.nvim' 
	Plug 'neovim/nvim-lspconfig'

call plug#end()


" Float Terminal
nnoremap <leader>x :FloatermNew<CR>

" NERD TREE
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Purify
let g:airline_theme='purify'
syntax on 
colorscheme purify


