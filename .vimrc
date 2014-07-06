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

"list
set list
set listchars=tab:>-,trail:-,extends:>

" and show invisible characters
syntax match InvisibleJISX0208Space "?@" display containedin=ALL
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
set history=65536

" split
set splitbelow

" color (available?)
set t_Co=65536

" enable project depending vimrc
set exrc
set secure
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

" NERDTree
nnoremap <C-t>t :NERDTreeToggle<CR>
let g:NERDTreeDirArrows = 0
nnoremap g: :e ./**/

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" file type based setting
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" ruby
autocmd BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
" coffee
au BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee

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
endfunc 

func! Lcontext() 
    if (winline() == winheight(0) && line(".") != line("$")) 
        exe "normal! \<pagedown>L" 
    else 
        exe "normal! L" 
    endif 
endfunc


" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" built-in plug-in
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
source $VIMRUNTIME/macros/matchit.vim

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" char code
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

set encoding=utf-8
set fileencodings=utf-8,cp-932,euc-jp
set fileencoding=utf-8
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
"" clipboard
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

"" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
"" neobundle
"" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'git://github.com/Shougo/vimshell.vim.git'
NeoBundle 'git://github.com/cakebaker/scss-syntax.vim.git'
NeoBundle 'git://github.com/dag/vim2hs.git'
NeoBundle 'git://github.com/eagletmt/ghcmod-vim.git'
NeoBundle 'git://github.com/eagletmt/unite-haddock.git'
NeoBundle 'git://github.com/hail2u/vim-css3-syntax.git'
NeoBundle 'git://github.com/jelera/vim-javascript-syntax.git'
NeoBundle 'git://github.com/jiangmiao/simple-javascript-indenter.git'
NeoBundle 'git://github.com/jpo/vim-railscasts-theme.git'
NeoBundle 'git://github.com/kana/vim-smartchr.git'
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
NeoBundle 'git://github.com/vim-jp/vimdoc-ja.git'
NeoBundle 'git://github.com/vim-scripts/jQuery.git'
NeoBundle 'git://github.com/tpope/vim-fugitive'
NeoBundle 'git://github.com/vim-scripts/renamer.vim.git'
NeoBundle 'git://github.com/tpope/vim-dispatch.git'
NeoBundle 'git://github.com/thoughtbot/vim-rspec.git'
NeoBundle 'git://github.com/othree/html5.vim.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/ujihisa/unite-locate.git'
NeoBundle 'git://github.com/koron/codic-vim.git'
NeoBundle 'git://github.com/rhysd/unite-codic.vim.git'
NeoBundle 'git://github.com/vim-scripts/DirDiff.vim.git'
NeoBundle 'git://github.com/kchmck/vim-coffee-script.git'
NeoBundle 'git://github.com/thinca/vim-ref'
NeoBundle 'git://github.com/taka84u9/vim-ref-ri'
NeoBundle 'git://github.com/gregsexton/gitv.git'

let g:rspec_command = "Dispatch rspec {spec}"

filetype plugin on
filetype indent on

" color scheme
colorscheme midori
" prevent from destroying my vimrc by example_vimrc*
let g:no_gvimrc_example = 1


"" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
"" Spell
"" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
set spelllang=en,cjk
fun! s:SpellConf()
  redir! => syntax
  silent syntax
  redir END

  set spell

  if syntax =~? '\<comment\>'
    syntax spell default
    syntax match SpellMaybeCode /\<\h\l*[_A-Z]\h\{-}\>/ contains=@NoSpell transparent containedin=Comment contained
  else
    syntax spell toplevel
    syntax match SpellMaybeCode /\<\h\l*[_A-Z]\h\{-}\>/ contains=@NoSpell transparent
  endif

  syntax cluster Spell add=SpellNotAscii,SpellMaybeCode
endfunc

augroup spell_check
  autocmd!
  autocmd BufReadPost,BufNewFile,Syntax * call s:SpellConf()
augroup END



"" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
"" Et
"" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
"" restore the cursor position when file activated
au BufReadPost *
     \ if line("'\"") > 1 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
