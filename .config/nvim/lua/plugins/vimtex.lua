return {
  "lervag/vimtex",
  lazy = false, -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  config = function()
    -- VimTeX configuration goes here
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_mappings_enabled = 0
    vim.g.vimtex_imaps_enabled = 0
    vim.g.vimtex_quickfix_mode = 0
    vim.g.vimtex_indent_enabled = 0
    vim.g.vimtex_compiler_method = "latexmk"
  end,
  keys = {
    -- latex hotkeys
    { "<leader>le", "<Plug>(vimtex-errors)", desc = "Open the error console" },
    { "cse", "<Plug>(vimtex-env-change)", desc = "Change the surrounding enviroment" },
    { "dse", "<Plug>(vimtex-env-delete)", desc = "Delete the surrounding enviroment" },
    { "ae", "<Plug>(vimtex-ae)", desc = "<motion>ae does the <motion> around the environment", mode = { "o" } },
    { "ie", "<Plug>(vimtex-ie)", desc = "<motion>ie does the <motion> inside the environment", mode = { "o" } },
    { "csc", "<Plug>(vimtex-cmd-change)", desc = "Change the surrounding command" },
    { "dsc", "<Plug>(vimtex-cmd-delete)", desc = "Delete the surrounding command" },
    { "ac", "<Plug>(vimtex-ac)", desc = "<motion>ac does the <motion> around the command", mode = { "o" } },
    { "ic", "<Plug>(vimtex-ic)", desc = "<motion>ic does the <motion> inside the command", mode = { "o" } },
    { "ds$", "<Plug>(vimtex-env-delete-math)", desc = "Delete the surrounding command" },
    { "ts$", "<Plug>(vimtex-env-toggle-math)", desc = "Change the surrounding command" },
    { "a$", "<Plug>(vimtex-a$)", desc = "<motion>a$ does the <motion> around the math", mode = { "o" } },
    { "i$", "<Plug>(vimtex-i$)", desc = "<motion>i$ does the <motion> inside the math", mode = { "o" } },
    { "tsd", "<Plug>(vimtex-delim-toggle-modifier)", desc = "Change the delimiter size" },
    { "tsf", "<Plug>(vimtex-cmd-toggle-frac)", desc = "Change the delimiter size" },
    { "ad", "<Plug>(vimtex-ad)", desc = "<motion>ad does the <motion> around the delimiter", mode = { "o" } },
    { "id", "<Plug>(vimtex-id)", desc = "<motion>id does the <motion> inside the delimiter", mode = { "o" } },
    { "ji", "<ESC>A \\\\<ESC>o&= ", desc = "Add align item", mode = { "i" } },
    { "jc", "<ESC>A \\\\<ESC>ocasi", desc = "Add case item", mode = { "i" } },
    { "ai", "<Plug>(vimtex-am)", desc = "<motion>am does the <motion> around the item", mode = { "o" } },
    { "ii", "<Plug>(vimtex-im)", desc = "<motion>im does the <motion> inside the item", mode = { "o" } },
  },
}
