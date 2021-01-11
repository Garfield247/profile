  "______               __      __       __
 "/      \             /  |    /  \     /  |
"/$$$$$$  |  ______   _$$ |_   $$  \   /$$ |  ______   _______
"$$ |  $$/  /      \ / $$   |  $$$  \ /$$$ | /      \ /       \
"$$ |       $$$$$$  |$$$$$$/   $$$$  /$$$$ | $$$$$$  |$$$$$$$  |
"$$ |   __  /    $$ |  $$ | __ $$ $$ $$/$$ | /    $$ |$$ |  $$ |
"$$ \__/  |/$$$$$$$ |  $$ |/  |$$ |$$$/ $$ |/$$$$$$$ |$$ |  $$ |
"$$    $$/ $$    $$ |  $$  $$/ $$ | $/  $$ |$$    $$ |$$ |  $$ |
 "$$$$$$/   $$$$$$$/    $$$$/  $$/      $$/  $$$$$$$/ $$/   $$/

             "__     __  __                _______
            "/  |   /  |/  |              /       \
            "$$ |   $$ |$$/  _____  ____  $$$$$$$  |  _______
            "$$ |   $$ |/  |/     \/    \ $$ |__$$ | /       |
            "$$  \ /$$/ $$ |$$$$$$ $$$$  |$$    $$< /$$$$$$$/
             "$$  /$$/  $$ |$$ | $$ | $$ |$$$$$$$  |$$ |
              "$$ $$/   $$ |$$ | $$ | $$ |$$ |  $$ |$$ \_____
               "$$$/    $$ |$$ | $$ | $$ |$$ |  $$ |$$       |
                "$/     $$/ $$/  $$/  $$/ $$/   $$/  $$$$$$$/

let mapleader=" "

