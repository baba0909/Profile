"#
"# .vimrc
"#

"---------------------------------
" set options
"---------------------------------
set nocompatible " vi
"set ffs=unix " LF(default: unix,dos)
set noinsertmode " 
set wrap " üã
set nolinebreak " 
set formatoptions=q " gq ư
set backspace=1 " Backspace ǽ
"set autoindent " 
set noerrorbells " 
set novisualbell " 
set cmdheight=1 " 
set shortmess=t " 'Press RETURN or enter command to continue' ɽ
set history=50 " 
set number " ɽ
set showmode " 
set wildmenu " ɽ
set wildignore=*.o,*.so " 
set tabstop=4 " 
set shiftwidth=4 " 
set smarttab " 
set noexpandtab " ?
set ruler " ɽ
set showcmd " ɽ
set showmatch " Ūư
"set title " ɽ
set laststatus=2 " ɽ
"set ignorecase " ʸʸ̵
set smartcase " ʸʸʸ
set hlsearch " 
set wrapscan " 
set magic " ɽ magic 
set list " ʸɽ
set listchars=tab:-\ ,extends:< " ʸ (ex. tab:>-,extends:<,trail:-,eol:< )
set keywordprg=man\ -a " (default: man or man\ -s)
set lazyredraw " 
set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%b\ 0x%B\ \ %l,%c%V%8P
" 
set cursorline " ɽ (* vim7)
"set cursorcolumn " (* vim7)
set viminfo='100,f1,<100,:100,@100,/100,!,h
set foldmethod=marker " folding

"---------------------------------
" syntax
"---------------------------------
syntax on
highlight Search ctermbg=Green ctermfg=Black
highlight Error ctermfg=Black


"---------------------------------
" auto encoding (japanese)
"---------------------------------
if &encoding !=# 'utf-8'
set encoding=japan
endif
set fileencoding=japan
if has('iconv')
let s:enc_euc = 'euc-jp'
let s:enc_jis = 'iso-2022-jp'
" iconvJISX0213
if iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
let s:enc_euc = 'euc-jisx0213'
let s:enc_jis = 'iso-2022-jp-3'
endif
" fileencodings
if &encoding ==# 'utf-8'
let s:fileencodings_default = &fileencodings
let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
let &fileencodings = &fileencodings .','. s:fileencodings_default
unlet s:fileencodings_default
else
let &fileencodings = &fileencodings .','. s:enc_jis
set fileencodings+=utf-8,ucs-2le,ucs-2
if &encoding =~# '^euc-\%(jp\|jisx0213\)$'
set fileencodings+=cp932
set fileencodings-=euc-jp
set fileencodings-=euc-jisx0213
let &encoding = s:enc_euc
else
let &fileencodings = &fileencodings .','. s:enc_euc
endif
endif
" ʬ
unlet s:enc_euc
unlet s:enc_jis
endif

" ʸ
if exists('&ambiwidth')
set ambiwidth=double
endif

" Leader 
:let mapleader = " "
"---------------------------------
" plug-ins
"---------------------------------
" for project
:let g:proj_flags = "imstc"
:nmap <silent> <Leader>P <Plug>ToggleProject
:nmap <silent> <Leader>p :Project<CR>


"---------------------------------
" map
"---------------------------------
" ư
map <F2> <ESC>:bp<CR>
map <F3> <ESC>:bn<CR>
map <F4> <ESC>:bw<CR>
" diffsplit no wrapɬ
map <F5> <ESC>:set wrap<CR>
" ʸ
map <F7>e <ESC>:set fileencoding=euc-jp<CR>
map <F7>s <ESC>:set fileencoding=cp932<CR>
map <F7>u <ESC>:set fileencoding=utf8<CR>
map <F7>n <ESC>:set fileformat=unix<CR>
map <F7>r <ESC>:set fileformat=dos<CR>
" ʸľ
map <F8>e <ESC>:e ++enc=euc-jp<CR>
map <F8>s <ESC>:e ++enc=cp932<CR>
map <F8>u <ESC>:e ++enc=utf8<CR>
" Shift-K 
map <F9>m <ESC>:set keywordprg=man\ -a<CR>
map <F9>pm <ESC>:set keywordprg=perldoc<CR>
map <F9>pf <ESC>:set keywordprg=perldoc\ -f<CR>
map <F9>d <ESC>:set keywordprg=dic<CR>
map <F9>j <ESC>:set keywordprg=dic\ -j<CR>
map <F9>e <ESC>:set keywordprg=eword<CR>
" (v/V)
map <F10> :w !trans -d<CR>
" ̵ͭ
map <F11> <ESC>:set mouse=a<CR>
map <F12> <ESC>:set mouse=<CR>
" ư
nnoremap j gj
nnoremap k gk
" ʬư
"map <Right> <c-w>l
"map <Left> <c-w>h
"map <Up> <c-w>k
"map <Down> <c-w>j
" ʬ
map <Right> <c-w>>
map <Left> <c-w><
map <Up> <c-w>-
map <Down> <c-w>+
"map <kPlus> <C-W>+
"map <kMinus> <C-W>-
"map <kDivide> <c-w>< 
"map <kMultiply> <c-w>> 
" grep...?
"map _g :let efsave=&ef<Bar>let &ef=tempname()<Bar>exe ':!grep -n -w "<cword>" * >'.&ef<CR>:cf<CR>:exe ":!rm ".&ef<CR>:let &ef=efsave<Bar>unlet efsave<CR><CR>:cc<CR>

let g:debuggerPort = 21000
