return {
  "SirVer/ultisnips",
  lazy = false,

  init = function()
    vim.g.UltiSnipsExpandTrigger = "<tab>"
    vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
    vim.g.UltiSnipsJumpBackwardTrigger = "<S-tab>"
    vim.g.UltiSnipsSnippetsDirectories = "UltiSnips"

    -- If you want :UltiSnipsEdit to split your window.
    vim.g.UltiSnipsEditSplit = "vertical"
  end,
}