if has("termguicolors")
    " fix bug for vim
    set t_8f=^[[38;2;%lu;%lu;%lum
    set t_8b=^[[48;2;%lu;%lu;%lum

    " enable true color
    set termguicolors
endif

set t_Co=256
"开启语法高亮
if has("syntax")
  syntax on
endif

if has("mac")
    let g:python3_host_prog="$HOME/.pyenv/versions/vimenv4py3/bin/python3"
    let g:python_host_prog="$HOME/.pyenv/versions/vimenv4py2/bin/python"
endif
" 记录上次浏览位置
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set laststatus =2

" 文件相关
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set fileencodings=ucs-bom,UTF-8,GBK,BIG5,latin1
set fileencoding=UTF-8
set guifont=DroidSansMono_Nerd_Font:h11
set fileformat=unix     "换行使用unix方式
set updatecount=0       "不使用交换文件


"使用系统剪贴板
set clipboard=unnamedplus

"缩进定义
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab
set backspace=2     "退格键可以删除任何东西
set listchars=tab:>-,trail:-

auto BufWritePre * sil %s/\s\+$//ge "保存时删除行尾空白

set ambiwidth=double
set number " 显示行号
set relativenumber " 相对行号
set cursorline " 当前行高亮
set wrap " 自动换行
set showcmd " 显示命令
set wildmenu " 命令提示

set noerrorbells
set visualbell
"搜索相关
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
noremap = Nzz
noremap - nzz
noremap <LEADER><CR> :nohlsearch<CR>

" 按键映射
map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>
" 分屏
" 分屏快捷键
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sj :set splitbelow<CR>:split<CR>
map sk :set nosplitbelow<CR>:split<CR>
" 分屏中移动光标
map<LEADER>h <C-w>h
map<LEADER>j <C-w>j
map<LEADER>k <C-w>k
map<LEADER>l <C-w>l
" 分屏中调整上下左右布局
map<LEADER>sv <C-w>t<C-w>H
map<LEADER>sh <C-w>t<C-w>K
" 移动分屏
map<LEADER>H <C-w>H
map<LEADER>J <C-w>J
map<LEADER>K <C-w>K
map<LEADER>L <C-w>L
"互换分屏位置
map<LEADER>[ <C-w>r
map<LEADER>] <C-w>R


" 调整分屏窗口大小
map<up> :res +5<CR>
map<down> :res -5<CR>
map<left> :vertical resize-5<CR>
map<right> :vertical resize+5<CR>

" 标签
map tn :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>
" 快速翻页
noremap J 10j
noremap K 10k

"autocmd Filetype markdown map
autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
autocmd Filetype markdown inoremap <buffer> ,w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>
autocmd Filetype markdown inoremap <buffer> ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap <buffer> ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap <buffer> ,s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap <buffer> ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap <buffer> ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap <buffer> ,m - [ ]
autocmd Filetype markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,l --------<Enter>

" 插件
call plug#begin('~/.vim/plugged')
" vim布局
Plug 'vim-airline/vim-airline' " vim状态栏
Plug 'mhinz/vim-startify' " vim 首页
Plug 'mg979/vim-xtabline' "vim顶部状态栏
Plug 'morhetz/gruvbox' "主题

" 开发语言
Plug 'neoclide/coc.nvim', {'branch': 'release'} "coc
Plug 'fatih/vim-go' " vim Golang插件
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets' "代码片段
Plug 'mattn/emmet-vim' "html补全
Plug 'rizzatti/dash.vim' "dash api文档

" 文件浏览器
Plug 'scrooloose/nerdtree' "文件浏览器
Plug 'Xuyuanp/nerdtree-git-plugin' "nerdtree Git插件
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " nerdtree 高亮
"Plug 'ryanoasis/vim-devicons' "文件图标

" 快速操作
Plug 'scrooloose/nerdcommenter' "快速注释/解除注释
Plug 'godlygeek/tabular' "代码对齐
Plug 'tpope/vim-surround' " vim快速设置包裹符号
Plug 'gcmt/wildfire.vim' " 快速选中
Plug 'voldikss/vim-codelf' "变量名命名神器

" git
"Plug 'irblade/vim-gitgutter' "在sign列显示git diff
Plug 'zivyangll/git-blame.vim' "当前行的git信息
Plug 'tpope/vim-fugitive'

" 检索跳转
Plug 'ctrlpvim/ctrlp.vim' "Ctrl+P文件搜索
Plug 'majutsushi/tagbar' "函数、变量列表
"Plug 'Lokaltog/vim-easymotion' " 快速跳转


" 易读
Plug 'Yggdroot/indentLine' "缩进提示
Plug 'luochen1990/rainbow' " 彩虹括号
Plug 'itchyny/vim-cursorword' "当前词加下划线显示
Plug 'lfv89/vim-interestingwords'  "选中词高亮

"Markdown
"Plug 'plasticboy/vim-markdown' "markdown语法支持
"Plug 'suan/vim-instant-markdown'
Plug 'dhruvasagar/vim-table-mode'
Plug 'iamcco/mathjax-support-for-mkdp' " markdown预览
Plug 'iamcco/markdown-preview.vim' " markdown预览
"Plug 'tenfyzhong/tagbar-markdown.vim' "markdown tagbar
Plug 'mzlogin/vim-markdown-toc' "markdown TOC

" 增强型工具
"Plug 'terryma/vim-multiple-cursors' "多光标编辑
Plug 'mg979/vim-visual-multi', {'branch': 'master'} "多光标编辑
Plug 'junegunn/vim-peekaboo' "增强型剪贴板
Plug 'mbbill/undotree' "撤销重做历史记录

call plug#end()

" ===================插件配置=======================

color gruvbox

"""""""
" coc "
"""""""
let g:coc_global_extensions = [
            \    'coc-snippets',
            \    'coc-explorer',
            \    'coc-marketplace',
            \    'coc-pairs',
            \    'coc-go',
            \    'coc-json',
            \    'coc-python',
            \    'coc-sh',
            \    'coc-prettier',
            \    'coc-html',
            \    'coc-css',
            \    'coc-vimlsp',
            \    'coc-yank',
            \    'coc-translator',
            \    'coc-template',
            \]

" 提升响应速度
set updatetime=100
" 简化补全内容
set shortmess+=c
" TAB补全
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <C-o> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <C-o> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" 规范文件格式
nmap <LEADER>cf :CocCommand prettier.formatFile<CR>
" Use `[g` and `]g` to 导航 诊断
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap keys for gotos
" 跳转定义
nmap <silent> gd <Plug>(coc-definition)
" 跳转样式定义
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" documentation
""显示文档
nnoremap <silent> <LEADER>? :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" 当创建一个新文件时自动插入页眉
autocmd BufNewFile python :CocCommand template.templateTop
" Symbol renaming.
""重命名
nmap <leader>rn <Plug>(coc-rename)
"" 历史剪贴板
nnoremap <silent> <space>p  :<C-u>CocList -A --normal yank<cr>
" coc-translator
"" 弹出翻译
nnoremap <silent> <LEADER>tp :CocCommand translator.popup<CR>
"" 替换翻译
nnoremap <silent> <LEADER>tr :CocCommand translator.replace<CR>

"vim-go
"go代码高亮配置
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1


" undotre
set undofile
set undodir=~/.vim/undodir
nnoremap <leader>y :UndotreeToggle<CR>

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'gruvbox'
let g:airline#extensions#tabline#enabled = 1

" indentline
let g:indentLine_noConcealCursor = 1
let g:indentLine_color_term = 0
let g:indentLine_char = '|'

" nerdtrer
""将F2设置为开关NERDTree的快捷键
map tt :NERDTreeToggle<CR>
""修改树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
""窗口位置
let g:NERDTreeWinPos='left'
""窗口尺寸
let g:NERDTreeSize=30
""窗口是否显示行号
let g:NERDTreeShowLineNumbers=1
""不显示隐藏文件
let g:NERDTreeHidden=0
""打开vim时如果没有文件自动打开NERDTree
autocmd vimenter * if !argc()|NERDTree|endif
""当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""打开vim时自动打开NERDTree并将光标移动到右侧编辑区
autocmd vimenter * NERDTree
wincmd w
autocmd vimenter * wincmd w
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
set guifont=DroidSansMono_Nerd_Font:h11
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
"vnoremap <LEADER>z <plug>NERDCommenterToggle
"noremap <LEADER>z <plug>NERDCommenterToggle

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" dev-icon
augroup nerdtreedisablecursorline
	autocmd!
	autocmd FileType nerdtree setlocal nocursorline
augroup end
let NERDTreeHighlightCursorline = 1
let g:webdevicons_enable_nerdtree = 0
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1


" rainbow
let g:rainbow_active = 1

" tagbar
nmap <LEADER>tb :TagbarToggle<CR>
" 启动时自动focus
let g:tagbar_autofocus = 1

" for ruby, delete if you do not need
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }
let g:tagbar_type_markdown = {
        \ 'ctagstype' : 'markdown',
        \ 'kinds' : [
                \ 'h:headings',
        \ ],
    \ 'sort' : 0
\ }

" git-blame
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

" interestingwords
let g:interestingWordsDefaultMappings = 0
nnoremap <silent> <leader>gl :call InterestingWords('n')<cr>
"vnoremap <silent> <leader>m :call InterestingWords('v')<cr>
"nnoremap <silent> <leader>m :call UncolorAllWords()<cr>

nnoremap <silent> n :call WordNavigation(1)<cr>
nnoremap <silent> N :call WordNavigation(0)<cr>

"" multi_cursor
"let g:multi_cursor_use_default_mapping=1
"" Default mapping
"let g:multi_cursor_next_key='<C-m>'
"let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<Esc>'
"
"markdown preview
if has("mac")
    let g:mkdp_path_to_chrome='open -a /Applications/Google\ Chrome.app'
elseif has("linux")
    let g:mkdp_path_to_chrome='/usr/bin/google-chrome'
endif
let g:mkdp_auto_close=1
nmap <F7> <Plug>MarkdownPreview
nmap <F8> <Plug>StopMarkdownPreview

" 在浏览器预览
function! ViewInBrowser()
    let file = expand("%:p")
    if has("mac")
        let browsers = "open -a \"Google Chrome\""
        exec ":silent ! ". browsers  file
    endif
endfunction
nmap <Leader>vb :call ViewInBrowser()<cr>

" emmet 仅HTML/CSS文件时用
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" markdown
let g:vim_markdown_folding_disabled = 1
nnoremap <silent> <leader>tm :call TableModeToggle<cr>


"" 使用 tab 切换下一个触发点，shit+tab 上一个触发点
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
