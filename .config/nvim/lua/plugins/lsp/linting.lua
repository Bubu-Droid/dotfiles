return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      html = { "htmlhint" },
      htmldjango = { "djlint" },
      css = { "stylelint" },
      javascript = { "eslint_d" },
      python = { "ruff" },
      -- lua = { "selene" },
      sh = { "shellcheck" },
      markdown = { "markdownlint" },
      -- r = { "lintr" },
      yaml = { "yamllint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
