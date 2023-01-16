local M = {}

function M.setup(config)
  local found, theme = pcall(require, "lvim-themes.themes." .. config.theme)
  if not found then
    print("[lvim-themes]: theme '" .. config.theme .. "' not found!")
    return
  end

  vim.api.nvim_create_augroup("lvim-themes", {})

  theme.setup(config)
end

return M
