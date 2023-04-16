M = { }

M.setup = function()
    vim.call 'plug#begin'

    local Plug = vim.fn['plug#']

    -- Utility
    Plug('nvim-lua/plenary.nvim')
    Plug('tiagovla/scope.nvim')
    Plug('folke/which-key.nvim')

    -- Lsp
    Plug('neovim/nvim-lspconfig')
    Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
    Plug('williamboman/mason.nvim')
    Plug('williamboman/mason-lspconfig.nvim')
    Plug('folke/neodev.nvim')

    -- Autocompletion
    Plug('L3MON4D3/LuaSnip', { ['tag'] = 'v1.*', ['do'] = 'make install_jsregexp' })
    Plug('hrsh7th/nvim-cmp')
    Plug('hrsh7th/cmp-nvim-lsp')
    Plug('saadparwaiz1/cmp_luasnip')

    -- Terminal
    Plug('akinsho/toggleterm.nvim', { ['tag'] = '*' } ) --[[ https://github.com/akinsho/toggleterm.nvim ]]--

    -- User Interface
    Plug('nvim-tree/nvim-tree.lua') --[[ https://github.com/nvim-tree/nvim-tree.lua ]]--
    Plug('nvim-tree/nvim-web-devicons') --[[ https://github.com/nvim-tree/nvim-web-devicons ]]--
    Plug('nvim-telescope/telescope.nvim', { ['rev'] = '0.1.1' }) 
    Plug('nvim-lualine/lualine.nvim') --[[ https://github.com/nvim-lualine/lualine.nvim ]]--
    Plug('lukas-reineke/indent-blankline.nvim') --[[ https://github.com/lukas-reineke/indent-blankline.nvim ]]--
    Plug('stevearc/dressing.nvim') --[[ https://github.com/stevearc/dressing.nvim ]]--
    Plug('anuvyklack/windows.nvim') --[[ https://github.com/anuvyklack/windows.nvim ]]--
    Plug('akinsho/bufferline.nvim', { ['tag'] = 'v3.*' }) --[[ https://github.com/akinsho/bufferline.nvim ]]--
    Plug('j-hui/fidget.nvim')

    -- Themes
    Plug('ellisonleao/gruvbox.nvim') --[[ https://github.com/ellisonleao/gruvbox.nvim ]]--
    Plug('sainnhe/gruvbox-material') --[[ https://github.com/sainnhe/gruvbox-material ]]--
    Plug('rebelot/kanagawa.nvim') --[[ https://github.com/rebelot/kanagawa.nvim ]]--
    Plug('folke/tokyonight.nvim') --[[ https://github.com/rebelot/kanagawa.nvim ]]--

    vim.call 'plug#end'
end

return M
