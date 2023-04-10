vim.call 'plug#begin'

local Plug = vim.fn['plug#']

-- Tree Sitter
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['rev'] = '0.1.1' }) 

vim.call 'plug#end'
