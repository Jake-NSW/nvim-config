local function fexists(path)
	local f = io.open(path)
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

-- vim-plug
vim.call 'plug#begin'
local Plug = vim.fn['plug#']
-- Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug 'neovim/nvim-lspconfig'
Plug 'tikhomirov/vim-glsl'
Plug 'https://github.com/gpanders/editorconfig.nvim.git'
Plug 'https://github.com/gpanders/vim-scdoc.git'
Plug 'https://github.com/scottymoon/vim-twilight.git'
vim.call 'plug#end'

-- tree-sitter setup

--[[
require('nvim-treesitter.configs').setup {
	ensure_installed = {
		'c',
		'lua',
		'python',
		'javascript',
		'gdscript',
		'glsl',
		'go',
		'json',
		'java',
		'make',
		'bash',
		'cpp',
		'rust',
		'zig',
		'markdown',
		'scheme',
		'toml',
		'fennel',
		'ron',
	},
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	}
}
]]

-- lspconfig setup
local lsp = require 'lspconfig'
lsp.clangd.setup {
	filetypes = {'c', 'cc', 'cpp', 'cxx', 'h', 'hh', 'hpp', 'hxx'}
}
--lsp.gdscript.setup {}
lsp.rust_analyzer.setup {}

lsp.csharp_ls.setup {}

-- main config
vim.cmd 'set nocp'
vim.cmd 'set nonu'
vim.cmd 'set nuw=8'
vim.cmd 'set signcolumn=number'
vim.cmd 'set ic'
vim.cmd 'set scs'
vim.cmd 'set lbr'
vim.cmd 'set so=1'
vim.cmd 'set ar'
vim.cmd 'set nosmd'
vim.cmd 'set nosc'
vim.cmd 'set shm+=F'
vim.cmd 'set ls=1'
vim.cmd 'set mouse='
vim.cmd 'set nosi'
vim.cmd 'set cinoptions=L0,l1,N-s,t0,j1,J1,(s'
vim.cmd 'set tgc'
-- if fexists(os.getenv('XDG_CONFIG_HOME') .. '/light-theme') then
	-- https://raw.githubusercontent.com/oxyacety/nvim-Leuven-colors/main/Leuven.vim
	-- vim.cmd 'colo Leuven'
-- else
	vim.cmd 'colo twilight'
-- end

vim.cmd 'set ut=1000'
vim.diagnostic.config {virtual_text = false}
vim.cmd 'autocmd CursorHold * lua vim.diagnostic.open_float({focus=false, scope="line"})'
for _, type in ipairs({'Error', 'Warn', 'Hint', 'Info'}) do
	local hl = 'DiagnosticSign' .. type
	vim.fn.sign_define(hl, {text = '', texthl = hl, numhl = hl})
end

-- move across screen lines rather than physical lines
vim.api.nvim_set_keymap('n', '<Up>', 'gk', {noremap = true})
vim.api.nvim_set_keymap('v', '<Up>', 'gk', {noremap = true})
vim.api.nvim_set_keymap('i', '<Up>', '<C-o>gk', {noremap = true})
vim.api.nvim_set_keymap('n', '<Down>', 'gj', {noremap = true})
vim.api.nvim_set_keymap('v', '<Down>', 'gj', {noremap = true})
vim.api.nvim_set_keymap('i', '<Down>', '<C-o>gj', {noremap = true})

-- some emacs bindings im used to from the shell
vim.api.nvim_set_keymap('n', '<C-a>', '0', {noremap = true})
vim.api.nvim_set_keymap('v', '<C-a>', '0', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-a>', '<C-o>0', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-e>', '$', {noremap = true})
vim.api.nvim_set_keymap('v', '<C-e>', '$', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-e>', '<C-o>$', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', 'D', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-k>', '<C-o>D', {noremap = true})

-- trim whitespace
vim.api.nvim_set_keymap('n', 'Q', ':%s/\\s\\+$//g<CR><C-o>', {noremap = true})

-- clear search highlight
vim.api.nvim_set_keymap('n', '<Esc>', ':noh<CR><Esc>', {noremap = true})

-- plugin settings
vim.cmd 'let g:python_recommended_style=1'
