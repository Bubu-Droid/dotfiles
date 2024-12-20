return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      -- lsp
      "texlab", -- latex
      "ts_ls", -- typescript
      "pyright", -- python
      "lua_ls", -- lua
      "html", -- html
      "cssls", -- css
      "tailwindcss", -- tailwindcss
      "emmet_ls", -- emmet
      "marksman", -- bash
      "taplo", -- toml
      "yamlls", -- yaml
      "bashls", -- bash
      -- formatter
      "prettier", -- primary-ft
      "stylua", -- lua
      "isort", -- python-primary
      "black", -- python-secondary
      "shfmt", -- bash
      -- linter
      "pylint", -- python
      "eslint_d", -- web-dev
      "shellcheck", -- bash
      "htmlhint", -- html
      "stylelint", -- css
      "markdownlint", -- markdown
      -- "toml-lint", -- toml
      "yamllint", -- yaml
      "textlint", -- text
    },
  },
}
