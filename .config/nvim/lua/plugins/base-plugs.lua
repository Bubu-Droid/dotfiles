return {
  "nvim-lua/plenary.nvim", -- lua functions that many plugins use
  "christoomey/vim-tmux-navigator", -- tmux & split window navigation
  "nvim-tree/nvim-web-devicons",
  "echasnovski/mini.icons",
  "williamboman/mason-lspconfig.nvim",
  { import = "plugins.lsp", event = { "UIEnter" } },
}
