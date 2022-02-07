vim.cmd("packadd packer.nvim")

require("packer").startup({
  function(use)
    use {'lewis6991/impatient.nvim', config = [[require('impatient')]]}
    use({"wbthomason/packer.nvim", opt = true})
    -- 基础
    use 'nvim-lua/plenary.nvim' -- 很多 lua 插件依赖的库
    use {'neoclide/coc.nvim', branch = 'release'} -- lsp
    use 'nvim-treesitter/nvim-treesitter' -- 基于语义的高亮
    use 'kyazdani42/nvim-web-devicons' -- 众多插件的图标
    use 'folke/which-key.nvim' -- 用于配置和显示快捷键
    -- ui
    use 'liuchengxu/vista.vim' -- 导航栏
    use 'kyazdani42/nvim-tree.lua' -- 文件树
    use 'mhinz/vim-startify' -- 启动界面
    use 'vim-airline/vim-airline' -- 状态栏
    use 'vim-airline/vim-airline-themes'
    use 'folke/tokyonight.nvim' -- 颜色主题
    use 'akinsho/bufferline.nvim' -- buffer
    use 'kazhala/close-buffers.nvim'
    use 'simeji/winresizer' -- 更加方便的调节窗口的大小
    use 'gelguy/wilder.nvim' -- 更加智能的命令窗口
    use 'romgrk/fzy-lua-native'
    -- git 管理
    use 'tpope/vim-fugitive'
    use 'rhysd/git-messenger.vim' -- 利用 git blame 显示当前行的 commit message
    -- 基于 telescope 的搜索
    use 'nvim-telescope/telescope.nvim'
    use {'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make' } -- telescope 搜索的插件，可以提升搜索效率
    use 'fannheyward/telescope-coc.nvim' -- 搜索 coc 提供的符号
    use 'dhruvmanila/telescope-bookmarks.nvim' -- 搜索 bookmarks
    -- 快速的代码执行
    use 'voldikss/vim-floaterm' -- 以悬浮窗口的形式打开终端
    use { 'CRAG666/code_runner.nvim',
      requires = 'nvim-lua/plenary.nvim' } -- 一键运行代码
    -- markdown
    use({ "iamcco/markdown-preview.nvim", ft = "markdown",
      run = "cd app && yarn install" }) -- 预览
    use 'mzlogin/vim-markdown-toc' -- 自动目录生成
    use 'dhruvasagar/vim-table-mode' -- 快速编辑 markdown 的表格
    -- 高效编辑
    use 'tpope/vim-commentary' -- 快速注释代码
    use 'tpope/vim-surround' -- 快速编辑单词两侧的符号
    use 'windwp/nvim-autopairs' -- 自动括号匹配
    use 'honza/vim-snippets' -- 安装公共的的 snippets
    use 'mbbill/undotree' -- 显示编辑的历史记录
    -- c/c++
    use 'jackguo380/vim-lsp-cxx-highlight' -- 为 c/cpp 提供基于 lsp 的高亮
    use 'skywind3000/vim-cppman' -- http://cplusplus.com/ 和 http://cppreference.com/ 获取文档
    -- 其他
    use 'MattesGroeger/vim-bookmarks' -- 书签
    use 'pwntester/octo.nvim' -- 在 neovim 中使用 github cli
    use 'windwp/nvim-spectre' -- 媲美 vscode 的多文件替换
    use 'norcalli/nvim-colorizer.lua'
    use 'CoatiSoftware/vim-sourcetrail' -- sourcetrail 插件
    use {'nvim-orgmode/orgmode',
      config = function() require('orgmode').setup{} end} -- 日程管理
    use 'rcarriga/nvim-notify' -- 在 nvim 中的 notification
    use 'wakatime/vim-wakatime' -- 用于统计代码时间
    use 'romgrk/nvim-treesitter-context' -- 显示当前的函数
  end,
})