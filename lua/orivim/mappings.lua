-- mappings
local M = {}
local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }

function M.keymap_setup(note_path)
  -- vim.api.nvim_set_keymap('n', 'x', 'C', {noremap = true})
  keymap({'n', 'v'}, 'gd', '<cmd>OpenNoteUnderCursor<CR>', default_opts)
  keymap({'n', 'v'}, '<A-q>', '<cmd>execute "normal \\<Plug>Markdown_OpenUrlUnderCursor"<CR>', default_opts)
  vim.cmd('nnoremap <leader>t :only<CR>:Toc<CR>')
  keymap({'n', 'v'}, '<A-f>', "<cmd>lua require('telescope.builtin').live_grep('" .. note_path ..  "')<CR>", default_opts)
end

return M
