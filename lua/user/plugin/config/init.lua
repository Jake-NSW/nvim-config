M = { }
local package = 'user.plugin.config.'

M.configure = function()
    require(package .. 'blankline')
    require(package .. 'devicons')
    require(package .. 'dressing')
    require(package .. 'lualine')
    require(package .. 'nvimtree')
    require(package .. 'telescope')
    require(package .. 'toggleterm')
    require(package .. 'treesitter')
end

return M
