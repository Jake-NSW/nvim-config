--[[
if vim.loop.os_uname().sysname == "Windows_NT" then
  require('nvim-treesitter.install').compilers = { "clang" }
end

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "c_sharp", "c", "lua", "vim", "vimdoc", "query" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
]]--
