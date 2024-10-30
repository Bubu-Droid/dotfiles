return {
  "nvim-telescope/telescope.nvim",
  event = { "VimEnter" },
  branch = "0.1.x",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist,
            ["<C-f>"] = actions.open_qflist,
          },
        },
      },
    })
    telescope.load_extension("fzf")
  end,
  keys = {
    -- telescope keymaps
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Fuzzy find files in cwd" },
    { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Fuzzy find recent files" },
    { "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Find string in cwd" },
    { "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Find string under cursor in cwd" },
    { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find todos" },
  },
}
