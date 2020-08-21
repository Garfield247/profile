let mapleader=" "

set nocompatible

set t_Co=256
"开启语法高亮
if has("syntax")
  syntax on
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
" 插件
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline' " vim状态栏

Plug 'morhetz/gruvbox'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'scrooloose/nerdcommenter'

"Plug 'irblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'

"Plug 'jiangmiao/auto-pairs'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'godlygeek/tabular'
Plug 'luochen1990/rainbow'
Plug 'plasticboy/vim-markdown'
Plug 'suan/vim-instant-markdown'
"Plug 'majutsushi/tagbar'
Plug 'Lokaltog/vim-easymotion'
Plug 'fatih/vim-go'
Plug 'itchyny/vim-cursorword'
Plug 'lfv89/vim-interestingwords'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'ryanoasis/vim-devicons'
call plug#end()

" ===================插件配置=======================

color gruvbox

" coc
let g:coc_global_extensions = [
            \    'coc-snippets',
            \    'coc-pairs',
            \    'coc-go',
            \    'coc-json',
            \    'coc-python',
            \]
" 在保存时规范文件格式
command! -nargs=0 Prettier :CocCommand prettier.formatFile

nnoremap <silent>W :call <SID>show_doc()<CR>

function! s:show_doc()
    if (index(['vim','help'],&filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

nmap <F2> <Plug>(coc-rename)
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" undotre
set undofile
set undodir=~/.vim/undodir
nnoremap <leader>y :UndotreeToggle<CR>

" airline
let g:airline_powerline_fonts = 1
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
let g:NERDTreeHidden=1
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
"set guifont=DroidSansMono_Nerd_Font:h11
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




" rainbow
let g:rainbow_active = 1

" tagbar
nmap <F9> :TagbarToggle<CR>
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

" interestingwords
nnoremap <silent> <leader>m :call InterestingWords('n')<cr>
vnoremap <silent> <leader>m :call InterestingWords('v')<cr>
nnoremap <silent> <leader>m :call UncolorAllWords()<cr>

nnoremap <silent> n :call WordNavigation(1)<cr>
nnoremap <silent> N :call WordNavigation(0)<cr>

" multi_cursor
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
