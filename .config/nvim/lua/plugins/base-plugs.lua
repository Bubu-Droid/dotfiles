return {
  "nvim-lua/plenary.nvim", -- lua functions that many plugins use
  "christoomey/vim-tmux-navigator", -- tmux & split window navigation
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      default = true,
      override = {
        css = {
          icon = "",
          color = "#00BFFF",
          name = "Css",
        },
      },
    },
  },
  "echasnovski/mini.icons",
  "williamboman/mason-lspconfig.nvim",
  { import = "plugins.lsp", event = { "UIEnter" } },
}
