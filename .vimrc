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
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" Keybindings

nmap [f <Plug>(ale_fix)
nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)
inoremap <S-Tab> <C-d>
nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
colorscheme embark
let g:lightline = { 'colorscheme': 'embark' }
