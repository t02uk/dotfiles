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
set expandtab
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
set noundofile

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
set history=10000

" split
set splitbelow

" color (available?)
set t_Co=65536

" enable project depending vimrc
set exrc
set secure

" isfname (remove equal sign)
set isfname=@,48-57,/,.,-,_,+,,,#,$,%,~

" leader
let mapleader = ' '
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Setting for plugin
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" refresh strength
let c_minlines = 1000

" explorer
let g:explVertical=1
let g:explSplitRight=1

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
let g:quickrun_config = {
            \ '*': {'split': ''},
            \ 'scheme': { 'command': 'gosh'}}

" NERDTree
nnoremap <C-t>t :NERDTreeToggle<CR>
let g:NERDTreeDirArrows = 0
nnoremap g: :e ./**/

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" file type based setting
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" ruby
autocmd BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
" coffee
au BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee
" gitv
autocmd FileType git :setlocal foldlevel=99

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
"" dein
"" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if &compatible
  set nocompatible
endif

if has('mac')
  set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
else
  set runtimepath+=~\.cache\dein.vim\
endif

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('Shougo/vimproc.vim', {
      \ 'build': {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin'  : 'make -f make_cygwin.mak',
      \     'mac'     : 'make -f make_mac.mak',
      \     'linux'   : 'make',
      \     'unix'    : 'gmake',
      \    },
      \ })

  call dein#add('Shougo/vimshell.vim.git')
  " call dein#add('dag/vim2hs.git')
  " call dein#add('eagletmt/ghcmod-vim.git')
  " call dein#add('eagletmt/unite-haddock.git')
  " call dein#add('jiangmiao/simple-javascript-indenter.git')
  " call dein#add('jpo/vim-railscasts-theme.git')
  " call dein#add('kana/vim-smartchr.git')
  call dein#add('scrooloose/nerdtree')
  call dein#add('t02uk/midori')
  call dein#add('t02uk/tabdetect.git')
  " call dein#add('teramako/jscomplete-vim.git')
  call dein#add('thinca/vim-quickrun.git')
  " call dein#add('tpope/vim-rails.git')
  " call dein#add('tpope/vim-repeat.git')
  call dein#add('tpope/vim-surround.git')
  " call dein#add('ujihisa/neco-ghc.git')
  call dein#add('vim-jp/vimdoc-ja.git')
  " call dein#add('vim-scripts/jQuery.git')
  call dein#add('tpope/vim-fugitive')
  call dein#add('vim-scripts/renamer.vim.git')
  call dein#add('tpope/vim-dispatch.git')
  " call dein#add('thoughtbot/vim-rspec.git')
  " call dein#add('othree/html5.vim.git')
  " call dein#add('Shougo/unite.vim.git')
  " call dein#add('ujihisa/unite-locate.git')
  " call dein#add('koron/codic-vim.git')
  " call dein#add('rhysd/unite-codic.vim.git')
  call dein#add('vim-scripts/DirDiff.vim.git')
  " call dein#add('kchmck/vim-coffee-script.git')
  " call dein#add('thinca/vim-ref')
  " call dein#add('taka84u9/vim-ref-ri')
  call dein#add('gregsexton/gitv.git')
  call dein#add('nathanaelkane/vim-indent-guides')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" color scheme
colorscheme midori
" prevent from destroying my vimrc by example_vimrc*
let g:no_gvimrc_example = 1


"" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
"" Spell
"" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
fun! s:SpellConf()
  redir! => syntax
  silent syntax
  redir END

  set spell

  if syntax =~? '/<comment\>'
    syntax spell default
    syntax match SpellNotAscii /\<\A\+\>/ contains=@NoSpell transparent containedin=Comment contained
    syntax match SpellMaybeCode /\<\h\l*[_A-Z]\h\{-}\>/ contains=@NoSpell transparent containedin=Comment contained
  else
    syntax spell toplevel
    syntax match SpellNotAscii /\<\A\+\>/ contains=@NoSpell transparent
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


