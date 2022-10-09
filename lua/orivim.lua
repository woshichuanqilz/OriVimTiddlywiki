local M = {}
local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }

function M.search_tid()
    print("Hello from orivim")
    require('telescope.builtin').find_files { shorten_path = true, cwd = "/home/lizhe/OriNote/OriWiki/tiddlers/" }
end


function M.setup()
    vim.api.nvim_set_keymap('n', 'x', 'C', {noremap = true})
    -- keymap('n', 'x', 'C', default_opts)
end


return M
