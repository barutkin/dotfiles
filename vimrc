" Vundle's stuff
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin indent on

Plugin 'gmarik/vundle.git'
Plugin 'jamessan/vim-gnupg'
Plugin 'scrooloose/nerdtree'
Plugin 'wellle/targets.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'euclio/gitignore.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'nanotech/jellybeans.vim'
Plugin 'scrooloose/syntastic'
Plugin 'reedes/vim-lexical'
Plugin 'ervandew/supertab'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'kien/ctrlp.vim'
Plugin 'othree/html5.vim'
Plugin 'tpope/vim-obsession'
Plugin 'christoomey/vim-tmux-navigator'
" Plugin 'lervag/vimtex'

set t_Co=256
colorscheme jellybeans
let g:airline_theme='jellybeans'

set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,cp1251

set number
set relativenumber

" The 'NerdTree' tree style for built-in 'netrw'
let g:netrw_liststyle=3

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

let mapleader=","

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Toggle paste mode
"nmap <silent> <leader>p :set invpaste<CR>:set paste?<CR>

"nmap <C-\> :NERDTreeFind<CR>
nmap <silent> <leader><leader> :NERDTreeToggle<CR>

" Statusline always active
set laststatus=2

" Syntastic stuff
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_c_check_header = 1
let g:syntastic_c_auto_refresh_includes = 1
let g:syntastic_c_compiler = 'gcc'

let g:syntastic_html_checkers = 'tidy'
let g:syntastic_php_checkers = 'phpcs'
let g:syntastic_mode_map = { 'passive_filetypes': ['tex'] }

" Lexical stuff
augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END
let g:lexical#spelllang = ['en_us', 'ru_ru']

" Supertab
let g:SuperTabDefaultCompletionType = 'context'

set wildignore+=*.so,*.swp,*.zip,*.mp3,*.pdf,*.xls,*.odt,*.ods,*.doc,*.docx,*.xlsx

" Indent stuff
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" vimrc auto reload
augroup myvimrc
   au!
   au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

