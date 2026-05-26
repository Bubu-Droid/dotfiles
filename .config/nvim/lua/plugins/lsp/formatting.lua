return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },

  opts = {
    formatters_by_ft = {
      html = { "prettier" },
      css = { "prettier" },
      javascript = { "prettier" },
      htmldjango = { "djlint" },
      python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
      lua = { "stylua" },
      tex = { "tex-fmt" },
      sh = { "shfmt" },
      markdown = { "prettier" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      json = { "prettier" },
      -- r = { "r-styler" },
      yaml = { "yamlfix" },
      toml = { "taplo" },
    },
    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 1500,
    },
  },
}
