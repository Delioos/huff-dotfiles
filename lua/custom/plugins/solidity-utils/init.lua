local M = {}

-- Forge formatter functionality
function M.format_solidity()
    local file_path = vim.fn.expand('%:p')
    local cmd = string.format("forge fmt %s", file_path)
    
    local output = vim.fn.system(cmd)
    
    if vim.v.shell_error ~= 0 then
        vim.notify("Forge formatter failed: " .. output, vim.log.levels.ERROR)
        return
    end
    
    vim.cmd('e!')
end

function M.setup()
    -- Forge formatter command and mapping
    vim.api.nvim_create_user_command("Format", function()
        M.format_solidity()
    end, {})
    
    vim.keymap.set('n', '<leader>f', function()
        M.format_solidity()
    end, { noremap = true, silent = true, desc = "Format Solidity file" })
end

return M 