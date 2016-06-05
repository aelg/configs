set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
filetype plugin indent on
syntax on
nnoremap ; :
"nnoremap w gg=G:w<CR><c-o><c-o>

set number
set relativenumber

set spelllang=en_US

colorscheme desert

map <silent> <Up> gk
imap <silent> <Up> <C-o>gk
map <silent> <Down> gj
imap <silent> <Down> <C-o>gj
map <silent> <home> g<home>
imap <silent> <home> <C-o>g<home>
map <silent> <End> g<End>
imap <silent> <End> <C-o>g<End>

set fileencodings=utf-8,latin1

"Save on F2

nmap <F2> :update<CR>
vmap <F2> <Esc><F2>gv
imap <F2> <c-o><F2>

"Autosave 
:au FocusLost * silent! wa
:set autowriteall

" Navigating windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Build and run C program with <F8>
map <F8> :w <CR> :!gcc % -o %< && ./%< <CR>

"Build and run haskell program with <F5>
map <F5> :w <CR> :!ghc % -o %< && ./%< <CR>

" shvim.vim
autocmd FileType haskell nmap <C-c><C-l> :GhciRange<CR>
autocmd FileType haskell vmap <C-c><C-l> :GhciRange<CR>
autocmd FileType haskell nmap <C-c><C-f> :GhciFile<CR>
autocmd FileType haskell nmap <C-c><C-r> :GhciReload<CR>

" From http://www.stephendiehl.com/posts/vim_2016.html
" plugins
"
" $ mkdir -p ~/.vim/autoload ~/.vim/bundle
" $ curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
" $ cd ~/.vim/bundle
"
" $ git clone https://github.com/eagletmt/ghcmod-vim.git
" $ git clone https://github.com/eagletmt/neco-ghc
" $ git clone https://github.com/ctrlpvim/ctrlp.vim.git
" $ git clone https://github.com/scrooloose/syntastic.git
" $ git clone https://github.com/tomtom/tlib_vim.git
" $ git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
" $ git clone https://github.com/garbas/vim-snipmate.git
" $ git clone https://github.com/scrooloose/nerdtree.git
" $ git clone https://github.com/scrooloose/nerdcommenter.git
" $ git clone https://github.com/godlygeek/tabular.git
" $ git clone https://github.com/ervandew/supertab.git
" $ git clone https://github.com/Shougo/neocomplete.vim.git
"
" $ git clone https://github.com/Shougo/vimproc.vim.git
" $ cd vimproc.vim
" $ make

set nocompatible
set wrap
set showmode
set tw=0
set smartcase
set smarttab
set smartindent
set autoindent
set incsearch
set mouse=a
set history=1000
set clipboard=unnamedplus,autoselect

set completeopt=menuone,menu,longest

set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
set completeopt+=longest

set t_Co=256

set cmdheight=1

execute pathogen#infect()

" syntastic 
map <Leader>s :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" ghc-mod
map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

" supertab
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

"nerdtree
map <Leader>n :NERDTreeToggle<CR>

"tabularize
let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>

"ctrl-p
map <silent> <Leader>t :CtrlP()<CR>
noremap <leader>b<space> :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = '\v[\/]dist$'
