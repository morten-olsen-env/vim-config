execute pathogen#infect()
syntax on
filetype plugin indent on

let g:jsx_ext_required = 0

set background=dark
colorscheme solarized

if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif
function! ToggleMouse()
    " check if mouse is enabled
    if &mouse == 'a'
        " disable mouse
        set mouse=
    else
        " enable mouse everywhere
        set mouse=a
    endif
endfunc

:set number
:set tabstop=2
:set shiftwidth=2
:set expandtab
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
" 256-color terminal
set t_Co=256

set backspace=2 " make backspace work like most other apps
set term=screen-256color
let g:solarized_termcolors=256
" set t_ut=
let mapleader = ","
colorscheme molokai
let g:airline#extensions#tabline#enabled = 1

" Key bindings
:nmap <Leader>m :call ToggleMouse()<CR>
:nmap <Leader>n :NERDTreeToggle<CR>
:nmap <Leader>df :Goyo<CR>
:nmap <Leader>b :FufBuffer<CR>
:nmap <C-n> :tabnew<CR>
:nmap <Leader>l :tabnext<CR>
nnoremap <leader>d "_d
