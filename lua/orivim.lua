local M = {}
local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }
local lvim = require('lvim').lvim

function M.search_note()
    require('telescope.builtin').find_files { shorten_path = true, cwd = '/home/lizhe/OriNote/notes/' }
    require('telescope.builtin').planets{}
    -- { ":lua require('telescopefind_files { shorten_path = true, cwd = '/home/lizhe/OriNote/notes/' }<CR>", "Run current script", silent = true }
end

function M.keymap_setup()
    print("keymap setup")
    lvim.builtin.which_key.mappings["n"] = { ":lua require('telescope.builtin').find_files { shorten_path = true, cwd = '/home/lizhe/OriNote/notes/' }<CR>", "Run current script", silent = true }
end

function M.create_note(note_name)
  -- accept input
  print('note: ' .. note_name)
end

function M.setup()
  -- vim.api.nvim_set_keymap('n', 'x', 'C', {noremap = true})
  -- keymap('n', 'x', 'C', default_opts)
  M.keymap_setup()
end


return M
