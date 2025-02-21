local M = {}

-- Block comments functionality
local function center_text(text)
    local content_width = 60  -- Fixed width (64 - 4 for /* and */)
    local padding = content_width - #text
    local left_padding = math.floor(padding / 2)
    return string.rep(" ", left_padding) .. text .. string.rep(" ", padding - left_padding)
end

function M.create_block_comment()
    local top_bottom = "/*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/"
    local middle_pattern = "/*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/"
    local width = #top_bottom
    
    local title = vim.fn.input("Enter section title: ")
    if title == "" then return end
    
    local centered_title = center_text(title)
    local block = {
        top_bottom,
        "/*" .. centered_title .. "*/",
        middle_pattern
    }
    
    local row = vim.api.nvim_win_get_cursor(0)[1]
    vim.api.nvim_buf_set_lines(0, row-1, row-1, false, block)
end

function M.setup()
    -- Block comments command and mapping
    vim.api.nvim_create_user_command("BlockComment", function()
        M.create_block_comment()
    end, {})
    
    vim.keymap.set('n', '<leader>cc', function()
        M.create_block_comment()
    end, { noremap = true, silent = true, desc = "Insert block comment" })
end

return M 