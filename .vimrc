" An example for a vimrc file.
"
" Maintainer:	  Xi Wang
" Reference from: Bram Moolenaar <Bram@vim.org>
" Last change:	  2017 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif
if(has("win32") || has("win95") || has("win64") || has("win16")) "判定当前操作系统类型
    let g:iswindows=1
else
    let g:iswindows=0
endif
"""""""""""""""""""""""""""""插件管理Vundle""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
"Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'majutsushi/tagbar'
Plugin 'taglist.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'minibufexpl.vim'
"Plugin 'vimwiki/vimwiki'
"Plugin 'TaskList.vim'
"Plugin 'Tabular.vim'
"Plugin 'sessionman.vim'
"Plugin 'sjl/gundo.vim'
"snipmate 代码片段补全 用法待查
 "Plugin 'MarcWeber/vim-addon-mw-utils'
 "Plugin 'tomtom/tlib_vim'
 "Plugin 'garbas/vim-snipmate'
  " Optional:
 "Plugin 'honza/vim-snippets'
"说明、注释、代码块插入
Plugin 'vim-scripts/c.vim'
".c->.h
Plugin 'a.vim'
"代码自动补全
"Plugin 'Valloric/YouCompleteMe'
Plugin 'OmniCppComplete'
Plugin 'AutoComplPop'

" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'

" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
""""""""""""""""""""""""""""""""""""""""""""""""
"let mapleader = "," ""
"let g:mapleader = "," ""设置 leader 为',',默认为„\‟
"""""""""""""""""""""""""""""配置多语言环境——编码设置""""""""""""""""""""
if has("multi_byte")
" UTF-8 编码 enc(encoding), fenc(fileencoding)和fencs(fileencodings)
set encoding=utf-8 "Vim 内部使用的字符编码方式 设置为utf-8时，Vim自动探测文件的编码方式会更准确
"set fileencoding=utf-8 "Vim 中当前编辑的文件的字符编码方式,并以此方式保存
set termencoding=utf-8 "Vim 所工作的终端 (或者 Windows 的 Console 窗口) 的字符编码方式
" Vim自动探测fileencoding的顺序列表
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1
set formatoptions+=mM
if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
set ambiwidth=double
endif
if has("win32")
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8
endif
else
echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif
"""""""""""""""""""""""""""""常规设置""""""""""""""""""""""""""""""""""
"set noswapfile "不使用swp文件，注意，错误退出后无法恢复
set nowb
set nobackup "不生成备份文件
"set backup "生成备份文件
let &rtp=&rtp.',/home/kxdjt/work' "目录加进Vim的runtimepath中（:h 'rtp'），只有这样:h命令才找得到你的文档
set sessionoptions-=curdir  "会话设置，session所在目录自动成为当前目录
set sessionoptions+=sesdir  "会话设置，session所在目录自动成为当前目录
set noerrorbells " 关闭错误信息响铃
set novisualbell " 关闭使用可视响铃代替呼叫
set vb t_vb= " 置空错误铃声的终端代码
set mouse=a "允许鼠标的使用
set showmatch "插入括号时，短暂地跳转到匹配的对应括号
"set matchtime=2 "短暂跳转到匹配括号的时间
set wildmenu "增强模式中的命令行自动完成操作
set magic   "控制部分正则表达式的元字符是否加反斜杠 :h magic
set hidden        "允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set incsearch     "增量搜索高亮
"set hlsearch     "搜索结果高亮
set ignorecase    "搜索忽略大小写
"set showcmd      "显示命令
set history=100   "vim记住的历史操作的数量，默认的是20
"set autoread     "当文件在外部被修改时，自动重新读取
"set autowrite    "在切换buffer时自动保存当前文件
"set autochdir    "自动切换当前目录为当前文件所在的目录
"nocompatible已在Vundle配置中设置
"set nocompatible "不要 vim 模仿 vi 模式,建议设置,否则会有很多不兼容的问题
filetype plugin indent on
"filetype on "命令打开文件类型检测功能，它相当于文件类型检测功能的开关
"filetype plugin on "在runtimepath中搜索文件类型插件
"filetype indent on "允许vim为不同类型的文件定义不同的缩进格式
""""""""""""""""""""""""""""""显示设置"""""""""""""""""""""
"字体的设置
set guifont=Courier\ 10\ Pitch\ 12 ""记住空格用下划线代替哦
set gfw=幼圆:h10:cGB2312

"Color 配色方案
"set t_Co=256   "256色
set background=dark "light
"colorscheme solarized
colorscheme molokai
"colorscheme mine1 "配色方案
"colorscheme desert
"Gvim config
if has("gui_running")
   "colorscheme solarized
   colorscheme molokai
   "set guioptions-=T "隐藏工具栏
   "set guioptions-=m "隐藏菜单栏
   set guioptions = aegic
endif
" 默认编辑器配色
"au BufNewFile,BufRead,BufEnter,WinEnter * colo molokai
" 各不同类型的文件配色不同
"au BufNewFile,BufRead,BufEnter,WinEnter *.wiki colo moria
" 以下是颜色设定，详细请 :h hi
"hi Comment      term=bold ctermfg=darkcyan
"hi Constant     term=underline ctermfg=Red
"hi Special      term=bold ctermfg=Magenta
"hi Identifier   term=underline ctermfg=cyan
"hi Statement    term=bold ctermfg=Brown
"hi PreProc      term=bold ctermfg=DarkYellow
"hi Type         term=bold ctermfg=DarkGreen
"hi Ignore       ctermfg=white
"hi Error        term=reverse ctermbg=Red ctermfg=White
"hi Todo         term=standout ctermbg=Yellow ctermfg=Red
"hi Search       term=standout ctermbg=Yellow ctermfg=Black
"hi ErrorMsg     term=reverse ctermbg=Red ctermfg=White
"hi StatusLine   ctermfg=darkblue  ctermbg=gray
"hi StatusLineNC ctermfg=brown   ctermbg=darkblue

"hi Comment      guifg=DarkBlue
"hi Constant     gui=bold guifg=Magenta guibg=#fffff5f2eed8
"hi Special      guifg=Blue guibg=#fffff5f2eed8
"hi Identifier   gui=bold guifg=DarkCyan
"hi Statement    gui=bold guifg=brown
"hi PreProc      gui=bold guifg=black
"hi Type         guifg=darkgreen
"hi Ignore       guifg=bg
"hi Error        guibg=Red gui=bold guifg=White
"hi Todo         guifg=Blue guibg=Yellow
"hi ErrorMsg     guibg=Red gui=bold guifg=White
"hi Normal       guibg=#fffff5f2eed8
"hi ModeMsg      guifg=DarkBlue guibg=yellow
"hi StatusLine   gui=bold guifg=lightgray guibg=DarkBlue
"hi StatusLineNC gui=bold guifg=lightgray guibg=brown
"hi Cursor guibg=green guifg=NONE
"hi lCursor guibg=Cyan guifg=NONE
""""""""""""""""""""""""""""""
"打开高亮
if &t_Co > 2 || has("gui_running")
   :map <F7> :if exists("syntax_on") <Bar>
        \   syntax off <Bar>
        \ else <Bar>
        \   syntax enable <Bar>
        \ endif <CR>
  set hlsearch
endif 
""""""""""""""""""""""""""""""
set lines=38 columns=149
"lines上下宽度(行)columns左右宽度(字符个数),所以这句表示打开时为上下35行宽,左右118个字符宽的窗口
"set winheight=20
"set winwidth=10
"set fillchars=vert:\ ,stl:\ ,stlnc:\ " 在被分割的窗口间显示空白，便于阅读
set ruler " 显示标尺 在编辑过程中,在右下角显示光标位置的状态行
"set number " 行号
set nu! " 显示行号
"set rulerformat=%15(%c%V\ %p%%%)
"用浅色高亮当前行
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul
"set cursorline " 高亮当前行
"set cursorcolumn " 高亮当前列
set cmdheight=1 "The commandbar is 1 high
" 设置状态行显示信息
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
  function! CurDir()
     let curdir = substitute(getcwd(), '/home/easwy/', "~/", "g")
     return curdir
 endfunction
  "Format the statusline
  set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c
  "set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
" 标签页
"set tabpagemax=15 " 最多15个标签
"set showtabline=2 " 总是显示标签栏
""""""""""""""""""""""""""""""
set textwidth=80 " 设置每行80个字符自动换行，加上换行符
"set list "显示换行符 set nolist
"set listchars=tab:>-,trail:- "将 tab 符显示为>---,并将行尾的空格显示为-。如果你不喜欢这个特性,注释这两句即可
set backspace=indent,eol,start whichwrap+=<,>,[,] "允许退格键的使用
"折行显示设置
set formatoptions+=t "方便中文重排
set wrap "自动折行显示设置 :set nowrap
set linebreak "在合适的地方折行
set showbreak=-> "在折行处添加标记
"缩进设置
set tabstop=4 "设置 tab（制表符）宽度为4
set softtabstop=4 "设置（软）制表符宽度为4
set shiftwidth=4 "设置缩进的空格数为4
"set expandtab "空格代替 TAB
"设置自动缩进
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  augroup END
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")
"set ai    "自动缩进
"set autoindent
"set si    "智能缩进
"set smartindent " 开启新行时使用智能自动缩进
"set cindent "C/C++风格缩进
"set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s "设置C/C++语言的具体缩进方式
"智能缩进,相应的有 cindent,官方说 autoindent 可以支持各种文件的缩进,
"但是效果会比只支持 C/C++的 cindent 效果会差一点,但笔者并没有看出来
"""""""""""""""""""""""""""功能及插件""""""""""""""""""""
" 插件窗口的宽度，如TagList,NERD_tree等，自己设置
let s:PlugWinSize = 30
"从系统剪切板中复制，剪切，粘贴
"map <F7> "+y
"map <F8> "+x
"map <F9> "+p
"自动完成括号和引号
"inoremap <leader>1 ()<esc>:let leavechar=")"<cr>i
"inoremap <leader>2 []<esc>:let leavechar="]"<cr>i
"inoremap <leader>3 {}<esc>:let leavechar="}"<cr>i
"inoremap <leader>4 {<esc>o}<esc>:let leavechar="}"<cr>O
"inoremap <leader>q ''<esc>:let leavechar="'"<cr>i
"inoremap <leader>w ""<esc>:let leavechar='"'<cr>i
"代码折叠
autocmd FileType c,cpp  setl fdm=syntax | setl fen "它使用了自动命令，如果发现文件类型为c或cpp，就启用折叠功能，并按语法进行折叠
"set foldmethod=syntax " 用语法高亮来定义折叠
"set foldlevel=100 " 启动vim时不要自动折叠代码
"set foldcolumn=5 " 设置折叠栏宽度
"常用命令
"za  打开/关闭在光标下的折叠
"zA  循环地打开/关闭光标下的折叠
"zo  打开 (open) 在光标下的折叠
"zO  循环打开 (Open) 光标下的折叠
"zc  关闭 (close) 在光标下的折叠
"zC  循环关闭 (Close) 在光标下的所有折叠
"zM  关闭所有折叠
"zR  打开所有的折叠
"括号自动匹配
"""""""""""""""""""""""""NERDTree"""""""""""""
map <F2> :NERDTreeToggle<cr> "F2 打开NERDTree
let NERDTreeWinPos = "left"
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=s:PlugWinSize
" 在终端启动vim时，共享NERDTree
"let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1
"nerdtree-git-plugin
"let g:NERDTreeIndicatorMapCustom = {
"\ "Modified"  : "✹",
"\ "Staged"    : "✚",
"\ "Untracked" : "✭",
"\ "Renamed"   : "➜",
"\ "Unmerged"  : "═",
"\ "Deleted"   : "✖",
"\ "Dirty"     : "✗",
"\ "Clean"     : "✔︎",
"\ "Unknown"   : "?"
"\ }
""""""""""""""ctrlp"""""""""""""""""""""""""""
"全局搜索 <c-p>
":help ctrlp-mappings
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"ag去替换默认的搜索功能grep
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
""""""""""""""""""""""""代码浏览"""""""""""""""
"生成代码数据库文件  cscope.in.out  cscope.out  cscope.po.out
  "ctags 生成tags主要面向c、c++ 外部工具
  "cscope 生成cscope.in.out cscope.out cscope.po.out 外部工具
