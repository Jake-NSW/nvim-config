M = {}


M.setup = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local api = require('nvim-tree.api')
    local plugin = require('nvim-tree')
    plugin.setup({
        sort_by = "case_sensitive",
        sync_root_with_cwd = true,
        renderer = {
            group_empty = true,
            indent_width = 1,
            root_folder_label = false,
        },
        view = {
            mappings = {
                custom_only = false,
                list = {
                    -- Unbind Ctrl-E
                    { key = "<C-e>", action = "", action_cb = "" }
                }
            }
        },
        filters = {
            dotfiles = true,
        },
    })

    local api = require("nvim-tree.api")
    api.events.subscribe(api.events.Event.FileCreated, function(file)
        vim.cmd("edit " .. file.fname)
    end)

    vim.api.nvim_set_keymap("n", "<C-e>", ":NvimTreeFocus<cr>", { silent = true, noremap = true })
    vim.api.nvim_set_keymap("n", "<leader><C-e>", ":NvimTreeFindFile<cr>", { silent = true, noremap = true })
end

return M
