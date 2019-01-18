" ============================================================================
" 初始化Vundle

" no vi-compatible
set nocompatible

" 配置vim插件管理器Vundle
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" 用Vundle管理Vundle
Bundle 'gmarik/vundle'

" ============================================================================
" 激活插件

" 插件托管在github

" Python和PHP调试工具
Bundle 'jaredly/vim-debug'
" 文件夹导航栏
Bundle 'scrooloose/nerdtree'
" 快速注释插件
Bundle 'scrooloose/nerdcommenter'
" 标签栏插件
Bundle 'majutsushi/tagbar'
" 字符or字符串全文件查找插件
Bundle 'kien/ctrlp.vim'
" ctrlp的命令查找器
Bundle 'fisadev/vim-ctrlp-cmdpalette'
" Zen coding
Bundle 'mattn/emmet-vim'
" Git交互插件
Bundle 'motemen/git-vim'
" 标签表面板
Bundle 'kien/tabman.vim'
" 状态栏显示工具
Bundle 'vim-airline/vim-airline-themes'
" 256色颜色插件
Bundle 'fisadev/fisa-vim-colorscheme'
" 在vim在模拟Terminal，运行:ConqueTermSplit
" ipython就可以分割一个窗口并在其中执行ipython解释器
Bundle 'rosenfeld/conque-term'
" 任务列表插件
Bundle 'fisadev/FixedTaskList.vim'
" 方便的在字符两边插入各种符号
Bundle 'tpope/vim-surround'
" 自动闭合代码块
Bundle 'Townk/vim-autoclose'
" 代码模块缩进
Bundle 'michaeljsmith/vim-indent-object'
" Python模式(缩进, 文档, 重命名, lints, 代码检查, motion and
" 操作符, 代码高亮, 运行以及ipdb断点调试)
Bundle 'python-mode/python-mode'
" 代码补全
Bundle 'Shougo/neocomplcache.vim'
" Snippets 管理器 (SnipMate), 依赖, and snippets 库
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'
" Git/mercurial/others diff icons on the side of the file lines
Bundle 'mhinz/vim-signify'
" python imports库自动排列
Bundle 'fisadev/vim-isort'
" Drag visual blocks arround
Bundle 'fisadev/dragvisuals.vim'
" 补全窗口块
Bundle 't9md/vim-choosewin'
" Python语法检查器
Bundle 'scrooloose/syntastic'
" CSS颜色显示
Bundle 'lilydjwg/colorizer'
" 搜索结果计数器
Bundle 'IndexedSearch'
" XML/HTML 标签导航
Bundle 'matchit.zip'
" Gvim 颜色框架
Bundle 'Wombat'
" Yank history navigation
" 同时粘贴多个需要的单词等
Bundle 'YankRing.vim'
" Flake8 Vim 插件
Bundle 'vim-flake8'
" 源码查看器
Bundle 'davidhalter/jedi-vim'


" ============================================================================
" 安装插件

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

" ============================================================================
" Vim和键值的设置
" 设置背景颜色为黑色
" set background=dark
" 允许插件在相应的文件类型上使用
" 打开文件类型差别
filetype plugin on
" 使用文件类型缩进
filetype indent on

" tab键的空格个数
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" 设置批量tab快捷键
xnoremap < <gv
xnoremap > >gv

" tab键空格个数在html上的特殊定义
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2

" 设置下方状态栏为显示模式
set ls=2

" incremental search
set incsearch
" 高亮搜索结果
set hlsearch

" 打开语法高亮
syntax on

" 显示行号
set nu

" ===============================================
" vim自定义快捷键格式
" 模式: <快捷键> 要执行的命令
" 模式: nmap为普通模式,imap为编辑模式
" C表示ctrl,A表示Alt,S表示Shift,<CR>表示回车 
" ==============================================

" 标签页快捷键设置
map tn :tabn<CR> 
map tp :tabp<CR>
map tm :tabm 
map tt :tabnew 
map ts :tab split<CR>
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>

" navigate windows with meta+arrows
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j

" old 代码自动补全键
imap <C-J> <C-X><C-O>

" 开启代码自动补全框
" (displays documentation related to the selected completion option)
" Disabled by default because preview makes the window flicker
" set completeopt-=preview

" 以sudo权限保存
ca w!! w !sudo tee "%"

" 快速递归搜索
" simple recursive grep
" both recursive grep commands with internal or external (fast) grep
command! -nargs=1 RecurGrep lvimgrep /<args>/gj ./**/*.* | lopen | set nowrap
command! -nargs=1 RecurGrepFast silent exec 'lgrep! <q-args> ./**/*.*' | lopen
" 快捷调用
" mappings to call them
nmap ,R :RecurGrep 
nmap ,r :RecurGrepFast 
" mappings to call them with the default word as search text
nmap ,wR :RecurGrep <cword><CR>
nmap ,wr :RecurGrepFast <cword><CR>

" 使用256色
if &term =~? 'mlterm\|xterm\|xterm-256\|screen-256'
	let &t_Co = 256
    colorscheme fisa
else
    colorscheme delek
endif

" 设置gvim的颜色样色
if has('gui_running')
    colorscheme wombat
endif

" 当使用滚动条时，保持光标和底部存在3行的距离
set scrolloff=3

" 代码自动完成
" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" 优化backup，swap以及undos保存设置
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo
" store yankring history file there too
let g:yankring_history_dir = '~/.vim/dirs/'

" 创建必须的文件夹
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

" ============================================================================
" 插件及其快捷键设置

" Tagbar 标签栏----------------------------- 

