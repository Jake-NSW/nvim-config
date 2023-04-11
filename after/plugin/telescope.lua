--[[
Helpful Code
Picker - https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/pickers.lua
--]]


require('telescope').setup({
    defaults = {
        color_devicons = true,
        prompt_prefix = " ",
        selection_caret = " ",
    }
})

local builtin = require('telescope.builtin')
local utils = require('telescope.utils')
local themes = require('telescope.themes')

local M = { }

-- Context Aware Search
M.project_files = function()
    local _, ret, stderr = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })
    local name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")

    local layout = {
        width = 0.6,
        prompt_position = "top",
        height = 0.6,
        preview_width = 0.4,
    }

    if ret == 0 then
        require('telescope.builtin').git_files({
            sorting_strategy = "ascending",
            layout_config = layout,
            prompt_title = "",
            prompt_prefix = "Repo  ",
            path_display = { "truncate" },
            hidden = true,
            results_title = "\"" .. name .. "\" Project Files",
        })
    else
        require('telescope.builtin').find_files({
            sorting_strategy = "ascending",
            layout_config = layout,
            prompt_title = "",
            prompt_prefix = "Files  ",
            results_title = "\"" .. name .. "\" Project Files",
            path_display = { "truncate" },
            hidden = true,
            file_ignore_patterns = {
                ".git/",
            },
        })
    end
end

-- Quick Edit Config
M.config_files = function()
    local layout = {
        prompt_position = "bottom",
        width = 0.4,
        height = 0.4,
        preview_width = 0.6,
    }

    builtin.find_files({
        layout_config = layout,
        prompt_title = "",
        results_title = "Options",
        preview_title = "",
        cwd = "~/AppData/Local/nvim/",
        path_display = { "truncate" },
        hidden = true,
        file_ignore_patterns = {
            "**/*.ttf",
            "**/*.otf",
            "**/*.exe",
            ".git/*",
        },
    })
end

vim.keymap.set('n', '<leader><C-p>', M.config_files, {});
vim.keymap.set('n', '<C-p>', M.project_files, { });
