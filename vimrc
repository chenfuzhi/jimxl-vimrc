set nocompatible               
filetype off                   

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" 管理vundle插件本身
Plugin 'gmarik/vundle'

" 我的插件

" 1. 操作相关
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-repeat'

" Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-surround'
Plugin 'szw/vim-ctrlspace'
Plugin 'a.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'Lokaltog/vim-easymotion'

" git

Plugin 'tpope/vim-fugitive'

" 2. ui相关
Plugin 'itchyny/lightline.vim'
Plugin 'altercation/vim-colors-solarized'

" vim 对齐显示
Plugin 'nathanaelkane/vim-indent-guides'

" 3. 语言相关
Plugin 'kchmck/vim-coffee-script'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'othree/html5.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
" Plugin 'fatih/vim-go'
Plugin 'plasticboy/vim-markdown'
Plugin 'slim-template/vim-slim.git'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-bundler'

" 语法检查
Plugin 'scrooloose/syntastic'

" 工具
Plugin 'Shougo/vimshell.vim'



call vundle#end()
filetype plugin indent on

syntax enable

"设置语法高亮的配色
if has("gui_running")
    set background=dark
    colorscheme solarized
else
    colorscheme slate
endif


" 实现窗口最大化

if has("gui")
    if has('win32')
        au GUIEnter * simalt ~x
    elseif has("gui_macvim")
        set lines=999 columns=999
    elseif has("gui")
        au GUIEnter * call MaximizeWindow()
    endif
end

function! MaximizeWindow()
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction



" 自动缩进
set autoindent
" set cindent

"" 编码/Encoding
set encoding=utf-8              " 编码
set termencoding=utf-8          " 终端编码
set fileencodings=utf-8,chinese,usc-bom,euc-jp,gb18030,gbk,big5 "文件编码

"" 语言/Language
language messages zh_CN.utf-8   " 输出信息语言
" 中文帮助：vimcdoc, see aur/vimcdoc-svn
set helplang=cn,en              " 帮助语言

"GUI界面里的字体，默认有抗锯齿
if has("mac")
    set guifont=Monaco:h14
else
    set guifont=DejaVu\ Sans\ Mono\ 12
endif

"行间距，如果默认值太小，代码会非常纠结
set linespace=4

"用<>调整缩进时的长度
set shiftwidth=4

"制表符的长度，统一为4个空格的宽度
set tabstop=4

"显示行号
set number

"行号栏的宽度
set numberwidth=4

"禁止自动换行
set nowrap

"在输入命令时列出匹配项目
set wildmenu

"显示光标位置
set ruler

"分割窗口时保持相等的宽/高
set equalalways

"匹配括号的规则，增加针对html的<>
set matchpairs=(:),{:},[:],<:>

"让退格，空格，上下箭头遇到行首行尾时自动移到下一行（包括insert模式）
set whichwrap=b,s,<,>,[,]

"取消自动备份
set nobackup

"保存关闭文件之前保留一个备份
"set writebackup

"设置自定义的<leader>快捷键
let mapleader=","
let g:mapleader=","


"autocmd vimenter * WMToggle

""""""""""""""""""""""""""""""
" NERDTree插件配置
""""""""""""""""""""""""""""""
noremap  <F2> :NERDTreeToggle<cr>
inoremap <F2> <esc>:NERDTreeToggle<cr>

au Filetype nerdtree setlocal nolist

let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index', 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json', '.*\.o$', 'db.db']

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

""""""""""""""""""""""""""""""
" lightline 配置
""""""""""""""""""""""""""""""

let g:lightline = {
      \ 'colorscheme': 'solarized_dark',
      \ }
set laststatus=2

""""""""""""""""""""""""""""""
" ack.vim 配置
""""""""""""""""""""""""""""""
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" 去掉菜单栏和工具栏
set guioptions-=m
set guioptions-=T

" 去掉左边滚动条和右边滚动条
set guioptions-=r
set guioptions-=L

" 高亮当前行
set cursorline

set expandtab
set softtabstop=4
set shiftwidth=4
set showmatch
set incsearch

set winaltkeys=no

filetype plugin on

" map <C-c> "+y
" imap <C-v> <Esc>"+gpa
" map <C-v> "+gp
" map <C-S> :w<CR>
" imap <C-S> <Esc>:w<CR>a

map <C-A> <Home>
imap <C-A> <Home>
map <C-E> <End>
imap <C-E> <End>

" nmap <A-1> :bp<CR>
" imap <A-1> <Esc>:bp<CR>
" nmap <A-2> :bn<CR>
" imap <A-2> <Esc>:bn<CR>

map <F4> <Esc>:A<CR><Esc>
vmap <S-Tab> <Lt>gv
vmap <Tab> >gv

" 默认关闭markdown插件的folding
let g:vim_markdown_folding_disabled=1


" CTRL-Tab is next tab
noremap <C-l> :<C-U>tabnext<CR>
inoremap <C-l> <C-\><C-N>:tabnext<CR>
cnoremap <C-l> <C-C>:tabnext<CR>

" CTRL-SHIFT-Tab is previous tab
noremap <C-H> :<C-U>tabprevious<CR>
inoremap <C-H> <C-\><C-N>:tabprevious<CR>
cnoremap <C-H> <C-C>:tabprevious<CR>

