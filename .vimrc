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
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'tree-sitter/tree-sitter'
Plug 'preservim/tagbar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
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
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. 
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

" Enable mouse support. 
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

" set colorscheme
colorschem jellybeans

" CtrlP configs
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore = {'file': '\v\.(exe|swp|so|dll)$'}

" indent configs
set tabstop=4 " 탭으로 들여쓰기시 사용할 스페이스바 개수. (= ts)
set softtabstop=4 " 스페이스바 n개를 하나의 탭으로 처리. (= sts)
set shiftwidth=4 " <<, >> 으로 들여쓰기시 사용할 스페이스바 개수. (= sw)
set smartindent
set cindent

" clipboard
set clipboard=unnamed

" encoding
set fileencodings=utf-8,euc-kr    " 파일 저장 인코딩 : utf-8, euc-kr
set fencs=ucs-bom,utf-8,euc-kr    " 한글 파일은 euc-kr, 유니코드는 유니코드

set showmatch    " 다른 코딩 프로그램처럼 매칭되는 괄호 보여줌
set hlsearch    " 검색 시 하이라이트
set background=dark

" plugin delimitmate
let delimitMate_expand_cr=1

" plugin syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
 
" indent-guides config
let g:indent_guides_enable_on_vim_startup = 1

" set airline
let g:airline_theme='bubblegum'
" let g:airline_powerline_fonts = 1 "https://github.com/powerline/fonts
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" 버퍼 목록 켜기
let g:airline#extensions#tabline#enabled = 1
" 파일명만 출력
let g:airline#extensions#tabline#fnamemod = ':t'
" 상태바 z 구역
let g:airline_symbols.linenr = ' ␤ '
let g:airline_symbols.colnr = ' ㏇'
let g:airline_symbols.maxlinenr = ''

" 버퍼 새로 열기
" 원래 이 단축키로 바인딩해 두었던 :tabnew를 대체한다.
nmap <leader>b :enew<CR>
" 다음 버퍼로 이동
nmap <leader>l :bnext<CR>
" 이전 버퍼로 이동
nmap <leader>h :bprevious<CR>
" 현재 버퍼 닫기
nmap <leader>d :bdelete<CR>

" map semicolon to colon
nnoremap ; :
vnoremap ; :

let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Wextra -Wpedantic"
let g:syntastic_c_compiler_options = "-std=c11 -Wall -Wextra -Wpedantic"

let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['python']

nnoremap <silent> <buffer> <F5> :call SaveAndExecute()<CR>
inoremap <silent> <buffer> <F5> <esc> :call SaveAndExecute()<CR>

" https://stackoverflow.com/questions/18948491/running-python-code-in-vim
function! SaveAndExecute()
    " SOURCE [reusable window]: https://github.com/fatih/vim-go/blob/master/autoload/go/ui.vim

    " save and reload current file
    silent execute "update | edit"

    " get file path of current file
    let s:current_buffer_file_path = expand("%")
	let s:current_buffer_file_extenstion = expand("%:e")
	let s:current_buffer_file_name_for_cpp = "./" . expand("%:r")

	if s:current_buffer_file_extenstion == "py"
		let s:output_buffer_name = "Python"
	elseif s:current_buffer_file_extenstion == "c"
		let s:output_buffer_name = "C"
	elseif s:current_buffer_file_extenstion == "cpp"
		let s:output_buffer_name = "C++"
	endif

	" echom expand("%:e")
    let s:output_buffer_filetype = "output"

	" reuse existing buffer window if it exists otherwise create a new one
    if !exists("s:buf_nr") || !bufexists(s:buf_nr)
        silent execute 'botright new ' . s:output_buffer_name
        let s:buf_nr = bufnr('%')
    elseif bufwinnr(s:buf_nr) == -1
        silent execute 'botright new'
        silent execute s:buf_nr . 'buffer'
    elseif bufwinnr(s:buf_nr) != bufwinnr('%')
        silent execute bufwinnr(s:buf_nr) . 'wincmd w'
    endif

	silent execute "resize " . winheight(0)/2
    silent execute "setlocal filetype=" . s:output_buffer_filetype
    setlocal bufhidden=delete
    setlocal buftype=nofile
    setlocal noswapfile
    setlocal nobuflisted
    setlocal winfixheight
    " setlocal cursorline " make it easy to distinguish
    setlocal nonumber
    setlocal norelativenumber
    setlocal showbreak=""

    " clear the buffer
    setlocal noreadonly
    setlocal modifiable
    %delete _

    " add the console output
	if s:current_buffer_file_extenstion == "py"
		silent execute ".!python3 " . shellescape(s:current_buffer_file_path, 1)
	elseif s:current_buffer_file_extenstion == "c" || s:current_buffer_file_extenstion == "cpp"
		silent execute ".!g++ " . shellescape(s:current_buffer_file_path, 1) . " -o " . shellescape(s:current_buffer_file_name_for_cpp, 1) 
		silent execute ".!./" . shellescape(s:current_buffer_file_name_for_cpp, 1)	
	endif

    " make the buffer non modifiable
    setlocal readonly
    setlocal nomodifiable
    if (line('$') == 1 && getline(1) == '')
      q!
    endif
    " silent execute 'wincmd p'
endfunction

" tagbar configs; you need to install ctags-exuberant for tagbar
nmap <F8> :TagbarToggle<CR>
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
