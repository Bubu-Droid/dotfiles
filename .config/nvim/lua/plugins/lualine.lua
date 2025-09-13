return {
  "nvim-lualine/lualine.nvim",
  event = { "UIEnter" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = "tokyonight-night",
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
        lualine_c = {
          function()
            return require("auto-session.lib").current_session_name(true)
          end,
        },
      },
    })
  end,
}
