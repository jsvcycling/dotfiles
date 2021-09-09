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

" Setup NERDTree
map <C-o> :NERDTreeToggle<CR>

" Setup Tagbar
map <F8> :ToggleTagbar<CR>

" Setup FZF
map ; :GFiles -c -o --exclude-standard<CR>

" Setup neovim LSP client
if has('nvim')
lua <<EOF
	local lspconfig = require('lspconfig')
	local servers = { 'gopls', 'rust_analyzer' }
	for _, lsp in ipairs(servers) do
		lspconfig[lsp].setup{}
	end
EOF
endif
