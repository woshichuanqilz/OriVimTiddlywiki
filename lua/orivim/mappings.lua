-- mappings
require('file_name_picker')

local M = {}
local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }

function M.keymap_setup(note_path)
  keymap({'n', 'v'}, 'gd', '<cmd>OpenNoteUnderCursor<CR>', default_opts)
  keymap({'n', 'v'}, '<A-q>', '<cmd>execute "normal \\<Plug>Markdown_OpenUrlUnderCursor"<CR>', default_opts)
  vim.cmd('nnoremap <leader>t :only<CR>:Toc<CR>')
  keymap({'n', 'v'}, '<A-f>', ":lua require('telescope.builtin').live_grep({cwd='" .. note_path ..  "'})<CR>", default_opts)
  keymap({'n', 'v'}, '<A-i>', "", default_opts)
end

return M
