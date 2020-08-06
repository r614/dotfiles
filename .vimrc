set runtimepath+=~/.vim_runtime
" set Vim-specific sequences for RGB colors
let t_8f = "[38;2;%lu;%lu;%lum"
let t_8b = "[48;2;%lu;%lu;%lum"
set termguicolors
syntax on

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim
set autoindent
try
source ~/.vim_runtime/my_configs.vim
catch
endtry

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'skbolton/embark'
call plug#end()

colorscheme embark
let g:lightline = { 'colorscheme': 'embark' }
