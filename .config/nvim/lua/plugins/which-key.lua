return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },

  -- MARKS ~
  -- Shows a list of your buffer local and global marks when you hit ` or ’

  -- REGISTERS ~
  -- Shows a list of your buffer local and global registers when you hit ” in
  -- _NORMAL_ mode, or `<c-r>` in _INSERT_ mode.

  -- SPELLING ~
  -- When enabled, this plugin hooks into `z=` and replaces the full-screen spelling
  -- suggestions window by a list of suggestions within **WhichKey**.
}
