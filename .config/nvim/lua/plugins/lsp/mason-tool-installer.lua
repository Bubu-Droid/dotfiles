return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = { "mason-org/mason-lspconfig.nvim" },

  opts = {
    ensure_installed = {
      -- LSPs
      "html-lsp", -- html
      "css-lsp", -- css
      "typescript-language-server", -- typescript
      "emmet-language-server", -- emmet
      "django-template-lsp", -- django
      "basedpyright", -- python
      "lua-language-server", -- lua
      "texlab", -- latex
      "bash-language-server", -- bash
      "marksman", -- markdown
      "clangd", -- c and cpp
      "jsonls", -- json
      "r-languageserver", -- r
      "yaml-language-server", -- yaml
      "taplo", -- toml

      -- formatters
      "prettier", -- primary-ft
      "stylua", -- lua
      "isort", -- python-primary
      "black", -- python-secondary
      "shfmt", -- bash
      "clang-format", -- c
      "jq", -- json

      -- linters
      "htmlhint", -- html
      "djlint", -- htmldjango
      "stylelint", -- css
      "eslint_d", -- web-dev
      "ruff", -- python
      "selene", -- lua
      -- "chktex", -- latex
      "shellcheck", -- bash
      "markdownlint", -- markdown
      -- c and cpp linting is handled by clangd itself
      -- we don't really need a linter for json
      "lintr", -- r
      "yamllint", -- yaml
      -- we don't really need a linter for toml
    },
  },
}
