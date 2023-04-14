M = { }

local utility = require('unity.utility')

M.setup = function()
    if not utility.is_unity_context() then
        return
    end

    vim.api.nvim_create_user_command('OpenUnityMeta', utility.open_active_file_meta, { })
end

return M
