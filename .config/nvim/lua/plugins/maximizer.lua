return {
  "szw/vim-maximizer",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    -- vim-maximizer keymaps
    { "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
  },
}
