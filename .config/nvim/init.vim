syntax on

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nu
set relativenumber
set incsearch
set nohlsearch
set nowrap
set noswapfile
set nobackup
set scrolloff=8

call plug#begin()
Plug 'gruvbox-community/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
call plug#end()

colorscheme gruvbox

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \ }
      \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
