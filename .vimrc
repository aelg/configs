set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
filetype plugin indent on
syntax on
nnoremap ; :
"nnoremap w gg=G:w<CR><c-o><c-o>

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


execute pathogen#infect()


"GHCi integration shim.vim http://www.vim.org/scripts/script.php?script_id=2356
autocmd FileType haskell nmap <C-c><C-l> :GhciRange<CR>
autocmd FileType haskell vmap <C-c><C-l> :GhciRange<CR>
autocmd FileType haskell nmap <C-c><C-f> :GhciFile<CR>
autocmd FileType haskell nmap <C-c><C-r> :GhciReload<CR>
