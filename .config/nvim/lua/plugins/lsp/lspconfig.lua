return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "mason-lspconfig.nvim",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import mason_lspconfig plugin
    local mason_lspconfig = require("mason-lspconfig")

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
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
    vim.diagnostic.config({
      signs = { text = sign_text },
    })

    -- default handler for installed servers
    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    -- configure emmet language server
    vim.lsp.config("emmet_ls", {
      capabilities = capabilities,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    })

    -- configure lua server (with special settings)
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          completion = {
            callSnippet = "Replace",
          },
        },
      },
    })

    vim.lsp.config("texlab", {
      capabilities = capabilities,
      filetypes = { "tex", "latex" },
    })

    vim.lsp.config("pyright", {
      capabilities = capabilities,
      filetypes = { "python" },
    })

    vim.lsp.config("html", {
      capabilities = capabilities,
      filetypes = { "html" },
    })

    vim.lsp.config("css", {
      capabilities = capabilities,
      filetypes = { "css" },
    })

    vim.lsp.config("tailwindcss", {
      capabilities = capabilities,
      filetypes = { "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact" },
    })

    vim.lsp.config("marksman", {
      capabilities = capabilities,
      filetypes = { "markdown" },
    })

    vim.lsp.config("taplo", {
      capabilities = capabilities,
      filetypes = { "toml" },
    })

    vim.lsp.config("yamlls", {
      capabilities = capabilities,
      filetypes = { "yaml" },
      settings = {
        yaml = {
          schemas = {
            kubernetes = "/*.yaml", -- Example schema for Kubernetes files
          },
          validate = true,
          completion = true,
          hover = true,
        },
      },
    })

    vim.lsp.config("bashls", {
      capabilities = capabilities,
      filetypes = { "sh" },
    })
  end,
}
