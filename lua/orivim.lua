local M = {}
local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }
local notify = require('notify')
-- local lvim = require('lvim').lvim
M.note_path = '/home/lizhe/OriNote/notes/Ori/'
M.fMap = {}


function M.init_path_map()
  local file = io.open(M.note_path .. '../note_paths.txt', "r");
  if (file == nil) then return end
  local index = 0
  local k = ''
  local v = ''
  for line in file:lines() do
    if index % 2 == 0 then
      k = line
    else
      M.fMap[k] = line
    end
    index = index + 1
  end
end

function M.search_note()
    require('telescope.builtin').find_files { shorten_path = true, cwd = '/home/lizhe/OriNote/notes/' }
    -- { ":lua require('telescopefind_files { shorten_path = true, cwd = '/home/lizhe/OriNote/notes/' }<CR>", "Run current script", silent = true }
end

M.update_tags = function()
  command =  '/home/lizhe/.local/share/lunarvim/site/pack/packer/start/orivim/GrabTags.py ' .. M.note_path
  os.execute(command)
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
  -- print(vim.inspect(current_word))
  -- print(current_word)
  -- print(vim.inspect(M.fMap[current_word]))
  if M.fMap[current_word] == nil then
    notify("Not Exist", vim.log.levels.WARN, {
      title = "Mind",
      icon = ""
    })
  else
    local fp = M.note_path .. M.fMap[current_word]
    vim.cmd('vs ' .. fp)
  end
end


function M.create_note(note_name)
  -- accept input
  print('note: ' .. note_name)
end

function M.set_autoCommand()
  vim.api.nvim_create_user_command(
    'OpenNoteUnderCursor',
    function()
      M.open_note_under_cursor()
    end,
    { desc = 'Open note under cursor.', }
  )

  -- vim.api.nvim_create_user_command(
  --   'df',
  --   function()
  --     vim.cmd('!rm %')
  --   end,
  --   { desc = 'Open note under cursor.', }
  -- )

end


function M.keymap_setup(note_path)
  keymap({'n', 'v'}, 'gd', '<cmd>OpenNoteUnderCursor<CR>', default_opts)
  keymap({'n', 'v'}, '<A-q>', '<cmd>execute "normal \\<Plug>Markdown_OpenUrlUnderCursor"<CR>', default_opts)
  vim.cmd('nnoremap <leader>to :only<CR>:Toc<CR>')
  vim.cmd("nnoremap <leader>ta :lua require('orivim.file_name_picker').insert_tag()<CR>")
  keymap({'n', 'v'}, '<A-f>', ":lua require('telescope.builtin').live_grep({cwd='" .. note_path ..  "'})<CR>", default_opts)
  keymap({'n', 'v', 'i'}, '<A-i>', "<cmd>lua require('orivim.file_name_picker').insert_internal_link()<CR>", default_opts)
end


function M.setup()
  vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.md" },
    callback = function ()
      M.keymap_setup(M.note_path)
      M.set_autoCommand()
    end,
  })

  -- Create User Command
  vim.api.nvim_create_user_command('UpdateTags', 'lua require("orivim.file_name_picker").update_tags()<CR>', {})
end

function M.init()
 M.init_path_map()
end

M.init()
return M

