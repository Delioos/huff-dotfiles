local M = {}

-- Function to align stack comments in the current buffer
function M.align_stack_comments()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local max_code_length = 0
    local lines_with_stack = {}
    local needs_formatting = false

    -- First pass: find lines with stack comments and maximum code length
    for i, line in ipairs(lines) do
        -- Match lines that have code followed by stack comments
        local code, comment = line:match("^(%s*[^/]-)%s*(//%s*%[.+%])%s*$")
        if code and comment then
            local trimmed_code = code:gsub("%s+$", "")
            max_code_length = math.max(max_code_length, #trimmed_code)
            lines_with_stack[i] = {code = trimmed_code, comment = comment}
            
            -- Check if this line needs formatting
            local current_padding = #code - #trimmed_code
            if current_padding ~= 2 or #code + #comment ~= #line then
                needs_formatting = true
            end
        end
    end

    -- Only proceed if formatting is needed
    if not needs_formatting then
        return
    end

    -- Second pass: align the comments
    for line_num, parts in pairs(lines_with_stack) do
        local padding = string.rep(" ", max_code_length - #parts.code + 2)
        local new_line = parts.code .. padding .. parts.comment
        vim.api.nvim_buf_set_lines(0, line_num - 1, line_num, false, {new_line})
    end
end

-- Function to setup the plugin
function M.setup()
    -- Create an autocommand group
    local group = vim.api.nvim_create_augroup("HuffFormatter", { clear = true })

    -- Create autocommand for Huff files
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = group,
        pattern = "*.huff",
        callback = function()
            M.align_stack_comments()
        end
    })

    -- Add a command to manually trigger formatting
    vim.api.nvim_create_user_command("AlignHuffStack", function()
        M.align_stack_comments()
    end, {})
end

return M 