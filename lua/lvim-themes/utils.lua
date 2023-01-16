local M = {}

---Call {callback} on ColorScheme event
function M.on_highlights(callback)
  vim.api.nvim_create_autocmd("ColorScheme", {
    group = "lvim-themes",
    callback = callback,
  })
end

---@param name string
---@param ...string fallbacks
---@return {fg: string, bg: string}
function M.get_hl_by_name(name, ...)
  local ok, hl = pcall(vim.api.nvim_get_hl_by_name, name, true)
  local fallbacks = { ... }
  for i = 1, #fallbacks do
    if hl[true] or not ok then
      ok, hl = pcall(vim.api.nvim_get_hl_by_name, fallbacks[i], true)
    end
  end

  if not ok then
    hl = {}
  end

  hl.fg = string.format("#%06x", hl.foreground or 0)
  hl.bg = string.format("#%06x", hl.background or 0)
  return hl
end

function M.set_hl_fg_bg(group, fg, bg)
  vim.cmd("hi " .. group .. " guifg=" .. fg .. " guibg=" .. bg)
end

return M
