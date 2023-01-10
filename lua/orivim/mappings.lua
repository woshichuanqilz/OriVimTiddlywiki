-- mappings

function M.keymap_setup()
  vim.api.nvim_set_keymap('n', 'x', 'C', {noremap = true})
  keymap('n', 'x', 'C', default_opts)
  print("keymap setup")
end
