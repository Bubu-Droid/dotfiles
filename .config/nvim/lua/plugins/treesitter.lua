return {
  "nvim-treesitter/nvim-treesitter",
  -- event = { "BufReadPre", "BufNewFile" },
  -- lazy = false,
  build = ":TSUpdate",

  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      ensure_installed = {
        "elixir",
        "heex",
        "json",
        "cmake",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "prisma",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
        "vimdoc",
        "c",
        "comment",
      },
      highlight = {
        disable = { "latex" },
        enable = true,
      },
      indent = { enable = true },
      auto_install = true,
      sync_install = false,
      ignore_install = {},
      modules = {},
      additional_vim_regex_highlighting = false,
    })
  end,
}
