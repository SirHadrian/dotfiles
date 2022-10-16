set guicursor=
set expandtab
:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
set clipboard=unnamedplus
set encoding=UTF-8
highlight CursorLine ctermbg=Yellow cterm=bold guibg=#2b2b2b

call plug#begin()

Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'Xuyuanp/nerdtree-git-plugin' " NERDTree Git
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
" Plug 'jiangmiao/auto-pairs' " Closing brachets
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' } " Search Files
Plug 'Mofiqul/dracula.nvim' " Dracula theme
Plug 'danilamihailov/beacon.nvim' " Cursor beacon for visibility 
Plug 'mhinz/vim-startify' " Starting screen for nvim
" Plug 'tpope/vim-surround' " Surround : parentheses, brackets, quootes
Plug 'yggdroot/indentline' " See indentation levels
Plug 'neoclide/coc.nvim', {'branch': 'release'} " For code completion
Plug 'jparise/vim-graphql' " For syntax highlighting supports coc
Plug 'chiel92/vim-autoformat' " Format code 
Plug 'honza/vim-snippets' " Code snippets
Plug '907th/vim-auto-save' " AutoSaveToggle

call plug#end()

" Exit insert mode with ii
inoremap ii <ESC>

" Autoformat key
noremap <F3> :Autoformat<CR>

" NerdTree keybinds
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" Change coc popup background color 
highlight CocFloating ctermbg=black

