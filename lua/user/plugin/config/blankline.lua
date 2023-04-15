M = { }

M.setup = function()
    require("indent_blankline").setup {
        buftype_exclude = { "terminal" },
        filetype_exclude = { "dashboard", "NvimTree", "Plug" },
    }
end
