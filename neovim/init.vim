set number
set relativenumber
set nocompatible
set encoding=utf-8

syntax enable
set hls

set cursorline

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable PEP8 file formating
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Enable HTML, CSS file formating
au BufNewFile,BufRead *.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" convert tab to 2 spaces
set tabstop=2 shiftwidth=2 expandtab

" ---------------------- KEY MAPPING ----------------------
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

nnoremap j jzzzv
nnoremap k kzzzv
" ---------------------- KEY MAPPING ----------------------

" SNIPPETS
" Read an empty if template for node.js and move cursor to condition
nnoremap !nodeif :read $HOME/.config/nvim/snippets/nodejs_if_snippet.js<CR>4l
" Read an empty if else template for node.js and move cursor to condition
nnoremap !nodeife :-1read $HOME/.config/nvim/snippets/nodejs_if_else_snippet.js<CR>4l

" set-up vim-plug plugin manager
if empty(glob('~/.config/nvim/plugged'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" start loading plugins
call plug#begin('~/.config/nvim/plugged')

" themes
Plug 'patstockwell/vim-monokai-tasty'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'

" linting
Plug 'w0rp/ale'

Plug 'itchyny/lightline.vim'

" end loading plugins
call plug#end()

" set true-color
set t_Co=256
set termguicolors

" enable theme
colorscheme vim-monokai-tasty

" enabler linter with standard.js
let g:ale_linters = { 'javascript': ['standard'], 'python': ['flake8'] }
let g:ale_fixers = { 'javascript': ['standard'], 'python': ['black'] }
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

let g:lightline = { 'colorscheme': 'monokai_tasty' }

set laststatus=2

