local setup_blankline = function()
    require("indent_blankline").setup {
        buftype_exclude = { "terminal" },
        filetype_exclude = { "dashboard", "NvimTree", "Plug" },
    }
end

--

local setup_autopairs = function()
    require('nvim-autopairs').setup({})
end

--

local setup_illuminate = function()
    require('illuminate').configure({
        -- providers: provider used to get references in the buffer, ordered by priority
        providers = {
            'lsp',
            'treesitter',
            'regex',
        },
        -- delay: delay in milliseconds
        delay = 100,
        -- filetype_overrides: filetype specific overrides.
        -- The keys are strings to represent the filetype while the values are tables that
        -- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
        filetype_overrides = {},
        -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
        filetypes_denylist = {
            'NvimTree',
            'toggleterm',
            'dirvish',
            'fugitive',
        },
        -- filetypes_allowlist: filetypes to illuminate, this is overriden by filetypes_denylist
        filetypes_allowlist = {},
        -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
        -- See `:help mode()` for possible values
        modes_denylist = {},
        -- modes_allowlist: modes to illuminate, this is overriden by modes_denylist
        -- See `:help mode()` for possible values
        modes_allowlist = {},
        -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
        -- Only applies to the 'regex' provider
        -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
        providers_regex_syntax_denylist = {},
        -- providers_regex_syntax_allowlist: syntax to illuminate, this is overriden by providers_regex_syntax_denylist
        -- Only applies to the 'regex' provider
        -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
        providers_regex_syntax_allowlist = {},
        -- under_cursor: whether or not to illuminate under the cursor
        under_cursor = true,
        -- large_file_cutoff: number of lines at which to use large_file_config
        -- The `under_cursor` option is disabled when this cutoff is hit
        large_file_cutoff = nil,
        -- large_file_config: config to use for large files (based on large_file_cutoff).
        -- Supports the same keys passed to .configure
        -- If nil, vim-illuminate will be disabled for large files.
        large_file_overrides = nil,
        -- min_count_to_highlight: minimum number of matches required to perform highlighting
        min_count_to_highlight = 1,
    })
end

--

local setup_bufferline = function()
    require('bufferline').setup({
        options = {
            mode = "buffers",
            themable = false,
            tab_size = 20,
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "  Explorer",
                    text_align = "left",
                    separator = true,
                }
            },
            indicator = {
                style = 'none',
            },
            separator_style = "slant",
        }
    })
end

--

local setup_devicons = function()
    require('nvim-web-devicons').setup({
        override = {
            zsh = {
                icon = "",
                color = "#428850",
                cterm_color = "65",
                name = "Zsh"
            },
        },
        color_icons = true,
        default = true,
        strict = true,
        override_by_filename = {
            [".gitignore"] = {
                icon = "",
                color = "#f1502f",
                name = "Gitignore",
            },
        },
        override_by_extension = {
            ["log"] = {
                icon = "",
                color = "#81e043",
                name = "Log"
            },
        },
    })
end

--

local setup_dressing = function()
    require('dressing').setup({
        input = {
            enabled = true,
            default_prompt = "Input ",
            title_pos = "left",
            insert_only = true,
            start_in_insert = true,
            anchor = "SW",
            border = "rounded",
            relative = "cursor",
            prefer_width = 40,
            width = nil,
            max_width = { 140, 0.9 },
            min_width = { 20, 0.2 },
            buf_options = {},
            win_options = {
                winblend = 10,
                wrap = false,
                list = true,
                listchars = "precedes:…,extends:…",
                sidescrolloff = 0,
            },
            mappings = {
                n = {
                    ["<Esc>"] = "Close",
                    ["<CR>"] = "Confirm",
                },
                i = {
                    ["<C-c>"] = "Close",
                    ["<CR>"] = "Confirm",
                    ["<Up>"] = "HistoryPrev",
                    ["<Down>"] = "HistoryNext",
                },
            },
            override = function(conf)
                return conf
            end,
            get_config = nil,
        },
        select = {
            enabled = true,
            backend = { "telescope" },
            trim_prompt = true,
            telescope = nil,
        }
    })
end

--

local setup_lualine = function()
    -- Configure Custom Extensions

    local nvimtree_extension = {
        sections = {},
        inactive_sections = {},
        filetypes = { 'NvimTree' }
    }

    local toggle_term_extension = {
        sections = {},
        inactive_sections = {},
        filetypes = { 'toggleterm' }
    }

    -- Setup Lualine

    local lualine = require('lualine')
    lualine.setup({
        options = {
            icons_enabled = true,
            theme = 'catppuccin',
            component_separators = { left = '|', right = '|' },
            section_separators = { left = '', right = '' },
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            }
        },
        sections = {
            lualine_a = { { 'mode', } },
            lualine_b = { 'diagnostics' },
            lualine_c = { 'filename', 'lsp_progress' },
            lualine_x = { },
            lualine_y = { { 'filetype', colored = false, } },
            lualine_z = { { 'location' }, { 'progress', padding = 2, } }
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { 'filename' },
            lualine_x = { 'location' },
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = { nvimtree_extension, toggle_term_extension }
    })

    lualine.refresh()
end

--

local setup_toggleterm = function()
    local powershell_options = {
        shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
        shellcmdflag =
        "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
        shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
        shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
        shellquote = "",
        shellxquote = "",
    }

    for option, value in pairs(powershell_options) do
        vim.opt[option] = value
    end

    require('toggleterm').setup({
        open_mapping = '<C-t>',
        direction = 'horizontal',
        float_opts = {
            border = 'curved'
        }
    })
end

--

M = {}

M.setup = function()
    require('scope').setup()
    -- require('fidget').setup()
    require('which-key').setup()

    -- Setup in-file plugins
    setup_illuminate()
    setup_autopairs()
    setup_blankline()
    setup_devicons()
    setup_dressing()
    setup_lualine()
    setup_bufferline()
    setup_toggleterm()

    local path = 'user.options.'

    -- Setup external plugins
    require(path .. 'nvimtree').setup()
    require(path .. 'telescope')
    require(path .. 'treesitter')
    require(path .. 'lsp')
end

return M
