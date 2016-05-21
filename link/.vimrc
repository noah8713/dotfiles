set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" " required! 
Bundle 'gmarik/vundle'

" Plugin
Bundle 'unicell/winmanager'
Bundle 'bufexplorer.zip'
" A tree explorer plugin for navigating the filesystem
Bundle 'The-NERD-tree'
" C/C++ IDE -- Write and run programs. Insert statements, idioms, comments etc.
Bundle 'c.vim'
" C/C++ and Java code completion
Bundle 'cppcomplete'
" Do all your insert-mode completion with Tab.
" Bundle 'SuperTab-continued.'
Bundle 'ervandew/supertab'
" comment lines in a program
" Bundle 'EnhCommentify.vim'
" Vim plugin for intensely orgasmic commenting
Bundle 'scrooloose/nerdcommenter'
" extended % matching for HTML, LaTeX, and many other languages
Bundle 'matchit.zip'
" cscope keyboard mappings for VIM
Bundle 'chazy/cscope_maps'
" Source code browser (supports C/C++, java, perl, python, tcl, sql, php, etc)
Bundle 'taglist.vim'
" Class outline viewer
Bundle 'majutsushi/tagbar'
" The ultimate statusline/prompt utility.
Bundle 'Lokaltog/powerline'

" A set of menus/shortcuts to work with Python files
Bundle 'python.vim'
" Enhanced version of the python syntax highlighting script
" Bundle 'python.vim--Vasiliev'
" Displays Python class, method or function the cursor is in on the status line
Bundle 'pythonhelper'
" TextMate-style snippets for Vim
" Bundle 'snipMate'
" The ultimate snippet solution for python enabled Vim.
" Bundle 'UltiSnips'
" Bundle 'MarcWeber/ultisnips'
Bundle 'SirVer/ultisnips'
Bundle "honza/vim-snippets"
" Tab-complete your Python code
" Bundle 'Pydiction'
" managing and writing reStructuredText Documents.
Bundle 'Rykka/riv.vim'
" Puppet niceties for your Vim setup
Bundle 'rodjek/vim-puppet'
" Syntax checking hacks for vim
Bundle 'scrooloose/syntastic'
" Go
Bundle 'fatih/vim-go'
" Salt
Bundle 'saltstack/salt-vim'
" Jinja2
Bundle "Glench/Vim-Jinja2-Syntax"

" Alternate Files quickly (.c --> .h etc)
" Bundle 'a.vim'
" ansi escape sequences concealed, but highlighted as specified (conceal)
" Bundle 'AnsiEsc.vim'
" Some utilities used by several of my scripts (window positioning, mark handling)
" Bundle 'cecutil'
" a Source code Explorer which works like the context window of "Source Insight"
" Bundle 'SrcExpl'
" A plugin that allows for easy commenting of code for many filetypes.
" Bundle 'The-NERD-Commenter'

" Color
" Bundle 'darkburn'
" Bundle 'desert.vim'
" Bundle 'desert256.vim'
" Bundle 'freya'
" Bundle 'inkpot'
" Bundle 'jellybeans.vim'
" Bundle 'Lucius'
" Bundle 'midnight2.vim'
" Bundle 'molokai'
" Bundle 'moria'
" Bundle 'oceandeep'
" Bundle 'peaksea'
" Bundle 'wombat256.vim'
" Bundle 'Zenburn'
Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on     " required!

function Toggle_List()
    if 1 == &list
        execute "set nolist"
    else
        execute "set list"
    endif
endfunction

function Toggle_Number()
    if 1 == &number
        execute "set nonu"
    else
        execute "set nu"
    endif
endfunction

function Toggle_Wrap()
    if 1 == &wrap
        execute "set nowrap"
    else
        execute "set wrap"
    endif
endfunction

function Toggle_WinManager()
    if IsWinManagerVisible()
        execute "WMToggle"
    else
        execute "WMToggle"
        " execute "q"
    endif
endfunction

let NERDTreeIgnore = ['\.o$', '\.pyc$', '^cscope', 'tags']

let g:NERDTree_title="[NERDTree]"
" let g:winManagerWindowLayout="NERDTree|BufExplorer,TagList"
" let g:winManagerWindowLayout="TagList,BufExplorer"
let g:winManagerWindowLayout="NERDTree|BufExplorer"

let g:tagbar_left=1
let g:tagbar_foldlevel = 2
let g:tagbar_zoomwidth = 0

function! NERDTree_Start()
    exec 'NERDTree'
    if !exists("s:std_in") && 0 == argc()
        NERDTree
    end
endfunction

function! NERDTree_IsValid()
    return 1
endfunction

let tlist_make_settings  = 'make;m:makros;t:targets'
let tlist_qmake_settings = 'qmake;t:SystemVariables'
" let g:Tlist_WinWidth = 40

if has("autocmd")
  " ----------  qmake : set file type for *.pro  ----------
  autocmd BufNewFile,BufRead *.pro  set filetype=qmake
endif " has("autocmd")

let g:C_AuthorName      = 'Qiu Yu'
let g:C_AuthorRef       = 'yqiu'
let g:C_Email           = 'unicell@gmail.com'
let g:C_Company         = 'http://www.unicell.info'
let g:EnhCommentifyRespectIndent = 'yes'
let g:EnhCommentifyPretty        = 'yes'
let g:EnhCommentifyAlignRight    = 'yes'
let g:EnhCommentifyTraditionalMode = 'no'
let g:EnhCommentifyFirstLineMode = 'yes'

