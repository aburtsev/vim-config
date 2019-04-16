set clipboard+=unnamedplus
setglobal nocompatible
setglobal pastetoggle=<F2>

set ttyfast
set lazyredraw

let g:python_host_skip_check=1
let g:loaded_python3_provider=1

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'ervandew/supertab'
" Plug 'ajh17/VimCompletesMe'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'neomake/neomake'
Plug 'w0rp/ale'

Plug 'junegunn/fzf', {'dir':'~/.fzf', 'do': './install -all'}
Plug 'junegunn/fzf.vim'
" Plug 'w0rp/ale'
" Plug 'lxhillwind/leader-clipboard'
Plug 'ntpeters/vim-better-whitespace'
" Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'janko-m/vim-test'
Plug 'rhysd/vim-grammarous', { 'on': 'GrammarousCheck' }
Plug 'Shougo/echodoc.vim'
Plug 'fatih/vim-nginx', { 'for': 'nginx' }
" Plug 'jlanzarotta/bufexplorer'
Plug 'lepture/vim-jinja', { 'for': 'jinja' }
" Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'nanotech/jellybeans.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-projectionist'
Plug 'othree/html5.vim'
Plug 'digitaltoad/vim-pug', { 'for': 'pug' }
Plug 'slim-template/vim-slim', { 'for': ['slim', 'slime'] }
Plug 'editorconfig/editorconfig-vim'
Plug 'cohama/lexima.vim'

Plug 'tpope/vim-ragtag'
Plug 'mhartington/vim-typings'

Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
" Plug 'mitermayer/vim-prettier', {
"       \ 'do': 'npm install',
"       \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss'] }
" Plug 'maxmellon/vim-jsx-pretty'
Plug 'chemzqm/vim-jsx-improve', { 'for': 'javascript' }
" Plug 'moll/vim-node'
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'reedes/vim-lexical'

" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-easytags'
" Plug 'Valloric/MatchTagAlways'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'shime/vim-livedown', { 'for': 'markdown' }
Plug 'tpope/vim-haml', { 'for': 'haml' }
" Plug 'tpope/vim-git'
Plug 'michaeljsmith/vim-indent-object'

Plug 'kovisoft/slimv', { 'for': ['clojure', 'scheme', 'racket'] }
Plug 'wlangstroth/vim-racket', { 'for': 'racket' }

Plug 'stephpy/vim-yaml', { 'for': 'yaml' }
" Plug 'henrik/vim-yaml-flattener'

Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }

call plug#end()

set rtp+=/root/.fzf

let mapleader = "\<Space>"

" https://github.com/vim/vim/blob/master/runtime/doc/russian.txt
" Enable hotkeys for Russian layout
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
setlocal spell spelllang=en_us,ru_yo
" Russian support for vim hotkeys
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

" set visualbell
set completeopt=noinsert,menuone,noselect

" if has('mouse')
"   set mouse=a
" endif

" if has("clipboard")
set ttyfast

set shortmess+=c

set cursorline
set hidden
set nofoldenable
set wrap
set linebreak
set number
set hlsearch
set ignorecase
set smartcase

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowritebackup
set nowb
set noswapfile

set showcmd       " display incomplete commands
set autowrite     " Automatically :write before running commands

" Use one space, not two, after punctuation.
" set nojoinspaces

" set softtabstop=4
set expandtab
" set noexpandtab
set softtabstop=2
set shiftwidth=2

set splitbelow
set cmdheight=2
set signcolumn=yes
set scrolloff=3

silent! colorscheme jellybeans

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

""" Basics Keymaps

" Turn off linewise keys. Normally, the `j' and `k' keys move the cursor down one entire line. with line wrapping on, this can cause the cursor to actually skip a few lines on the screen because it's moving from line N to line N+1 in the file. I want this to act more visually -- I want `down' to mean the next line on the screen
nmap j gj
nmap k gk

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

nmap <silent> <leader>t :TestNearest<CR>
" nmap <silent> t<C-f> :TestFile<CR>
" nmap <silent> t<C-s> :TestSuite<CR>
" nmap <silent> t<C-l> :TestLast<CR>
" nmap <silent> t<C-g> :TestVisit<CR>

" Auto indent pasted text
" nnoremap p p=`]<C-o>
" nnoremap P P=`]<C-o>

" Edit .vimrc
map <leader>vl :vsp $MYVIMRC<CR>
map <leader>vr :source $MYVIMRC<CR>

""" Plugins Keymaps

nmap <C-m> :NERDTreeFind<CR>
nmap <silent> <leader><leader> :NERDTreeToggle<CR>

nnoremap <leader>b :Buffers<CR>

inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

vmap <leader>y :w! /tmp/.vbuf<CR>
nmap <leader>y :.w! /tmp/.vbuf<CR>
nmap <leader>p :r /tmp/.vbuf<CR>

" Move between linting errors
" nnoremap ]r :ALENextWrap<CR>
" nnoremap [r :ALEPreviousWrap<CR>

map <leader>cr :GrammarousCheck --lang=ru --preview<CR>

