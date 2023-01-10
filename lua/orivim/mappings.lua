-- mappings
local M = {}
local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }

function M.keymap_setup()
  vim.api.nvim_set_keymap('n', 'x', 'C', {noremap = true})
  keymap({'n', 'v'}, 'gd', '<cmd>OpenNoteUnderCursor<CR>', default_opts)
end

return M
