return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "mason-org/mason-lspconfig.nvim",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
    "b0o/schemastore.nvim",
  },

  config = function()
    -- import mason_lspconfig plugin
    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup()

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        -- we do not use debuggers :3
        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }

    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = signs.Error,
          [vim.diagnostic.severity.WARN] = signs.Warn,
          [vim.diagnostic.severity.HINT] = signs.Hint,
          [vim.diagnostic.severity.INFO] = signs.Info,
        },
        numhl = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.HINT] = "",
          [vim.diagnostic.severity.INFO] = "",
        },
      },
    })

    -- LSPs for web-dev
    vim.lsp.enable("html-lsp") -- html
    vim.lsp.enable("css-lsp") -- cssls
    vim.lsp.enable("typescript-language-server") -- ts_ls
    vim.lsp.enable("emmet-language-server") -- emmet_language_server
    vim.lsp.enable("django-template-lsp") -- djlsp

    -- LSP for python
    vim.lsp.enable("basedpyright") -- basedpyright

    -- LSP for lua
    vim.lsp.enable("lua-language-server") -- lua_ls

    -- LSP for latex
    vim.lsp.enable("texlab") -- texlab

    -- LSP for bash
    vim.lsp.enable("bash-language-server") -- bashls

    -- LSP for markdown
    vim.lsp.enable("marksman") -- marksman

    -- LSP for c and cpp
    vim.lsp.config("clangd", { -- clangd
      cmd = { "clangd", "--clang-tidy" },
    })

    -- LSP for json
    vim.lsp.enable("json-lsp") -- jsonls

    -- LSP for r
    vim.lsp.enable("r-languageserver") -- r_language_server

    -- LSP for yaml
    vim.lsp.enable("yaml-language-server") -- yamlls

    -- LSP for toml
    vim.lsp.enable("taplo") -- taplo
  end,
}