syntax on
filetype plugin on

set nu
set expandtab
set softtabstop=4
set cindent shiftwidth=4
" let c_syntax_for_h=1
set vb t_vb=
set showcmd
set ai
set hls
set incsearch
set ruler
" set nobackup
" set bdir=~/temp

set t_Co=256
" color wombat256mod

" solarized options 
set background=dark
" set background=light
let g:solarized_termcolors = 256
let g:solarized_visibility = "low"
let g:solarized_contrast = "low"
colorscheme solarized

" colorscheme peachpuff

" 0: 'None'
" 1: 'Sections'
" 2: 'Sections and Lists'
" 3: 'Sections,Lists and Blocks'.(default)
let g:riv_fold_level = 0
let g:riv_fold_auto_update = 0
" '.' : below current line.
" '$' : append at end of file. (default)
let g:riv_create_link_pos = '.'

let g:SuperTabDefaultCompletionType = "<c-n>"

let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

" set fileencoding=gb18030
" set fileencodings=utf-8,gb18030,utf-16,big5

" multi-encoding setting
if has("multi_byte")
"set bomb
set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,latin1

" CJK environment detection and corresponding setting
if v:lang =~ "^zh_CN"
" Use cp936 to support GBK, euc-cn == gb2312
set encoding=cp936
set termencoding=cp936
set fileencoding=cp936
elseif v:lang =~ "^zh_TW"
" cp950, big5 or euc-tw
" Are they equal to each other?
set encoding=big5
set termencoding=big5
set fileencoding=big5
elseif v:lang =~ "^ko"
" Copied from someone's dotfile, untested
set encoding=euc-kr
set termencoding=euc-kr
set fileencoding=euc-kr
elseif v:lang =~ "^ja_JP"
" Copied from someone's dotfile, untested
set encoding=euc-jp
set termencoding=euc-jp
set fileencoding=euc-jp
endif

" Detect UTF-8 locale, and replace CJK setting if needed
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
endif
else
echoerr "Sorry, this version of (g)vim was not compiled with multi_byte"
endif

let mapleader=","
nnoremap <silent> <leader>l <Esc><Esc>:call Toggle_List()<CR>
nnoremap <silent> <leader>n <Esc><Esc>:call Toggle_Number()<CR>
nnoremap <silent> <leader>t <Esc><Esc>:Tlist<CR>
nnoremap <silent> <leader>b <Esc><Esc>:TagbarToggle<CR>
nnoremap <silent> <leader>w <Esc><Esc>:call Toggle_WinManager()<CR>
nnoremap <silent> <leader>r <Esc><Esc>:call Toggle_Wrap()<CR>

nnoremap <silent> <Leader>, :wincmd _<CR>
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 100)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 1/100)<CR>
:nnoremap <silent> <Leader><Leader> :wincmd _<CR>

nmap <C-j> :wincmd j<CR>
nmap <C-k> :wincmd k<CR>
nmap <C-h> :wincmd h<CR>
nmap <C-l> :wincmd l<CR>
nmap <C-w><Left> :tabp<CR>
nmap <C-w><Right> :tabn<CR>

" set winminheight=0
set noea

" noremap <silent> <F11>  <Esc><Esc>:Tlist<CR>
" inoremap <silent> <F11>  <Esc><Esc>:Tlist<CR>
" noremap <silent> <F4>  <Esc><Esc>:WMToggle<CR>
" inoremap <silent> <F4>  <Esc><Esc>:WMToggle<CR>
" noremap <silent> <F2>   <Esc><Esc>:call Toggle_List()<CR>
" inoremap <silent> <F2>   <Esc><Esc>:call Toggle_List()<CR>
" noremap <silent> <F3>   <Esc><Esc>:call Toggle_Number()<CR>
" inoremap <silent> <F3>   <Esc><Esc>:call Toggle_Number()<CR>
" noremap <silent> <F6>   <Esc><Esc>:call Toggle_Wrap()<CR>
" inoremap <silent> <F6>   <Esc><Esc>:call Toggle_Wrap()<CR>

map <Space> W
map <Right> zl
map <Left> zh
map <Down> <C-e>
map <Up> <C-y>

" highlight WhitespaceEOL ctermbg=red guibg=red
" match WhitespaceEOL /\s\+$/

if $ANDROID_BUILD_TOP != ""
    set path=.,$ANDROID_BUILD_TOP/bionic/libc/include
    set path+=$ANDROID_BUILD_TOP/bionic/libstd++/include
    set path+=$ANDROID_BUILD_TOP/bionic/libm/include
    set path+=$ANDROID_BUILD_TOP/frameworks/base/include
    set path+=$ANDROID_BUILD_TOP/system/core/include
    set path+=$ANDROID_BUILD_TOP/external/skia/include
    if $PWD =~ $ANDROID_BUILD_TOP && $PWD !~ $ANDROID_BUILD_TOP . '/kernel'
        se tabstop=4
        se shiftwidth=4
        se expandtab
    endif
endif

let g:syntastic_check_on_open = 1
"let g:go_fmt_command = "goimports"
"let g:syntastic_go_checkers = ['go', 'golint', 'govet']

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

autocmd FileType puppet set shiftwidth=2 

set nocscopeverbose
set nocompatible