""" Plugin Settings

" let g:LanguageClient_autoStart = 1

" " \ 'yaml': ['yaml-language-server', '--stdio']
" let g:LanguageClient_serverCommands = {
"       \ 'php': ['php', expand('~/.vim/plugged/php-language-server/bin/php-language-server.php')],
"       \ 'javascript': ['javascript-typescript-stdio'],
"       \ 'javascript.jsx': ['javascript-typescript-stdio'],
"       \ 'java': ['/usr/local/bin/jdtls'],
"       \ 'ruby': ['solargraph', 'stdio'],
"       \ 'python': ['pyls'],
"       \ 'elixir': ['sh', expand('~/.elixir.d/elixir-ls/language_server.sh')],
"       \ }

let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toc_autofit = 1
let g:lexical#spelllang = ['en_us', 'ru_ru']

" let g:ale_elixir_credo_executable='make'
let g:ale_elixir_elixir_ls_release = '/root/elixir-ls'

let g:airline#extensions#ale#enabled = 1
let g:ale_completion_enabled = 1
" let g:ale_elixir_elixir_ls_release = expand('~/.elixir.d/elixir-ls')
let g:ale_php_phpcs_standard = 'PSR12'
let g:ale_php_phpcs_executable = expand('~/.composer/vendor/bin/phpcs')
let g:ale_php_phpcs_use_global = 1
let g:ale_linters = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'javascript': ['eslint', 'tsserver'],
      \   'elixir': ['elixir-ls', 'mix'],
      \}

      " \   'elixir': ['elixir-ls', 'mix', 'credo'],
      " \   'python': ['flake8'],
      " \   'ruby': ['rubocop', 'brakeman'],
      " \   'markdown': [],
      " \   'yaml': ['yamllint'],

let g:ale_fixers = {
      \ 'javascript': ['eslint'],
      \ 'html': ['tidy'],
      \ 'python': ['black'],
      \ 'ruby': ['rubocop'],
      \ 'elixir': ['mix_format'],
      \ }
let g:ale_php_langserver_use_global = 1
let g:ale_php_langserver_executable = expand('~/.composer/vendor/bin/php-language-server.php')

let g:ale_javascript_tsserver_use_global = 1
let g:ale_javascript_eslint_use_global = 1

let test#strategy = "neovim"

" let g:buffergator_viewport_split_policy = "B"
" let g:buffergator_sort_regime = "mru"

let g:vim_markdown_folding_disabled = 1

" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)
let g:SuperTabDefaultCompletionType    = '<C-n>'
" " let g:SuperTabCrMapping                = 0
" " let g:UltiSnipsExpandTrigger           = '<tab>'
" let g:UltiSnipsJumpForwardTrigger      = '<tab>'
" let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'

" nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

nmap <F8> :TagbarToggle<CR>

" nnoremap <F5> :call LanguageClient_contextMenu()<CR>

" " Toggle paste mode
" nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
" imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" format the entire file
nnoremap ff :normal! gg=G``<CR>

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>o :GFiles .<CR>
nnoremap <leader>fc :Commits<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fa :Ag<CR>

let NERDTreeIgnore = ['\.pyc$', '\.retry$']

" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

nmap <silent> // :nohlsearch<CR>
noremap ,hl :set hlsearch! hlsearch?<CR>

" Allows you to enter sudo pass and save the file
" " when you forgot to open your file with sudo
cmap w!! %!sudo tee > /dev/null %

" nnoremap <silent> <bs> <C-w><Left>

" let g:bufExplorerDisableDefaultKeyMapping=1
" let g:bufExplorerShowRelativePath=1

" let g:deoplete#enable_at_startup = 1

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
" imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
" imap <c-x><c-j> <plug>(fzf-complete-file-ag)
" imap <c-x><c-l> <plug>(fzf-complete-line)

" if filereadable(expand("~/.vimrc.after"))
"   source ~/.vimrc.after
" endif

" augroup Common
"   autocmd!
"   autocmd BufEnter * EnableStripWhitespaceOnSave
" augroup END

augroup FileTypeTetect
  autocmd!
  " au BufEnter *.markdown,*.mkd,*.md setl wrap tw=79
  " au BufEnter *.json setl ft=javascript
  " au BufEnter *.coffee setl sw=2 expandtab
  " au BufEnter *.py setl ts=4 sw=4 sts=4
  autocmd BufEnter *.php setlocal ts=4 sw=4 sts=4
  autocmd BufEnter *.java setlocal ts=4 sw=4 sts=4
  autocmd BufNewFile,BufRead *.slim setlocal filetype=slim
  autocmd BufNewFile,BufRead *.slime setlocal filetype=slim
  autocmd BufNewFile,BufRead *.jsh setlocal filetype=java
  " au BufEnter *.js setl ts=2 sw=2 sts=2
  " au BufEnter *.html setl ts=4 sw=4 sts=4
  " au BufEnter *.tex setl wrap tw=79 fo=tcqor
  " au BufEnter *.[ch] setl cindent
  " au BufEnter *.[ch]pp setl cindent
  " au BufEnter Makefile setl ts=4 sts=4 sw=4 noet list
  " au BufEnter *.es6 setf javascript
augroup END

" Open new split for C+hjkl, if split doesnt exist
map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>
function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
    if (t:curwin == winnr())
      if (match(a:key,'[jk]'))
        wincmd v
      else
        wincmd s
      endif
   exec "wincmd ".a:key
  endif
endfunction

" Encodings
set fileencodings=utf-8,cp1251,koi8-r,cp866

set wildmenu
set wcm=<Tab>
menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>
menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
menu Encoding.cp866 :e ++enc=cp866 ++ff=dos<CR>
menu Encoding.utf-8 :e ++enc=utf8 <CR>
menu Encoding.koi8-u :e ++enc=koi8-u ++ff=unix<CR>
map <F8> :emenu Encoding.<TAB>

