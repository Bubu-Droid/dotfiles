return {
  "nvim-tree/nvim-tree.lua",
  event = { "VimEnter" },
  opts = {
    hijack_cursor = true,
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      width = 30,
      relativenumber = true,
    },
    renderer = {
      group_empty = true,
      indent_markers = {
        enable = true,
      },
      icons = {
        glyphs = {
          folder = {
            arrow_closed = "",
            arrow_open = "",
          },
        },
      },
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
    },
    filters = {
      dotfiles = false,
      git_ignored = false,
    },
    actions = {
      open_file = {
        window_picker = {
          enable = false,
        },
      },
    },
  },
  keys = {
    --   -- nvim-tree keymaps
    { "<leader>ee", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
    { "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", desc = "Toggle file explorer on current file" },
    -- use "E" to expand the entire workflow
    -- use "W" to collapse the entire workflow
    -- use "R" to collapse the entire workflow
  },
}
