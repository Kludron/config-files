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

" Set colorscheme (from awesome-vim-colorschemes plugin)
:colorscheme solarized8

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-s> :NERDTreeFind<CR>
nnoremap <C-b> <C-w>
nnoremap <C-E> <C-\><C-n>
noremap! <C-?> <C-h>


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

" Quick tips:
"   - :%y+          # This will copy the whole file to your clipboard
"   - ny+           # Where n is a number, will copy that number of lines to your clipboard
"   - split +term   # This will split the window below the current window and open a terminal there
"   - on Windows, some icons might not render. To fix this, you can 
"   - Setup guide video accessed here: https://www.youtube.com/watch?v=JWReY93Vl6g
"   - This guide was adapted for personal use from https://github.com/NeuralNine/config-files/blob/master/init.vim


" From reddit:

" Terminal Function
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

" Toggle terminal on/off (neovim)
nnoremap <A-t> :call TermToggle(12)<CR>
inoremap <A-t> <Esc>:call TermToggle(12)<CR>
tnoremap <A-t> <C-\><C-n>:call TermToggle(12)<CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>
