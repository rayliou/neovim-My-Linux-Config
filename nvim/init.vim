"检测文件类型
filetype on
syntax enable
"设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制
"好处：误删什么的，如果以前屏幕打开，可以找回
set t_ti= t_te=
" No annoying sound on errors
" 去掉输入错误的提示声音
set title                " change the terminal's title
set novisualbell           " don't beep
set noerrorbells         " don't beep
set t_vb=
set tm=500
"括号配对情况
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2



"  " 鼠标可以移动，调整窗口等
"  set mouse=a
" 超过 window 宽度的行不要折叠
set nowrap
" 自动进入到新打开的窗口
set splitbelow
set splitright
" 打开行号
set number
" 高亮光标所在行
set cursorline
set termguicolors


" 因为失去焦点就会自动保存，所以没有必要使用 swapfile
set noswapfile
" 自动隐藏 command-line
set cmdheight=0
" 让退出 vim 之后 undo 消息不消失
set undofile
" 只有一个全局的 status line，而不是每一个 window 一个
set laststatus=3
" 当打开文件的时候，自动进入到上一次编辑的位置
lua vim.api.nvim_create_autocmd( "BufReadPost", { command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]] })
" 当文件被其他编辑器修改时，自动加载
set autoread
au FocusGained,BufEnter * :checktime
" 当失去焦点或者离开当前的 buffer 的时候保存
set autowrite
autocmd FocusLost,BufLeave * silent! update
" 在 terminal 中也是使用 esc 来进入 normal 模式
tnoremap  <Esc>  <C-\><C-n>
" 映射 leader 键为 ,
let g:mapleader = ','
" 将 q 映射为 <leader>q，因为录制宏的操作比较少，而关掉窗口的操作非常频繁
noremap <leader>q q

" 访问系统剪切板
map <leader>y "+y
map <leader>p "+p
map <leader>d "+d

" 让远程的 server 内容拷贝到系统剪切板中，具体参考 https://github.com/ojroques/vim-oscyank
autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '+' | execute 'OSCYankReg +' | endif
autocmd TextYankPost * if v:event.operator is 'd' && v:event.regname is '+' | execute 'OSCYankReg +' | endif

"""" 使用 z a 打开和关闭 fold
"""set foldlevelstart=99
"""set foldmethod=expr
"""set foldexpr=nvim_treesitter#foldexpr()

" 加载 lua 配置
lua require 'usr.bufferline'
lua require 'usr.code_runner'
lua require 'usr.hydra'
lua require 'usr.nvim-tree'
lua require 'usr.nvim-treesitter'
lua require 'usr.orgmode'
lua require 'usr.packer'
lua require 'usr.telescope'
lua require 'usr.version'
lua require 'usr.which-key'
lua require("colorizer").setup{'css'; 'javascript'; 'vim'; html = { mode = 'foreground';}}
lua require("nvim-surround").setup{}
"lua require('gitsigns').setup{}
lua require('nvim-autopairs').setup{}
lua require('spellsitter').setup{}

" 加载 vim 配置, 参考 https://github.com/jdhao/nvim-config
let s:core_conf_files = [
      \ 'misc.vim',
      \ 'coc.vim',
      \ 'debug.vim',
      \ 'wilder.vim',
      \ 'startify.vim',
      \ 'airline.vim',
      \ ]

for s:fname in s:core_conf_files
  execute printf('source %s/vim/%s', stdpath('config'), s:fname)
endfor

colorscheme desert
colorscheme tokyonight-storm
" keymapping by whichkey doesn't work in neovim 0.8
noremap <Space>bc :BDelete hidden<cr>

" 因为 nvim-treesitter-textobjects 使用 x 来跳转，原始的 x 被映射为 xx
nn xx x

"Smart indent
"set smartindent
set autoindent    " always set autoindenting on
" never add copyindent, case error   " copy the previous indentation on autoindenting

set tabstop=4                " 设置Tab键的宽度        [等同的空格个数]
set shiftwidth=4  " number of spaces to use for autoindenting
set softtabstop=4             " 按退格键时可以一次删掉 4 个空格
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格

set expandtab                " 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]

set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'

set showcmd
" A buffer becomes hidden when it is abandoned
set hidden
set wildmode=list:longest
set ttyfast
"Use arrow key to change buffer"
noremap <left> :bp<CR>
noremap <right> :bn<CR>
nnoremap <F4> :set wrap! wrap?<CR>

hi cursorline cterm=NONE ctermbg=darkred ctermfg=white
hi cursorline guibg=darkred guifg=white
highlight Pmenu guibg=darkgrey guifg=black
highlight PmenuSel guibg=lightgrey guifg=black
highlight Visual guibg=Yellow guifg=black
hi Visual cterm=NONE ctermbg=Yellow ctermfg=black
