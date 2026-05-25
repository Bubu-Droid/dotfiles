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
      lua = { "selene" },
      -- latex = { "chktex" },
      sh = { "shellcheck" },
      markdown = { "markdownlint" },
      -- c and cpp linting is handled by clangd itself
      -- we don't really need a linter for json
      r = { "lintr" },
      yaml = { "yamllint" },
      -- we don't really need a linter for toml
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
