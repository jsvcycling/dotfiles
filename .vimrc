let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'itchyny/lightline.vim'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

if has('nvim')
	Plug 'neovim/nvim-lspconfig'
endif

call plug#end()

set number
set noswapfile
set tabstop=4
set softtabstop=4
set shiftwidth=4
filetype indent on

set completeopt=menuone,noinsert,noselect

" Setup NERDTree
map <C-o> :NERDTreeToggle<CR>

" Setup netrw
let g:netrw_banner = 0

" Setup Tagbar
map <F8> :ToggleTagbar<CR>

" Setup FZF
map ; :GFiles -c -o --exclude-standard<CR>

" Setup neovim LSP client
if has('nvim')
lua <<EOF
	local lspconfig = require('lspconfig')

	local on_attach = function(_, bufnr)
		local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
		local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

		-- Enable completion triggered by <C-x><C-o>
		buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

		local opts = { noremap = true, silent = true }

		buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
		buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
		buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
		buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
		buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	end

	local servers = { 'gopls', 'rust_analyzer' }
	for _, lsp in ipairs(servers) do
		lspconfig[lsp].setup{
			on_attach = on_attach
		}
	end
EOF
endif
