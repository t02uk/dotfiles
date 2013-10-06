" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Key Bindings
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" adjust screen on cursor moving
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" like PgDn/PgUp moving
nnoremap <silent> H :cal Hcontext() <CR>
nnoremap <silent> L :cal Lcontext() <CR>

" setting for cursor moving like emacs on command mode
cnoremap <c-f> <right>
cnoremap <c-b> <left>
cnoremap <c-a> <home>
cnoremap <c-d> <del>
cnoremap <c-e> <end>

" word based search
nnoremap <silent> 1/ /\<\><Left><Left>

" switch buffer
nnoremap <silent> <C-n> :bn<CR>
nnoremap <silent> <C-p> :bp<CR>

" toggle) pseudo ScrollLock and some key-bindings for browsing one handed
nnoremap <silent> 1j :let &scrolloff=999-&scrolloff<CR>
nnoremap <silent> <expr> u &scrolloff>=999 ? "<C-u>" : "u"
nnoremap <silent> <expr> d &scrolloff>=999 ? "<C-d>" : "d"
nnoremap <silent> <expr> f &scrolloff>=999 ? "<C-f>" : "f"
nnoremap <silent> <expr> b &scrolloff>=999 ? "<C-b>" : "b"
nnoremap <silent> <expr> <Space> &scrolloff>=999 ? "<C-f>" : "<Space>"
nnoremap <silent> <expr> q &scrolloff>=999 ? ":let &scrolloff=0<CR>" : "q"

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" setting for built-in configuration
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" displaying
set linespace=0
set number
set nocompatible
set tabstop=4
set shiftwidth=4
set showmatch
" set expandtab
set numberwidth=6
set autoindent
set backspace=2
set wrapscan
set wildmenu
set formatoptions+=mM
set showcmd

" backup
set updatecount=0
set nobackup

" function
set cpo-=<
filetype plugin indent on

"ctags
set tags=tags

" omni complete
set completeopt=menuone,preview

" spell
syntax on
set spell
syntax cluster comment contains=@Spell

"list
set list
set listchars=tab:>-,trail:-,extends:>

" and show invisible characters
syntax match InvisibleJISX0208Space "　" display containedin=ALL
syntax match InvisibleTrailedSpace "[ \t]\+$" display containedin=ALL
syntax match InvisibleTab "\t" display containedin=ALL

" search
set incsearch
set ignorecase
set smartcase
set hlsearch

" status
set statusline=#%n\ %f%m%r%h%w\ -\ [%l,\%v\ /\ %L,%{strlen(getline(\'.\'))}]%=\|%{&ff},\ %{&fileencoding},\ %Y\ 

set laststatus=2

" split
set splitbelow

" color
set t_Co=65536
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Setting for plugin
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" refresh strength
let c_minlines = 1000

" explorer
let g:explVertical=1
let g:explSplitRight=1

" leader
" let mapleader = " "

" simple js indenter
let g:SimpleJsIndenter_CaseIndentLevel = -1
let g:SimpleJsIndenter_BriefMode = 1

" js complete
let g:jscomplete_use = ['dom']

" syntastic
let g:syntastic_javascript_jslint_conf = "--white --undef --nomen --regexp --plusplus --bitwise --newcap --sloppy --vars"
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': ['ruby', 'javascript'],
                           \ 'passive_filetypes': [] }

" quick run
let g:quickrun_config={'*': {'split': ''}}

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" file type based setting
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" ruby
autocmd BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" tiny but usefull functions
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" extend normal mode HL
func! Hcontext() 
    if (winline() == 1 && line(".") != 1) 
        exe "normal! \<pageup>H" 
    else 
        exe "normal! H" 
    endif 
    echo '' 
endfunc 

func! Lcontext() 
    if (winline() == winheight(0) && line(".") != line("$")) 
        exe "normal! \<pagedown>L" 
    else 
        exe "normal! L" 
    endif 
    echo '' 
endfunc


" word count
function! s:CountChar(first, last)
  let i = a:first
  let sum = 0
  while i <= a:last
    "echo "line: " . i
    let sum = sum + strlen(substitute(getline(i), '.', ' ', 'g'))
    let i = i + 1
  endwhile
  return sum
endfunction
command! -range=% CountChar :echo "Count of characters: " . <SID>CountChar(<line1>, <line2>)
command! -range=% CC :echo "Count of characters: " . <SID>CountChar(<line1>, <line2>)


" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" char code
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  unlet s:enc_euc
  unlet s:enc_jis
endif
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
set fileformats=unix,dos,mac
if exists('&ambiwidth')
  set ambiwidth=double
endif


" ime setting
if has('multi_byte_ime')
  set iminsert=1
  set imsearch=1
  inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

"" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
"" neovundle
"" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" reference
" http://subtech.g.hatena.ne.jp/cho45/20061010/1160459376
" http://vim.wikia.com/wiki/Mac_OS_X_clipboard_sharing
"
" need 'set enc=utf-8' and
" below shell environment variable for UTF-8 characters
" export __CF_USER_TEXT_ENCODING='0x1F5:0x08000100:14'
"
" Vim(Mac)
"if ('mac') && !has('gui')
if !has('gui')
    nnoremap <silent> <Space>y :.w !pbcopy<CR><CR>
    vnoremap <silent> <Space>y :w !pbcopy<CR><CR>
    nnoremap <silent> <Space>p :r !pbpaste<CR>
    vnoremap <silent> <Space>p :r !pbpaste<CR>
" GVim(Mac & Win)
else
    noremap <Space>y "+y
    noremap <Space>p "+p
endif

nnoremap <C-t>t :NERDTreeToggle<CR>
nnoremap g: :e ./**/
"" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
"" neovundle
"" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/altercation/vim-colors-solarized.git'
NeoBundle 'git://github.com/cakebaker/scss-syntax.vim.git'
NeoBundle 'git://github.com/dag/vim2hs.git'
NeoBundle 'git://github.com/eagletmt/ghcmod-vim.git'
NeoBundle 'git://github.com/eagletmt/unite-haddock.git'
NeoBundle 'git://github.com/hail2u/vim-css3-syntax.git'
NeoBundle 'git://github.com/jelera/vim-javascript-syntax.git'
NeoBundle 'git://github.com/jiangmiao/simple-javascript-indenter.git'
NeoBundle 'git://github.com/jpo/vim-railscasts-theme.git'
NeoBundle 'git://github.com/kana/vim-smartchr.git'
NeoBundle 'git://github.com/mattn/gist-vim.git'
NeoBundle 'git://github.com/mattn/zencoding-vim.git'
NeoBundle 'git://github.com/scrooloose/nerdtree'
NeoBundle 'git://github.com/scrooloose/syntastic'
NeoBundle 'git://github.com/t02uk/midori'
NeoBundle 'git://github.com/t02uk/tabdetect.git'
NeoBundle 'git://github.com/teramako/jscomplete-vim.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
NeoBundle 'git://github.com/tpope/vim-rails.git'
NeoBundle 'git://github.com/tpope/vim-repeat.git'
NeoBundle 'git://github.com/tpope/vim-surround.git'
NeoBundle 'git://github.com/ujihisa/neco-ghc.git'
NeoBundle 'git://github.com/ujihisa/vimshell-ssh.git'
NeoBundle 'git://github.com/vim-jp/vimdoc-ja.git'
NeoBundle 'git://github.com/vim-scripts/jQuery.git'
NeoBundle 'git://github.com/tpope/vim-fugitive'

filetype plugin on
filetype indent on

" color scheme
colorscheme midori
" prevent from destroying my vimrc by example_vimrc*
let g:no_gvimrc_example = 1
