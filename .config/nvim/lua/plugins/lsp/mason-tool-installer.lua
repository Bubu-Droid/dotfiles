return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = { "mason-org/mason-lspconfig.nvim", opts = {} },

  opts = {
    ensure_installed = {
      -- LSPs
      "html-lsp", -- html
      "css-lsp", -- css
      "typescript-language-server", -- js
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
      "prettier", -- web-dev, markdown, json
      "djlint", -- htmldjango
      "ruff", -- python
      -- "ruff_format", -- python
      -- "ruff_fix", -- python
      -- "ruff_organize_imports", -- python
      "stylua", -- lua
      "tex-fmt", -- latex
      "shfmt", -- bash
      "clang-format", -- c and cpp
      -- "styler", -- r
      "yamlfix", -- yaml
      "taplo", -- toml

      -- linters
      "htmlhint", -- html
      "djlint", -- htmldjango
      "stylelint", -- css
      "eslint_d", -- web-dev
      "ruff", -- python
      -- "selene", -- lua
      -- "chktex", -- latex
      "shellcheck", -- bash
      "markdownlint", -- markdown
      -- "clangtidy" -- c and cpp
      -- we don't really need a linter for json
      -- "lintr", -- r
      "yamllint", -- yaml
      -- we don't really need a linter for toml
    },
  },
}
