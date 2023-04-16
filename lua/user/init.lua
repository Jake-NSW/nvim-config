-- Relative Numbers
vim.o.nu = 1
vim.o.rnu = 1

vim.o.autoindent = 1
vim.o.expandtab = 1
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = 1

vim.o.undofile = true

-- Search
vim.o.hlsearch = 0
vim.o.ignorecase = 1
vim.o.incsearch = 1
vim.o.smartcase = 1

-- Interface
vim.o.scrolloff = 8
vim.o.encoding = 'utf-8'
vim.o.cursorline = 1
vim.o.termguicolors = true

vim.opt.list = true

-- Helpers
vim.o.autoread = 1
vim.o.mouse = 'a'

require("user.keymaps").setup()
require("user.plugins").setup()
require('user.options').setup()
require("user.theme").setup()

require('unity').setup()
