return {
  "akinsho/bufferline.nvim",
  event = "UIEnter",
  -- opts = {},
  config = function()
    local bufferline = require("bufferline")

    bufferline.setup({
      options = {
        mode = "tabs",
        separator_style = "slant",
        diagnostics = "nvim_lsp",
        diagnostics_update_on_event = true,
        style_preset = {
          bufferline.style_preset.no_italic,
        },
      },
    })
  end,
}