"""""""""ctags 和 cscope(绑定 F12)""
map <F12> :call Do_CsTag()<CR>
" cscope 绑定
if has("cscope")
    "决定了|:cstag|执行查找的顺序 如为0，那么cscope数据将被优先查找
    set csto=1
    "诸如”:tag”和ctrl+]和”vim -t”等命令会始终使用|:cstag|而不是默认的:tag行为
                "通过设置’cst’，你将始终同时查找cscope数据库和tags文件
    set cst
    "指定了是否使用quickfix窗口来显示cscope的结果
                "‘-’先清空再显示’0’或不设置表示不使用
    set cscopequickfix=s-,c-,d-,i-,t-,e-
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
    " s: C语言符号  g: 定义     d: 这个函数调用的函数 c: 调用这个函数的函数
    " t: 文本       e: egrep模式    f: 文件     i: include本文件的文件
    nmap <leader>ss :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    nmap <leader>sg :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>sc :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    nmap <leader>st :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    nmap <leader>se :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    nmap <leader>sf :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
    nmap <leader>si :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
    nmap <leader>sd :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
endif
function Do_CsTag()
let dir = getcwd()
if filereadable("tags")
if(g:iswindows==1)
let tagsdeleted=delete(dir."\\"."tags")
else
let tagsdeleted=delete("./"."tags")
endif
if(tagsdeleted!=0)
echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
return
endif
endif
if has("cscope")
silent! execute "cs kill -1"
endif
if filereadable("cscope.files")
if(g:iswindows==1)
let csfilesdeleted=delete(dir."\\"."cscope.files")
else
let csfilesdeleted=delete("./"."cscope.files")
endif
if(csfilesdeleted!=0)
echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
return
endif
endif
if filereadable("cscope.out")
if(g:iswindows==1)
let csoutdeleted=delete(dir."\\"."cscope.out")
else
let csoutdeleted=delete("./"."cscope.out")
endif
if(csoutdeleted!=0)
echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
return
endif
endif
if(executable('ctags'))"silent! execute "!ctags -R --c-types=+p --fields=+S *"
silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
endif
if(executable('cscope') && has("cscope") )
if(g:iswindows!=1)
silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' >
cscope.files"
else
silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
endif
silent! execute "!cscope -b"
execute "normal :"
if filereadable("cscope.out")
   execute "cs add cscope.out"
endif
endif
" 刷新屏幕
    "execute "redr!"
endfunction 
"""""""""""""""tagbar"""""""""""""""""""""""""
"依赖于ctags
map <F3> :silent! TagbarToggle<CR>
let g:tagbar_ctags_bin='/usr/bin/ctags'
"let g:tagbar_width=s:PlugWinSize
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
"""""""""""""""Taglist""""""""""""""""""""""""
"TlistUpdate 可以更新 tags
map <F4> :silent! Tlist<CR> "按下 F4 就可以呼出了,可以改
let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里,所以可以直接执行
let Tlist_Use_Right_Window=1 "让窗口显示在右边,0 的话就是显示在左边
let Tlist_Show_One_File=1 "让 taglist 可以同时展示多个文件的函数列表,如果想只有 1 个,设置为 1
let Tlist_File_Fold_Auto_Close=1 "非当前文件,函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当 taglist 是最后一个分割窗口时,自动推出 vim
let Tlist_Process_File_Always=0 "是否一直处理 tags.1:处理;0:不处理。不是一直实时更新 tags,因为没有必要
let Tlist_WinWidth = s:PlugWinSize
let Tlist_Inc_Winwidth=0
let Tlist_GainFocus_On_ToggleOpen = 0
let Tlist_Auto_Open = 0
let Tlist_Display_Prototype = 0
"let Tlist_Close_On_Select = 1
"""""""""""""minibuffer"""""""""""""""""""""""
let g:miniBufExplModSelTarget = 1  
let g:miniBufExplMoreThanOne=0

