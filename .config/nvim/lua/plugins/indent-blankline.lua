return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  -- opts = {},
  config = function(_, opts)
    local highlight = {
      "Function",
      "Conditional",
      "Repeat",
      "Label",
      "Exception",
    }
    local ibl = require("ibl")

    ibl.setup(opts)
    ibl.setup({
      indent = {
        -- highlight = highlight,
        char = "║",
      },
      whitespace = {
        highlight = highlight,
      },
      scope = {
        highlight = highlight,
        include = {
          node_type = { ["*"] = { "*" } },
        },
      },
    })
  end,
}
