return {
  "barrett-ruth/live-server.nvim",
  build = "npm add -g live-server",
  cmd = { "LiveServerStart", "LiveServerStop" },
  config = true,
  keys = {
    { "<leader>ls", "<cmd>LiveServerStart<CR>", desc = "Start live-server" },
    { "<leader>lq", "<cmd>LiveServerStop<CR>", desc = "Stop live-server" },
  },
}