let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
"nmap <leader>mmbe :MiniBufExplorer<CR>
nmap <leader>mmbc :CMiniBufExplorer<CR>
"nmap <leader>mmbu :UMiniBufExplorer<CR>
"nmap <leader>mmbt :TMiniBufExplorer<CR>
":bn   打开当前buffer的下一个buffer
":bp   打开当前buffer的前一个buffer
":b"num"   打开指定
"的buffer，"num"指的是buffer开始的那个数字，比如上图，我想打开list_audit.erb，输入:b7就ok了
"""""""""""""syntastic""""""""""""""""""""""""
"语法检查
" configure syntastic syntax checking to check on open as well as save
let g:syntastic_c_include_dirs = [ '../include', 'ysinclude']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_highlighting=1
"let g:syntastic_python_checkers=['pyflakes'] " 使用pyflakes,速度比pylint快
"let g:syntastic_javascript_checkers = ['jsl', 'jshint']
"let g:syntastic_html_checkers=['tidy', 'jshint']
" 修改高亮的背景色, 适应主题
" highlight SyntasticErrorSign guifg=white guibg=black
"
" " to see error location list
 let g:syntastic_always_populate_loc_list = 0
 let g:syntastic_auto_loc_list = 0
 let g:syntastic_loc_list_height = 5
 function! ToggleErrors()
     let old_last_winnr = winnr('$')
     lclose
     if old_last_winnr == winnr('$')
     " Nothing was closed, open syntastic error location panel
        Errors
     endif
 endfunction
nnoremap <Leader>s :call ToggleErrors()<cr>
" nnoremap <Leader>sn :lnext<cr>
" nnoremap <Leader>sp :lprevious<cr>
"""""""""""""tasklist"""""""""""""""""""""""""
"任务列表
"map <leader>td <Plug>TaskList
"""""""""""""Gundo""""""""""""""""""""""""""""
"http://sjl.bitbucket.org/gundo.vim/
"undo tree
"nnoremap <Leader>u :GundoToggle<CR>
"nnoremap <F6> :GundoToggle<CR>
"""""""""""""Tabularize"""""""""""""""""""""""
"按等号、冒号、表格等来对齐文本
"nmap <Leader>a& :Tabularize /&<CR>
"vmap <Leader>a& :Tabularize /&<CR>
"nmap <Leader>a= :Tabularize /=<CR>
"vmap <Leader>a= :Tabularize /=<CR>
"nmap <Leader>a: :Tabularize /:<CR>
"vmap <Leader>a: :Tabularize /:<CR>
"nmap <Leader>a:: :Tabularize /:\zs<CR>
"vmap <Leader>a:: :Tabularize /:\zs<CR>
"nmap <Leader>a, :Tabularize /,<CR>
"vmap <Leader>a, :Tabularize /,<CR>
"nmap <Leader>a,, :Tabularize /,\zs<CR>
"vmap <Leader>a,, :Tabularize /,\zs<CR>
"nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
"vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
""""""""""""session manager""""""""""""""""""
"管理VIM的会话
"set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
"nmap <leader>ssl :SessionList<CR>
"nmap <leader>sss :SessionSave<CR>
"nmap <leader>ssc :SessionClose<CR>
""""""""""""youcompleteme""""""""""""""""""""
"代码自动补全
"安装：
" cd ~/.vim/bundle/YouCompleteMe/
" ./install.py --clang-completer
"let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion = ['<Up>']
"let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示
"let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
"let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项
"let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
" 在注释输入中也能补全
" let g:ycm_complete_in_comments = 1
" " 在字符串输入中也能补全
" let g:ycm_complete_in_strings = 1
" "注释和字符串中的文字也会被收入补全
" let g:ycm_collect_identifiers_from_comments_and_strings = 0
" let g:ycm_global_ycm_extra_conf =
" '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"
" nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
" nnoremap <leader>lo :lopen<CR> "open locationlist                                                                                                                      
" nnoremap <leader>lc :lclose<CR>   "close locationlist
" inoremap <leader><leader> <C-x><C-o>"
" inoremap <leader><leader> <C-x><C-o>
" nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" """"""""""AutoComplPop&OmniCppComplete
 let OmniCpp_NamespaceSearch = 1
 let OmniCpp_GlobalScopeSearch = 1
 let OmniCpp_ShowAccess = 1
 let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
 let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
 let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全
 let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全
 let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"let OmniCpp_SelectFirstItem=2     ”自动弹出时自动跳至第一个
