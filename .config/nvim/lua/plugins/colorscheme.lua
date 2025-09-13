return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("tokyonight").setup({
      style = "night",
    })

    -- load the colorscheme here
    vim.cmd([[colorscheme tokyonight-night]])
  end,
}
