M = {}

M.setup = function()
    vim.o.background = "dark"

    local current = 'catppuccin'

    if current == "catppuccin" then
        require("catppuccin").setup({
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            background = {
                -- :h background
                light = "latte",
                dark = "mocha",
            },
            transparent_background = false,
            show_end_of_buffer = false, -- show the '~' characters after the end of buffers
            term_colors = false,
            dim_inactive = {
                enabled = true,
                shade = "dark",
                percentage = 0.15,
            },
            no_italic = false, -- Force no italic
            no_bold = false,   -- Force no bold
            styles = {
                comments = { "italic" },
                conditionals = { "italic" },
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
            },
            color_overrides = {
            },
            custom_highlights = function(colors)
                return {
                    TelescopePromptTitle   = { fg = colors.surface2 },
                    TelescopePromptNormal  = { bg = colors.surface2 },
                    TelescopePromptPrefix  = { bg = colors.surface2 },
                    TelescopePromptBorder  = { bg = colors.surface2, fg = colors.surface2 },
                    TelescopeResultsTitle  = { fg = colors.text },
                    TelescopeResultsNormal = { bg = colors.base },
                    TelescopeResultsBorder = { bg = colors.base, fg = colors.base },
                    TelescopePreviewTitle  = { fg = colors.crust },
                    TelescopePreviewNormal = { bg = colors.crust },
                    TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
                    StatusLine = { bg = colors.crust, fg = colors.crust },
                }
            end,
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                telescope = true,
                notify = false,
                mini = false,
                -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
            },
        })

        -- setup must be called before loading
        vim.cmd.colorscheme "catppuccin"
    end

    if current == 'kanagawa' then
        -- Kanagawa Options
        local theme = require('kanagawa')
        theme.setup({
            compile = false,  -- enable compiling the colorscheme
            undercurl = true, -- enable undercurls
            commentStyle = { italic = false },
            functionStyle = {},
            keywordStyle = { italic = true },
            statementStyle = { bold = true },
            typeStyle = {},
            transparent = false,   -- do not set background color
            dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
            terminalColors = true, -- define vim.g.terminal_color_{0,17}
            colors = {
                -- add/modify theme and palette colors
                palette = {},
                theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
            },
            overrides = function(colors) -- add/modify highlights
                local palette = colors.theme
                return {
                    TelescopeTitle = { fg = palette.ui.special, bold = true },
                    TelescopePromptNormal = { bg = palette.ui.bg_p1 },
                    TelescopePromptBorder = { fg = palette.ui.bg_p1, bg = palette.ui.bg_p1 },
                    TelescopeResultsNormal = { fg = palette.ui.fg_dim, bg = palette.ui.bg_m1 },
                    TelescopeResultsBorder = { fg = palette.ui.bg_m1, bg = palette.ui.bg_m1 },
                    TelescopePreviewNormal = { bg = palette.ui.bg_dim },
                    TelescopePreviewBorder = { bg = palette.ui.bg_dim, fg = palette.ui.bg_dim },
                    Pmenu = { fg = palette.ui.shade0, bg = palette.ui.bg_p1 },
                    PmenuSel = { fg = "NONE", bg = palette.ui.bg_p2 },
                    PmenuSbar = { bg = palette.ui.bg_m1 },
                    PmenuThumb = { bg = palette.ui.bg_p2 },
                    NormalDark = { fg = palette.ui.fg_dim, bg = palette.ui.bg_m3 },
                    MasonNormal = { bg = palette.ui.bg_m3, fg = palette.ui.fg_dim },
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
            sidebars = { "terminal", "help", "NvimTree", "qf" },
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

        vim.cmd [[colorscheme tokyonight]]
    end
end

return M
