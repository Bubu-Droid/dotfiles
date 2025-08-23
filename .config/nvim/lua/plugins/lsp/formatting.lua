return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      -- html = { "prettier" },
      -- htmldjango = { "djlint" },
      css = { "prettier" },
      yaml = { "prettier" },
      toml = { "prettier" },
      markdown = { "prettier" },
      sh = { "shfmt" },
      -- text = { "prettier" },
      c = { "clang-format" },
      cpp = { "clang-format" },
    },
    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 1500,
    },
  },
}
