call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'nanotech/jellybeans.vim'
Plug 'ctrlpvim/ctrlp.vim'
" Initialize plugin system
call plug#end()
" Comments in Vimscript start with a `"`.

set nocompatible

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\ " 표시되는 상태바 내용

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Disable arrow keys
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" CtrlP configs
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore = {'file': '\v\.(exe|zip|swp|so|dll)$'}

" indent configs
set tabstop=4 " 탭으로 들여쓰기시 사용할 스페이스바 개수. (= ts)
set softtabstop=4 " 스페이스바 n개를 하나의 탭으로 처리. (= sts)
set shiftwidth=4 " <<, >> 으로 들여쓰기시 사용할 스페이스바 개수. (= sw)
set smartindent
set cindent

" clipboard config for copy & paste between vim and system
set clipboard^=unnamed,unnamedplus
" encoding
set fileencodings=utf-8,euc-kr    " 파일 저장 인코딩 : utf-8, euc-kr
set fencs=ucs-bom,utf-8,euc-kr    " 한글 파일은 euc-kr, 유니코드는 유니코드

set showmatch    " 다른 코딩 프로그램처럼 매칭되는 괄호 보여줌
set hlsearch    " 검색 시 하이라이트
set background=dark

" plugin delimitmate
let delimitMate_expand_cr=1

" plugin syntastic
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\ " 표시되는 상태바 내용
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
 
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Wextra -Wpedantic"
let g:syntastic_c_compiler_options = "-std=c11 -Wall -Wextra -Wpedantic"

let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['python']
" save current file and compile and execute
map <buffer> <F8> :w <CR> :!clear; g++ % -o %< && ./%< <CR>
imap <buffer> <F8> <esc>:w <CR> :!clear; g++ % -o %< && ./%< <CR>

map <buffer> <F9> :w <CR> :!clear; python3 % <CR>
imap <buffer> <F9> <esc> :w <CR> :!clear; python3 % <CR>

" indent-guides config
let g:indent_guides_enable_on_vim_startup = 1
" set airline
let g:airline_theme='bubblegum'
" set colorscheme
colorscheme jellybeans
