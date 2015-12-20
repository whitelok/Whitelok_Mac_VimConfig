# Whitelok\_Mac_VimConfig
- My Vim configuration file for Python on Mac. 
- Mac Python Vim配置文件。

## Installation 安装
- `git clone https://github.com/whitelok/Whitelok_Mac_VimConfig.git`
- `cp Whitelok_Mac_VimConfig/.vimrc ~/`
- Open a file and the installing process will be started automatically. 用vim随便打开一个文件，安装会自动开始。

## Keymap 快捷键
###Normal模式：
 - `tt` 新建标签页
 - `tm` 调整
 - `tn`或`Ctrl+Shift+右键` 切换到下一个标签
 - `tp`或`Ctrl+Shift+左键` 上一个标签页
 - `ts` 标签分割（当前的操作的文档分为两个标签显示）
 - `,R` 递归搜索
 - `,r` 快速递归搜索
 - `F3` 显示文件浏览器(并在不同窗口显示)
 - `F4` 自动利用PEP8规则整理代码
 - `F5` 
 - `F6`
 - `F7`
 - `F8`
 - `F9`
 - `F10`
 - `F11`
 - `F12`
 - `,e`
 - `\e` 显示代码中存在的错误
 - `,g`
 - `,G`
 - `,f`
 - `,m`
 - `,c`
 - `,D`
 - `,o`
 
###Edit模式：
 - `Ctrl+o Ctrl+x Ctrl+j` 自动完成代码

##Dependencies Plugin 依赖插件
- Python和PHP调试工具 fisadev/vim-debug.vim
- 文件夹导航栏 scrooloose/nerdtree
- 快速注释插件 scrooloose/nerdcommenter
- 标签栏插件 majutsushi/tagbar
- 字符or字符串全文件查找插件 kien/ctrlp.vim
- ctrlp的命令查找器 fisadev/vim-ctrlp-cmdpalette
- Zen coding mattn/emmet-vim
- Git交互插件 motemen/git-vim
- 标签表面板 kien/tabman.vim
- 状态栏显示工具 bling/vim-airline
- 256色颜色插件 fisadev/fisa-vim-colorscheme
- 在vim在模拟Terminal，运行:ConqueTermSplit ipython就可以分割一个窗口并在其中执行ipython解释器 rosenfeld/conque-term
- 任务列表插件 fisadev/FixedTaskList.vim
- 方便的在字符两边插入各种符号 tpope/vim-surround
- 自动闭合代码块 Townk/vim-autoclose
- 代码模块缩进 michaeljsmith/vim-indent-object
- Python模式(缩进, 文档, 重命名, lints, 代码检查, motion and 操作符, 代码高亮, 运行以及ipdb断点调试) klen/python-mode
- 代码补全 Shougo/neocomplcache.vim
- Snippets 管理器 (SnipMate), 依赖, 以及snippets库 MarcWeber/vim-addon-mw-utils tomtom/tlib_vim honza/vim-snippets garbas/vim-snipmate
- Git/mercurial/others diff icons on the side of the file lines mhinz/vim-signify
- python imports库自动排列 fisadev/vim-isort
- Drag visual blocks arround fisadev/dragvisuals.vim
- 补全窗口块 t9md/vim-choosewin
- Python语法检查器 scrooloose/syntastic
- CSS颜色显示 lilydjwg/colorizer
- 搜索结果计数器 IndexedSearch
- XML/HTML 标签导航 matchit.zip
- Gvim 颜色框架 Wombat
- Yank history navigation 同时粘贴多个需要的单词等 YankRing.vim
- Flake8 Vim 插件 vim-flake8