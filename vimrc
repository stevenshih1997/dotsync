set timeoutlen=1000
set ttimeoutlen=10

set wildmenu
set clipboard=unnamed

set number
set hlsearch
set ignorecase
set smartcase
set incsearch
set ruler

set cursorline
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

set mouse=a

syntax on
set backspace=indent,eol,start

syntax enable
colorscheme smyck

highlight CursorLine ctermbg=236

set background=dark
set t_Co=256

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
  Plug 'ajh17/vimcompletesme'
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
call plug#end()

" /////////////////
" // NERDTree like setup with netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15
let g:netrw_fastbrowse = 0
"let g:netrw_keepdir = 0
" Use Ctrl-e to toggle nerdtree-like window on and off
" Function attempts to fix bug when changing directory breaks netrw
let g:NetrwIsOpen = 0
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

"nmap <C-e> :Lexplore<CR>
nmap <C-e> :call ToggleNetrw()<CR>
" ////////////////

"let g:ale_ling_on_enter = 0
"let g:ale_lint_on_save = 1
"let g:ale_linters = {'cpp': ['cppcheck']}
"let g:ale_linters_explicit = 1
