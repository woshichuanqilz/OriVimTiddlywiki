local M = {}
local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }
-- local lvim = require('lvim').lvim

function M.search_note()
    require('telescope.builtin').find_files { shorten_path = true, cwd = '/home/lizhe/OriNote/notes/' }
    -- { ":lua require('telescopefind_files { shorten_path = true, cwd = '/home/lizhe/OriNote/notes/' }<CR>", "Run current script", silent = true }
end

function M.keymap_setup()
    print("keymap setup")
end

-- [[test.md]]
function M.get_current_word()
  vim.cmd('set iskeyword-=.')
  local current_word = vim.call('expand','<cword>')
  print(current_word)
  vim.cmd('set iskeyword+=.')
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
