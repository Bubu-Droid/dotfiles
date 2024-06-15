return {
  "SirVer/ultisnips",
  init = function()
    vim.g.UltiSnipsExpandTrigger = "<tab>"
    vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
    vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"
    vim.g.UltiSnipsSnippetsDirectories = "~/.config/nvim/UltiSnips/"
  end,
}
