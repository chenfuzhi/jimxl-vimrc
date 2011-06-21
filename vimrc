"设置语法高亮的配色，在GUI界面里使用我自定义的yytextmate.vim
if has("gui_running")
  colorscheme railscasts
  set lines=1000
  set columns=1000
else
  colorscheme slate
endif


" 实现窗口最大化

if has('win32')
    au GUIEnter * simalt ~x
else
    au GUIEnter * call MaximizeWindow()
endif
 
function! MaximizeWindow()
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction



" 自动缩进
set autoindent
" set cindent

"查找编码的规则（vim7默认都用utf-8，打开包含gbk字符的文件会出现乱码）
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

"GUI界面里的字体，默认有抗锯齿
set guifont=DejaVu\ Sans\ Mono\ 12

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
 
""""""""""""""""""""""""""""""
" bufExplorer插件的设置
""""""""""""""""""""""""""""""
"let g:bufExplorerSortBy='mru'
"let g:bufExplorerSplitRight=0     
"let g:bufExplorerSplitVertical=1
"let g:bufExplorerSplitVertSize = 30 
"let g:bufExplorerUseCurrentWindow=1 
"autocmd BufWinEnter \[Buf\ List\] setl nonumber
 
""""""""""""""""""""""""""""""
" netrw插件的快捷键
""""""""""""""""""""""""""""""
let g:netrw_winsize = 30
nmap <silent> <leader>fe :Sexplore!<cr>
 
""""""""""""""""""""""""""""""
" NERDTree插件的快捷键
""""""""""""""""""""""""""""""
nmap <silent> <leader>nt :NERDTree<cr>

map <C-c> "+y
imap <C-v> <Esc>"+gp
map <C-v> "+gp
map <C-S> :w<CR>
imap <C-S> <Esc>:w<CR>a
map <F8> <Esc>:NERDTree<CR>
imap <F8> <Esc>:NERDTree<CR>

map <C-A> <Home>
imap <C-A> <Home>
map <C-E> <End>
imap <C-E> <End>

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

let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1

filetype plugin on


"nmap <A-f> :FindFile<CR> 
"imap <A-f> <Esc>:FindFile<CR> 
nmap <F5> :FC .<CR> 
imap <F5> :FC .<CR> 

nmap <A-1> :bp<CR>
imap <A-1> <Esc>:bp<CR>
nmap <A-2> :bn<CR>
imap <A-2> <Esc>:bn<CR>
" nmap <C-s> :FindFileSplit<CR>

" 支持coffeescript
call pathogen#runtime_append_all_bundles()
