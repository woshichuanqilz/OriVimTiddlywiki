-- mappings
local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }

function keymap_setup()
  vim.api.nvim_set_keymap('n', 'x', 'C', {noremap = true})
  keymap('n', 'x', 'C', default_opts)
  print("keymap setup")
end