" 切换标签栏显示(使用前先下载ctag)
" map <F4> :TagbarToggle<CR>
" autofocus标签栏
let g:tagbar_autofocus = 1

" NERDTree 文件目录查看--------------------- 

" 切换nerdtree显示
map <F3> :NERDTreeToggle<CR>
" 以选中模式让当前文件显示在nerdtree中
nmap ,t :NERDTreeFind<CR>
" 不显示.pyc和.pyo文件
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" Tasklist ------------------------------

" 显示tasks list(显示各种todo之类的)
map <F2> :TaskList<CR>

" Vim-debug 调试各种代码------------------------------

" 关闭部分快捷键设置，避免和调试工具冲突
" disable default mappings, have a lot of conflicts with other plugins
let g:vim_debug_disable_mappings = 1
" add some useful mappings
" map <F5> :Dbg over<CR>
" map <F6> :Dbg into<CR>
" map <F7> :Dbg out<CR>
" map <F8> :Dbg here<CR>
" map <F9> :Dbg break<CR>
" map <F10> :Dbg watch<CR>
" map <F11> :Dbg down<CR>
" map <F12> :Dbg up<CR>

" CtrlP 在文件夹中查找某字符的插件------------------------------

" file finder mapping
let g:ctrlp_map = ',e'
" tags (symbols) in current file finder mapping
nmap ,g :CtrlPBufTag<CR>
" tags (symbols) in all files finder mapping
nmap ,G :CtrlPBufTagAll<CR>
" general code finder in all files mapping
" 在所有文件中找
nmap ,f :CtrlPLine<CR>
" recent files finder mapping
" 在当前文件中找某字符
nmap ,m :CtrlPMRUFiles<CR>
" commands finder mapping
nmap ,c :CtrlPCmdPalette<CR>
" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction
" same as previous mappings, but calling with current word as default text
nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
" don't change working directory
let g:ctrlp_working_path_mode = 0
" 在查找字符串时不搜索这些字符串
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn)$',
  \ 'file': '\.pyc$\|\.pyo$',
  \ }

" Syntastic 语法检查插件------------------------------

" show list of errors and warnings on the current file
" 显示当前文件中所有错误和警告的地方
nmap <leader>e :Errors<CR>
" check also when just opened the file
" 刚打开文件检查一次错误和警告
let g:syntastic_check_on_open = 1
" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 0
" custom icons (enable them if you use a patched font, and enable the previous 
" setting)
"let g:syntastic_error_symbol = '✗'
"let g:syntastic_warning_symbol = '⚠'
"let g:syntastic_style_error_symbol = '✗'
"let g:syntastic_style_warning_symbol = '⚠'

" Python-mode Python代码检查------------------------------
" Python PEP8 格式整理
nmap <F4> :PymodeLintAuto<CR>
" don't use linter, we use syntastic for that
let g:pymode_lint_on_write = 0
let g:pymode_lint_signs = 0
" don't fold python code on open
let g:pymode_folding = 0
" don't load rope by default. Change to 1 to use rope
let g:pymode_rope = 0
" open definitions on same window, and custom mappings for definitions and
" occurrences
let g:pymode_rope_goto_definition_bind = ',d'
let g:pymode_rope_goto_definition_cmd = 'e'
nmap ,D :tab split<CR>:PymodePython rope.goto()<CR>
nmap ,o :RopeFindOccurrences<CR>

" NeoComplCache ------------------------------

" most of them not documented because I'm not sure how they work
" (docs aren't good, had to do a lot of trial and error to make 
" it play nice)
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_fuzzy_completion_start_length = 1
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_manual_completion_start_length = 1
let g:neocomplcache_min_keyword_length = 1
let g:neocomplcache_min_syntax_length = 1
" complete with workds from any opened file
let g:neocomplcache_same_filetype_lists = {}
let g:neocomplcache_same_filetype_lists._ = '_'

" TabMan 标签管理器------------------------------

" mappings to toggle display, and to focus on it
let g:tabman_toggle = 'tl'
let g:tabman_focus  = 'tf'

" Autoclose ------------------------------

" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" DragVisuals ------------------------------

" mappings to move blocks in 4 directions
vmap <expr> <S-M-LEFT> DVB_Drag('left')
vmap <expr> <S-M-RIGHT> DVB_Drag('right')
vmap <expr> <S-M-DOWN> DVB_Drag('down')
vmap <expr> <S-M-UP> DVB_Drag('up')
" mapping to duplicate block
vmap <expr> D DVB_Duplicate()

" Signify ------------------------------

" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" Window Chooser ------------------------------

" mapping
nmap  -  <Plug>(choosewin)
" 显示大写字母
let g:choosewin_overlay_enable = 1

" Airline ------------------------------

let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0

" to use fancy symbols for airline, uncomment the following lines and use a
" patched font (more info on the README.rst)
"if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
"endif
"let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
"let g:airline_symbols.branch = '⭠'
"let g:airline_symbols.readonly = '⭤'
"let g:airline_symbols.linenr = '⭡'

" TagList ------------------------------
"let Tlist_Auto_Highlight_Tag=1
"let Tlist_Auto_Open=1
"let Tlist_Auto_Update=1
"let Tlist_Display_Tag_Scope=1
"let Tlist_Exit_OnlyWindow=1
"let Tlist_Enable_Dold_Column=1
"let Tlist_File_Fold_Auto_Close=1
"let Tlist_Show_One_File=1
"let Tlist_Use_Right_Window=1
"let Tlist_Use_SingleClick=1
"nmap ,v :TlistToggle<CR>

set backspace=2
