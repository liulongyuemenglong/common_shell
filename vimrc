"自动安装插件
execute pathogen#infect()
call pathogen#helptags()
" autocmd vimenter * NERDTree
"当打开vim且没有文件时自动打开NERDTree
" autocmd vimenter * NERDTree
" 只剩 NERDTree时自动关闭
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" let g:nerdtree_tabs_open_on_console_startup=1

set statusline=%F%m%r%h%w\ [%{&ff}]\ [%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [%l,%v][%p%%]\ [LEN=%L]
set laststatus=2
set encoding=UTF-8
set langmenu=zh_CN.UTF-8
set shiftwidth=1
set nocp
language message zh_CN.UTF-8

set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"set autocddir

set ruler "显示光标所在的行列
set nu
set ignorecase  "忽略规则表达式的大小写
syntax on "语法高亮

"indent
"继承前一行的缩进方式，特别适用于多行注释
set autoindent
filetype plugin indent on
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType html setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType php setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType javascript setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType sh setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType cpp setlocal expandtab tabstop=4 shiftwidth=2 softtabstop=2
autocmd FileType c setlocal expandtab tabstop=4 shiftwidth=2 softtabstop=2
autocmd FileType java setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

"set tabstop=4 "设定 tab 长度为 4
"set expandtab

set showmatch "匹配括号
set hlsearch "搜索高亮显示
set is
set ic
set shell=bash\ --login
set nowrap
set wildmenu
set backspace=2
set nostartofline
set mouse=v
filetype plugin on

"代码检查
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_python_checkers=['pylint']
"let g:syntastic_always_populate_loc_list = 0
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0


"可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
"set mouse=a
set selection=exclusive
set selectmode=mouse,key

"通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0

" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
set incsearch

" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G

" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y

"去空行
nnoremap <F2> :g/^\s*$/d<CR>

"比较文件
nnoremap <C-F2> :vert diffsplit

"列出当前目录文件
"map <F3> :tabnew .<CR>

"打开树状文件目录
"map <C-F3> \be

"共享剪贴板
set clipboard+=unnamed

" 历史记录数
set history=1000

"设置自动补全
set completeopt=longest,menu "关掉智能补全时的预览窗口

"设置在粘贴的时候不自动缩进
"set paste


"记住上次编辑的位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
"显示括号配对情况
set magic

let colors_name = "self"
"hi Normal guifg=#c0c0c0 guibg=#294d4a ctermfg=gray ctermbg=black

" 记录上次打开的位置
"if has("autocmd")
"autocmd BufRead *.txt set tw=78
"autocmd BufReadPost *
"\ if line("'\"") > 0 && line ("'\"") <= line("$") |
"\   exe "normal g'\"" |
"\ endif
"endif

"新建.py,.sh文件，自动插入文件头
autocmd BufNewFile *.py,*.sh,*.c exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
    "如果文件类型为.py文件
    if &filetype == 'python'
        call setline(1,"\#!/usr/bin/env python")
        call append(line("."), "\# -*- coding: utf-8 -*-")
        call append(line(".")+1,"")
        call append(line(".")+2, "\"\"\"")
        call append(line(".")+3, "Copyright (c) 2015,掌阅科技")
        call append(line(".")+4, "All rights reserved.")
        call append(line(".")+5, "")
        call append(line(".")+6, "摘    要: ".expand("%"))
        call append(line(".")+7, "创 建 者: liulong")
        call append(line(".")+8, "创建日期: ".strftime("%F"))
        call append(line(".")+9, "\"\"\"")
        call append(line(".")+10, "")
        call append(line(".")+11, "")
        call append(line(".")+12, "if __name__ == '__main__':")
        call append(line(".")+13, "    pass")
        call append(line(".")+14, "")
    elseif &filetype == 'sh'
        call setline(1, "\###########################################")
        call append(line("."),   "\# 摘    要: ".expand("%"))
        call append(line(".")+1, "\# 创 建 者: liulong")
        call append(line(".")+2, "\# 创建日期: ".strftime("%F"))
        call append(line(".")+3, "\###########################################")
        call append(line(".")+4,"\#!/bin/bash")
        call append(line(".")+5, "")
        call append(line(".")+6, "")
    elseif &filetype == 'c'
        call setline(1,"\#include <stdio.h>")
        call append(line("."),"")
        call append(line(".")+1, "\/*")
        call append(line(".")+2, "Copyright (c) 2015,掌阅科技")
        call append(line(".")+3, "All rights reserved.")
        call append(line(".")+4, "")
        call append(line(".")+5, "摘    要: ".expand("%"))
        call append(line(".")+6, "创 建 者: liulong")
        call append(line(".")+7, "创建日期: ".strftime("%F"))
        call append(line(".")+8, "*/")
        call append(line(".")+9, "")
        call append(line(".")+10, "\void main(){")
        call append(line(".")+11, "")
        call append(line(".")+12, "\}")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc

let pyindent_nested_paren="&sw*2"
let pyindent_open_paren="&sw*2"

"python format
"au FileType python set formatprg=~/.vim/pyformat.py
"au FileType python set formatprg=/var/zhangyue/pyformat.py
"noremap <F11> gggqG

"colorscheme self

let python_highlight_all = 1
" js格式化插件
let g:js_indent_log = 0

"开启光亮光标行
set cursorline

"代码格式优化化

map <F6> :call FormartSrc()<CR>
" 通过按F9键就可以打开和关闭paste选项了，粘贴之前按下F9，需要缩进时再按下F9
set pastetoggle=<F7>

"定义FormartSrc()
func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --ignore=E123,E133,E226,E241,E242 --max-line-length=120 %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
    exec "e! %"
endfunc


set magic " 设置魔术
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set selection=exclusive
set selectmode=mouse,key
