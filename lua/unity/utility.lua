local M = {}

local function file_exists(path)
    local f = io.open(path)
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end

M.is_unity_context = function()
    return file_exists(vim.fn.getcwd() .. "/ProjectSettings/ProjectSettings.asset")
end

M.ignored_files = function()
    return {
        "Library",
        "Temp",
        "obj",
        "Builds",
        "Build",
        "Logs",
        "UserSettings",
        "UIElementsSchema",
        "Compiled",
        ".vscode",
        ".idea",
        ".git",
        "**/*.meta",
        "**/*.csproj",
        "**/*.sln",
        "**/*.vsconfig",
        "**/*.sln.DotSettings.user",
    }
end

M.open_active_file_meta = function()
    return M.open_meta(vim.fn.expand('%:p'))
end

M.open_meta = function(file)
    path = file .. ".meta";

    if file_exists(path) then
        vim.cmd.edit(path)
        return true
    end

    return false
end

return M
