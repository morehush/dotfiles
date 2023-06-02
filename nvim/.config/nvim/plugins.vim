" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
    Plug 'sheerun/vim-polyglot'
    " Auto pairs for '(' '[' '{'
    " Plug 'jiangmiao/auto-pairs'
    " Plug 'arcticicestudio/nord-vim'
    Plug 'joshdick/onedark.vim'
    Plug 'ap/vim-css-color'
    Plug 'itchyny/lightline.vim'
    Plug 'tpope/vim-commentary'
call plug#end()

let g:onedark_terminal_italics=0

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }

set laststatus=2
colorscheme onedark