" 自动关闭补全窗口
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest
   "自动补全命令时候使用菜单式匹配列表  
   "set wildmenu  
"Pmenu 所有项配色 PmenSel 选中项配色
"highlight Pmenu    guibg=darkgrey  guifg=black "term ctermfg ctermbg
"highlight PmenuSel guibg=lightgrey guifg=black
"   autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete  
"   autocmd FileType python set omnifunc=pythoncomplete#Complete  
"   autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS  
"   autocmd FileType html set omnifunc=htmlcomplete#CompleteTags  
"   autocmd FileType css set omnifunc=csscomplete#CompleteCSS  
"   autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags  
"   autocmd FileType java set omnifunc=javacomplete#Complet  
"""""""""""""""""""vimwiki""""""""""""""""""
"用于个人知识管理——每日记录才有意义；不要急于分类，等待一个阶段完成
"let g:vimwiki_use_mouse = 1
"let g:vimwiki_list = [{'path': '~/vimwiki/',
"			\'path_html': '~/vimwiki/html/',
"			\'html_header': '~/vimwiki/template/header.tpl',}]
"path- 存放vimwiki文件（.wiki）路径
"path_html- 从vimwiki转换为网页时的路径
"html_header- 转换为网页时使用的网页模板的路径
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mark as loaded
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimrc_loaded = 1

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
"""""""""""""""""配置快捷键""""""""""""""""""""""""""""""""""""""
"nmap：映射一个Normal模式下的键，只有在Normal模式这个命令才会生效。
"例：nmap ,s :source $VIM/_vimrc<cr>
"说明：绑定“,s”在Normal模式下映射为“:source $VIM/_vimrc<cr>”命令，即重新读取配置文件_vimrc 。
"imap：映射一个Insert 模式下的键，只有在Insert 模式这个命令才会生效。
"例：imap <F11> :r c:\boot.ini<cr>
"说明：绑定F11Insert 模式下的映射为“:r c:\boot.ini<cr>”命令，即读取c:\boot.ini文件到当前位置。
"vmap：映射一个Visual模式下的键，只有在Visual模式这个命令才会生效。
"例：vmap sb "zbi<b><c-r>z</b><ESC>
"说明：选中文字后按sb，选中文字的前后将分别加上<b>和</b>。
"再例：vmap g/ y/<c-r>"<cr>
"说明：映射“g/”这个组合键匹配选中的字并给予高亮显示。
"map：用map绑定的键对Normal, Insert, Visual和Command-line模式均有效。
"例：map <F5> :ls<cr>:e #
"map <c-s> :w<CR>
"如果是终端下的vim，由于C-s和C-q是终端的保留按键，所以对vim没有作用。或者你用别的键映射，或者在你的.bashrc里加上 stty -ixon ，取消C-s和C-q在终端的作用
map <S-s> :w<CR>
".asm注释——文件头
nmap ;= i;<ESC>70a=<ESC>a<ENTER>;<ENTER>;————<ESC>:r !date<CR>i<BS><ESC>o;作用：<ENTER>;数据结构：<ENTER>;技术细节：<ENTER>;程序流程：<ENTER>;<ESC>70a=<ESC>a<ENTER><ESC>-------
"""""""""""""""""配置代码到此为止"""""""""""""""""""""""""""""""""""
