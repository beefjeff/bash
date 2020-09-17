" ============================================================================
" " Plugins
" "
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line 
"
" ============================================================================
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin() " alternatively, pass a path where Vundle should install plugins ---  call vundle#begin('~/some/path/here')
	" let Vundle manage Vundle, required
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'valloric/youcompleteme'

	"Plugin 'tpope/vim-fugitive'
	"Plugin 'git://git.wincent.com/command-t.git'
	"Plugin 'file:///home/gmarik/path/to/plugin'
	"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
call vundle#end()            " required
" ======= End plugin script ============

inoremap <leader>s <esc>:w<cr>
nnoremap <leader>s :w

filetype plugin indent on    " required

" :Sw -> save a file with sudo privs
command! -nargs=0 Sw w !sudo tee % > /dev/null
command! -nargs=0 Swq w !sudo tee % > /dev/null && l <cr> && q
let mapleader = ","
" set gdefault
" source this file

set ignorecase
set smartcase
set clipboard=unnamedplus
set tabstop=4
set shiftwidth=4
set autoindent


" ============================================================================
" " Movement
" "
" ============================================================================


noremap j k
noremap k j
noremap l l
noremap h h
noremap L $
noremap H ^


" ============================================================================
" " Editing
" "
" ============================================================================

"" auto close characters
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

"auto close {
function! s:CloseBracket()
    let line = getline('.')
    if line =~# '^\s*\(struct\|class\|enum\) '
        return "{\<Enter>};\<Esc>O"
    elseif searchpair('(', '', ')', 'bmn', '', line('.'))
        " Probably inside a function call. Close it off.
        return "{\<Enter>});\<Esc>O"
    else
        return "{\<Enter>}\<Esc>O"
    endif
endfunction
inoremap <expr> {<Enter> <SID>CloseBracket()


"" Yaml
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"" Escape
inoremap <space>, <Esc>`^
inoremap <C-q> <Esc>`^
noremap <C-q> <Esc>
vnoremap <C-q> <Esc>
vnoremap <space>, <Esc>
cmap <C-q> <C-c>


" Moving blocks of text in visual mode
vnoremap < <gv
vnoremap > >gv

"" Moving blocks of text in normal mode
" noremap > V > <esc>
" noremap < V < <esc>


"moving blocks of text
nnoremap <c-K> :m .+1<CR>==
nnoremap <c-J> :m .-2<CR>==
inoremap <c-K> <Esc>:m .+1<CR>==gi
inoremap <c-J> <Esc>:m .-2<CR>==gi
vnoremap <c-K> :m '>+1<CR>gv=gv
vnoremap <c-J> :m '<-2<CR>gv=gv


" " Select all text
map <leader>a ggVG

"
"" Copy until the end of the line
" noremap Y y$

" Indent everything
" noremap <Space>I ggvG=
"
" " Indent selection in visual mode
" vnoremap <Space>i =
"

" Change current word - kill
" noremap K ciw
"
" " Change in double quotes
" noremap J ci"
"
" " Join lines
" nnoremap <Space>J J
"
"
"" ============================================================================
" Editor control
" "
" ============================================================================
"
"" Enter the command-line mode
noremap <CR> :
"" remove highlighting
nnoremap <silent> <C-h> :noh<cr>

nnoremap - :Ex<cr>


" Reload .ideavimrc
" nnoremap <Space>vs :source ~/.ideavimrc<CR>
"
"
" "
" ============================================================================
" " IDE actions
" "
" ============================================================================
"
"nnoremap / :action Find<CR>
"nnoremap n :action FindNext<CR>
"nnoremap N :action FindPrevious<CR>
"nnoremap U :action $Redo<CR>
"nnoremap ; :action AceJumpAction<CR>
"nnoremap <Space>o :action GotoClass<CR>
"nnoremap <Space>O :action GotoFile<CR>
"nnoremap <Space>d :action CloseContent<CR>
"nnoremap <Space>j :action RecentFiles<CR>
"nnoremap <Space>k :action FileStructurePopup<CR>
"nnoremap <Space>h :action QuickJavaDoc<CR>
" "
" "
" "
" "
" "
" "
" "
" "
nnoremap <F9> :!%:p<enter>

if &diff
	colorscheme desert
endif
