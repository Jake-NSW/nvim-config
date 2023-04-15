M = { }

M.setup = function()
    vim.o.background = "dark"

    local current = 'kanagawa'
    if current == 'kanagawa' then
        -- Kanagawa Options
        theme = require('kanagawa')
        theme.setup({
            compile = false,             -- enable compiling the colorscheme
            undercurl = true,            -- enable undercurls
            commentStyle = { italic = false },
            functionStyle = {},
            keywordStyle = { italic = true },
            statementStyle = { bold = true },
            typeStyle = {},
            transparent = false,         -- do not set background color
            dimInactive = true,         -- dim inactive window `:h hl-NormalNC`
            terminalColors = true,       -- define vim.g.terminal_color_{0,17}
            colors = {                   -- add/modify theme and palette colors
                palette = {},
                theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
            },
            overrides = function(colors) -- add/modify highlights
                local theme = colors.theme
                return {
                    TelescopeTitle = { fg = theme.ui.special, bold = true },
                    TelescopePromptNormal = { bg = theme.ui.bg_p1 },
                    TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
                    TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
                    TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
                    TelescopePreviewNormal = { bg = theme.ui.bg_dim },
                    TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
                }
            end,
            theme = "wave",
            background = {
                dark = "wave",
                light = "lotus"
            },
        })

        vim.cmd([[colorscheme kanagawa-dragon]]);
    end

    if current == 'tokyonight' then
        local util = require("tokyonight.util")

        require("tokyonight").setup({
            style = "night",
            transparent = false,
            terminal_colors = true,
            styles = {
                coments = { italic = true },
                keywords = { italic = true },
                sidebars = "dark",
                floats = "dark",
            },
            sidebars = {"terminal", "help", "NvimTree", "qf" },
            on_colors = function(colors)
                colors.hint = colors.orange
                colors.error = "#ff0000"
            end,
            on_highlights = function(hl, c)
                local prompt = "#2d3149"

                hl.TelescopeNormal = {
                  bg = c.bg_dark,
                  fg = c.fg_dark,
                }
                hl.TelescopeBorder = {
                  bg = c.bg_dark,
                  fg = c.bg_dark,
                }

                -- Preview
                local preview = c.fd_dark
                hl.TelescopePreviewNormal = {
                  bg = preview,
                  fg = preview,
                }
                hl.TelescopePreviewBorder = {
                  bg = c.bg_dark,
                  fg = c.bg_dark,            
                }
                hl.TelescopePreviewTitle = {
                  bg = c.bg_dark,
                  fg = c.bg_dark,            
                }

                -- Prompt
                hl.TelescopePromptNormal = {
                  bg = prompt,
                }
                hl.TelescopePromptBorder = {
                  bg = prompt,
                  fg = prompt,
                }
                hl.TelescopePromptTitle = {
                  bg = prompt,
                  fg = prompt,
                }

                -- Results
                hl.TelescopeResultsTitle = {
                  bg = c.bg_dark,
                  fg = c.bg_dark,
                }
            end,
        })

        vim.cmd[[colorscheme tokyonight]]
    end
end

return M
