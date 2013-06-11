set nocompatible               
filetype off                   

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" 管理vundle插件本身
Bundle 'gmarik/vundle'

" 我的插件
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-rails'
Bundle 'nsf/gocode'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Lokaltog/vim-powerline'
Bundle 'jpo/vim-railscasts-theme'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimshell'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'kchmck/vim-coffee-script'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'othree/html5.vim'
Bundle 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'
Bundle 'a.vim'
Bundle 'taglist.vim'

filetype plugin indent on


"设置语法高亮的配色，在GUI界面里使用我自定义的yytextmate.vim
if has("gui_running")
  colorscheme railscasts
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

""""""""""""""""""""""""""""""
" taglist 插件的设置
""""""""""""""""""""""""""""""
if has('mac')
  let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
endif

" 不同时显示多个文件的 tag ，只显示当前文件的
let Tlist_Show_One_File=1
 
" 如果 taglist 窗口是最后一个窗口，则退出 vim
let Tlist_Exit_OnlyWindow=1
 
"让当前不被编辑的文件的方法列表自动折叠起来 
let Tlist_File_Fold_Auto_Close=1
 
"不显示taglist菜单
let Tlist_Show_Menu=0

let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口 

let Tlist_WinHeight = 20
noremap  <F3> :TlistToggle<cr>
inoremap <F3> <esc>:TlistToggle<cr>


"autocmd vimenter * WMToggle

""""""""""""""""""""""""""""""
" netrw插件的快捷键
""""""""""""""""""""""""""""""
let g:netrw_winsize = 30
nmap <silent> <leader>fe :Sexplore!<cr>
 
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
" Powerline 配置
""""""""""""""""""""""""""""""
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs

""""""""""""""""""""""""""""""
" ack.vim 配置
""""""""""""""""""""""""""""""
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

""""""""""""""""""""""""""""""
" neocomplcache 配置
""""""""""""""""""""""""""""""
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'



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

map <C-c> "+y
imap <C-v> <Esc>"+gpa
map <C-v> "+gp
map <C-S> :w<CR>
imap <C-S> <Esc>:w<CR>a

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
nmap <F9> <Esc>:!ctags -R *<CR>
