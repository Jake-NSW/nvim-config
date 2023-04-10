vim.call 'plug#begin'

local Plug = vim.fn['plug#']

-- Tree Sitter
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['rev'] = '0.1.1' }) 
Plug('nvim-lualine/lualine.nvim') --[[ https://github.com/nvim-lualine/lualine.nvim ]]--
Plug('nvim-tree/nvim-web-devicons') -- [[ https://github.com/nvim-tree/nvim-web-devicons ]]--
Plug('lukas-reineke/indent-blankline.nvim') --[[ https://github.com/lukas-reineke/indent-blankline.nvim ]]--

-- Themes
Plug('ellisonleao/gruvbox.nvim')
Plug('sainnhe/gruvbox-material')

vim.call 'plug#end'
