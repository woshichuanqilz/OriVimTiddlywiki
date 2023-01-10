require('orivim.mappings')

local M = {}
-- local lvim = require('lvim').lvim
M.note_path = '/home/lizhe/OriNote/notes/Ori/'

function M.search_note()
    require('telescope.builtin').find_files { shorten_path = true, cwd = '/home/lizhe/OriNote/notes/' }
    -- { ":lua require('telescopefind_files { shorten_path = true, cwd = '/home/lizhe/OriNote/notes/' }<CR>", "Run current script", silent = true }
end


function M.get_current_char()
  return vim.cmd("echo getline('.')[col('.')-1]")
end

-- test case: [[🤖Copilot.md]]
--
-- Notice
-- 1. location, use bookmark set initial position
-- 2. check if in the square brackets
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
  else
    vim.cmd('normal mz')
  end

  -- copy word in the square brackets
  vim.cmd('normal F[lvt]y')
  -- get register value
  local current_word = vim.fn.getreg('"')
  -- print('current' .. current_word)

  vim.cmd('normal `z')
  -- local current_word = vim.call('expand','<cword>')
  vim.cmd('set iskeyword-=.')
  return current_word
end

-- work done
function M.open_note_under_cursor()
  local current_word = M.get_current_word()
  local full_path = M.note_path .. current_word .. '.md'
  -- print(full_path)
  vim.cmd('e ' .. full_path)
end


function M.create_note(note_name)
  -- accept input
  print('note: ' .. note_name)
end

function M.setup()
  M.keymap_setup()
end


return M
