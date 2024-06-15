return {
  "lervag/vimtex",
  lazy = false, -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_mappings_enabled = 0
    vim.g.vimtex_imaps_enabled = 0
    vim.g.vimtex_quickfix_mode = 0
  end,
}
