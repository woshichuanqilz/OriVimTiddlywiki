local M = {}
local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }
-- local lvim = require('lvim').lvim
M.note_path = '/home/lizhe/OriNote/notes'

function M.search_note()
    require('telescope.builtin').find_files { shorten_path = true, cwd = '/home/lizhe/OriNote/notes/' }
    -- { ":lua require('telescopefind_files { shorten_path = true, cwd = '/home/lizhe/OriNote/notes/' }<CR>", "Run current script", silent = true }
end

function M.keymap_setup()
    print("keymap setup")
end

function M.get_current_char()
  return vim.cmd("echo getline('.')[col('.')-1]")
end

-- [[test.md]]
function M.get_current_word()
  -- file name contains `.`
  vim.cmd('set iskeyword+=.')
  local current_char = M.get_current_char()
  -- if on [
  if current_char == '[' then
    vim.cmd('normal mzw')
  -- if on ]
  elseif current_char == ']' then
    vim.cmd('normal mzw')
    current_char = M.get_current_char()
    vim.cmd('normal `z')
  end

  local current_word = vim.call('expand','<cword>')
  print(current_char)
  vim.cmd('set iskeyword-=.')
end

function M.open_note_under_cursor()
  local current_word = M.get_current_word()
  -- local full_path = note_path .. 
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
