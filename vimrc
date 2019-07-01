let mapleader = ","
" set gdefault
" source this file

set ignorecase
set smartcase
set clipboard+=unnamed
inoremap <leader>s <esc>:w<cr>
nnoremap <leader>s :w


" :Sw -> save a file with sudo privs
command! -nargs=0 Sw w !sudo tee % > /dev/null
command! -nargs=0 Swq w !sudo tee % > /dev/null && l <cr> && q


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
"
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
nnoremap <silent> <C-h> :noh<cr>

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
