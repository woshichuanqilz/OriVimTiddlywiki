local utils = require "lvim-themes.utils"

local M = {}

function M.telescope(config)
  lvim.builtin.telescope.defaults.layout_strategy = "flex"
  lvim.builtin.telescope.defaults.selection_caret = "❯ "
  lvim.builtin.telescope.defaults.borderchars = { "🬂", "▐", "🬭", "▌", "🬕", "🬨", "🬷", "🬲" }

  lvim.builtin.telescope.theme = "center"
  lvim.builtin.telescope.defaults.results_title = false
  lvim.builtin.telescope.defaults.sorting_strategy = "ascending"
  lvim.builtin.telescope.defaults.layout_config = {
    prompt_position = "top",
    height = 0.85,
    width = 0.85,
    center = {
      height = 0.4,
      preview_cutoff = 40,
      width = 0.5,
    },
    horizontal = {
      preview_cutoff = 120,
      preview_width = 0.6,
    },
    vertical = {
      preview_cutoff = 40,
    },
    flex = {
      flip_columns = 150,
    },
  }

  if config.set_highlights then
    utils.on_highlights(function()
      local c = {
        normal = utils.get_hl_by_name "Normal",
        prompt = utils.get_hl_by_name("TelescopePromptNormal", "TelescopePrompt", "NormalFloat"),
        results = utils.get_hl_by_name("TelescopeResultsNormal", "TelescopePrompt", "NormalFloat"),
        preview = utils.get_hl_by_name("TelescopePreviewNormal", "TelescopePrompt", "NormalFloat"),
        title = utils.get_hl_by_name "Title",
        character = utils.get_hl_by_name "Character",
        keyword = utils.get_hl_by_name "Keyword",
      }

      utils.set_hl_fg_bg("TelescopePromptBorder", c.normal.bg, c.prompt.bg)
      utils.set_hl_fg_bg("TelescopeResultsBorder", c.normal.bg, c.results.bg)
      utils.set_hl_fg_bg("TelescopePreviewBorder", c.normal.bg, c.preview.bg)

      utils.set_hl_fg_bg("TelescopePromptTitle", c.prompt.bg, c.keyword.fg)
      utils.set_hl_fg_bg("TelescopeResultsTitle", c.results.bg, c.character.bg)
      utils.set_hl_fg_bg("TelescopePreviewTitle", c.preview.bg, c.title.fg)
    end)
  end
end

function M.setup(config)
  local default_config = {
    telescope = { set_highlights = true },
  }

  config = vim.tbl_extend("force", default_config, config)

  lvim.lsp.float.border = "rounded"
  lvim.lsp.diagnostics.float.border = "rounded"
  require("lspconfig.ui.windows").default_options.border = "rounded"

  M.telescope(config.telescope)

  lvim.builtin.which_key.setup.window.border = "none"
end

return M
