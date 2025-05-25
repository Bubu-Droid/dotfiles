return {
  "rmagatti/auto-session",
  lazy = false,

  -- enables autocomplete for opts
  opts = {
    auto_restore = true,
    suppressed_dirs = { "~/", "~/Desktop", "~/Downloads", "/" },
  },
  keys = {
    -- auto-session keymaps
    { "<leader>wr", "<cmd>SessionRestore<CR>", desc = "Restore session for cwd" },
    { "<leader>ws", "<cmd>SessionSave<CR>", desc = "Save session for auto session root dir" },
  },
}
