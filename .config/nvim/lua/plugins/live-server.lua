return {
  "https://git.barrettruth.com/barrettruth/live-server.nvim",
  cmd = { "LiveServerStart", "LiveServerStop" },
  -- opts = {},
  keys = {
    { "<leader>ls", "<Plug>(live-server-start)", desc = "Start live-server" },
    { "<leader>lq", "<Plug>(live-server-stop)", desc = "Stop live-server" },
  },
}
