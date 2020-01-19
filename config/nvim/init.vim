call plug#begin('~/.config/nvim/plugins')
Plug 'derekwyatt/vim-scala'
Plug 'elixir-editors/vim-elixir'
Plug 'fatih/vim-go'
Plug 'janko-m/vim-test'
Plug 'keith/swift.vim'
Plug 'kien/ctrlp.vim'
Plug 'leafgarland/typescript-vim'
Plug 'moll/vim-node'
Plug 'scrooloose/syntastic'
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'vimwiki/vimwiki'
Plug 'ajh17/vimcompletesme'
Plug 'lervag/vimtex'
Plug 'alaviss/nim.nvim'
call plug#end()

" colors
syntax enable
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }
highlight Visual cterm=reverse ctermbg=NONE
highlight ErrorMsg NONE

" tabs & spaces
set tabstop=4 " visual spaces per tab
set softtabstop=4 " spaces per tab when editing
set expandtab
filetype indent on " load filetype specific indent files
filetype plugin on
set autoindent

" ui config
set number
set cursorline
set wildmenu
set lazyredraw
set showmatch

" search
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>

" folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za
set foldmethod=indent

" movement
nnoremap j gj
nnoremap k gk

nnoremap B ^
nnoremap E $

nnoremap $ <nop>
nnoremap ^ <nop>

nnoremap gV `[v`]

" leader shortcuts
let mapleader=","
inoremap jk <esc>

nnoremap <leader>u :GundoToggle<CR> " toggle gundo

nnoremap <leader>s :mksession<CR>

" CtrlP
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" autogroups
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md, *.rkt
                \:call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

