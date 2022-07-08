:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set expandtab
:set mouse=a

call plug#begin()
Plug 'https://github.com/vim-airline/vim-airline'                       " Bottom Visual Aid
Plug 'https://github.com/preservim/nerdtree', {'branch': 'release'}     " Side Panel (File Selection)
Plug 'https://github.com/neoclide/coc.nvim'                             " Auto Completion
Plug 'https://github.com/ap/vim-css-color'                              " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes'                 " Retro Scheme
Plug 'https://github.com/terryma/vim-multiple-cursors'                  " CTRL + N for multiple cursors
Plug 'https://github.com/tpope/vim-commentary'                          " For Commenting gcc & gc
call plug#end()

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-s> :NERDTreeFind<CR>
nnoremap <C-b> <C-w>
nnoremap <C-E> <C-\><C-n>

" To install plugins:
  " 1. $ sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"   (From the guide at https://github.com/junegunn/vim-plug)
"   2. Then (after plugins are declared), run :PlugInstall


" To install Auto-completion:
"   1. $ sudo apt install npm
"   2. go to nvim/plugged/coc.nvim
"   3. $ sudo npm install -g yarn
"   4. $ yarn install
"   5. $ yarn build
"   6. install language-specific completion modules
"       - :CocInstall coc-python
"       - :CocInstall coc-go
"       - etc.
