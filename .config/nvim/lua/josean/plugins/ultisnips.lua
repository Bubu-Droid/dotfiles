return {
  "SirVer/ultisnips",
  init = function()
    vim.g.UltiSnipsExpandTrigger = "<tab>"
    vim.g.UltiSnipsJumpForwardTrigger = "<c-b>"
    vim.g.UltiSnipsJumpBackwardTrigger = "<c-z>"
    vim.g.UltiSnipsSnippetsDirectories = "~/.config/nvim/UltiSnips/"
  end,
}
