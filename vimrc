if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"PlugInstall [name ...] [#threads]	Install plugins
"PlugUpdate [name ...] [#threads]	Install or update plugins
"PlugClean[!]	Remove unlisted plugins (bang version will clean without prompt)
"PlugUpgrade	Upgrade vim-plug itself
"PlugStatus	Check the status of plugins
"PlugDiff	Examine changes from the previous update and the pending changes
"PlugSnapshot[!] [output path]	Generate script for restoring the current snapshot of the plugins
call plug#begin('~/.vim/plugged')
    " utility
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'jreybert/vimagit'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'SirVer/ultisnips'
    Plug 'vim-test/vim-test'
    Plug 'chrisbra/csv.vim'



    Plug 'ycm-core/YouCompleteMe'
    " theme
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-airline/vim-airline'

    " laravel
    Plug 'tpope/vim-dispatch'
    Plug 'noahfrederick/vim-composer'
    Plug 'noahfrederick/vim-laravel'
    " php
    Plug 'StanAngeloff/php.vim'
call plug#end()


filetype plugin indent on    " required

" Settings
    let mapleader = ","
    set ignorecase
    set smartcase
    set clipboard=unnamedplus
    set tabstop=4
    set shiftwidth=4
    set smarttab
    set autoindent
    set expandtab
    set number
    set ruler
    set laststatus=2
    set backspace=indent,eol,start
    syntax on


" Mappings 
    " Resize windows - Maps Alt-[h,j,k,l] to resizing a window split
        execute "set <M-h>=\eh"
        execute "set <M-k>=\ek"
        execute "set <M-j>=\ej"
        execute "set <M-l>=\el"
        map <silent> <A-h> <C-w><
        map <silent> <A-k> <C-W>-
        map <silent> <A-j> <C-W>+
        map <silent> <A-l> <C-w>>

    nmap <C-A> :w<CR>:so %<CR>
    execute "set <M-2>=\e2"
    map <M-2> :NERDTreeToggle<CR>
    execute "set <M-1>=\e1"
    map <M-1> :set splitbelow<CR>:term<CR>
    execute "set <M-.>=\e."
    inoremap <M-.> ->
    execute "set <M-=>=\e="
    inoremap <M-=> =>
    nnoremap <leader>es :UltiSnipsEdit<CR>
    nnoremap <leader>pi :w<CR>:source ~/.vimrc<CR>:PlugInstall<CR>:q
    nnoremap <leader>pc :w<CR>:source ~/.vimrc<CR>:PlugClean!<CR>:q<CR>
    nnoremap <F9> :!%:p<enter>
    noremap <CR> :
    nnoremap <silent> <C-h> :noh<cr>
    nnoremap - :Ex<cr>
    noremap j k
    noremap k j
    noremap l l
    noremap h h
    noremap L $
    noremap H ^
    nnoremap <leader>s :w<CR>:source ~/.vimrc<CR>
    nnoremap <leader>ev :e ~/.vimrc<CR>
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
    "" auto close characters
    inoremap " ""<left>
    inoremap ' ''<left>
    inoremap ( ()<left>
    inoremap [ []<left>
    inoremap { {}<left>
    inoremap {<CR> {<CR>}<ESC>O
    inoremap {;<CR> {<CR>};<ESC>O

    " Change current word - kill
    noremap K ciw
    "
    " " Change in double quotes
    noremap J ci"
    "
    " " Join lines
    nnoremap <Space>J J



"Theme"
    set background=dark
    colorscheme desert

    if (has("termguicolors"))
        set termguicolors
    endif


    set t_Co=256



" Commands
    command! -nargs=0 Sw w !sudo tee % > /dev/null
    
    "" Yaml
    au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    " Commenting blocks of code.
    augroup commenting_blocks_of_code
      autocmd!
      autocmd FileType c,cpp,java,scala,php let b:comment_leader = '// '
      autocmd FileType sh,ruby,python       let b:comment_leader = '# '
      autocmd FileType conf,fstab           let b:comment_leader = '# '
      autocmd FileType tex                  let b:comment_leader = '% '
      autocmd FileType mail                 let b:comment_leader = '> '
      autocmd FileType vim                  let b:comment_leader = '" '
    augroup END
    noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
    noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
   
   
   
   
" Functions
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

    " Source vim configuration file whenever it is saved
    if has ('autocmd')          " Remain compatible with earlier versions
     augroup Reload_Vimrc       " Group name.  Always use a unique name!
        autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
        autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
      augroup END

    endif " has autocmd
   



" Plugin Settings 
    " php.vim
        let g:php_version_id=70400 "Default:70300
        let php_var_selector_is_identifier=1 " Default: 0 - include the dollar sign $ as part of the highlighting group for a PHP variable.
        let php_sql_query=0

    " vim-airline
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#left_sep = ' '
        let g:airline#extensions#tabline#left_alt_sep = '|'
    " ctrl-p
        set wildignore+=*/tmp/**.so,*.swp,*.zip
        let g:ctrlp_user_command = ['.git','cd %s && git ls-files -co --exclude-standard']
    " ultisnips
        let g:UltiSnipsExpantTrigger="<tab>"
        let g:UltiSnipsJumpForwardTrigger="<c-b>"
        let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    " vim-test
        let test#strategy = "dispatch"
        let g:dispatch_compilers = {}
        let g:dispatch_compilers['./vendor/bin/'] = ''
        let g:dispatch_compilers['phpunit'] = 'phpunit2'
        let test#php#phpunit#executable = 'php artisan test'
        nmap <silent> t<C-n> :TestNearest<CR>
        nmap <silent> t<C-f> :TestFile<CR>
        nmap <silent> t<C-s> :TestSuite<CR>
        nmap <silent> t<C-l> :TestLast<CR>
        nmap <silent> t<C-g> :TestVisit<CR>



