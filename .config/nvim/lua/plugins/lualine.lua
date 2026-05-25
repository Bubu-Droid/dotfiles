return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "UIEnter",

  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    -- function to count the number of pending updates in Mason
    local function lualine_mason_updates()
      local registry = require("mason-registry")
      local installed_packages = registry.get_installed_package_names()
      local packages_outdated = 0

      for _, pkg_name in ipairs(installed_packages) do
        local pkg = registry.get_package(pkg_name)
        if pkg then
          local ok_installed, installed_version = pcall(pkg.get_installed_version, pkg)
          local ok_latest, latest_version = pcall(pkg.get_latest_version, pkg)
          if ok_installed and ok_latest and installed_version ~= latest_version then
            packages_outdated = packages_outdated + 1
          end
        end
      end

      if packages_outdated > 0 then
        return "" .. " " .. packages_outdated
      else
        return ""
      end
    end

    local theme_name = "tokyonight"
    local my_lualine_theme

    local rice_file = os.getenv("HOME") .. "/.rice"
    local f = io.open(rice_file, "r")

    if f then
      theme_name = f:read("*l")
      f:close()
    end

    if theme_name == "coolnight" then
      local colors = {
        blue = "#65D1FF",
        green = "#3EFFDC",
        violet = "#FF61EF",
        yellow = "#FFDA7B",
        red = "#FF4A4A",
        fg = "#c3ccdc",
        bg = "#112638",
        inactive_bg = "#2c3043",
      }

      my_lualine_theme = {
        normal = {
          a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        insert = {
          a = { bg = colors.green, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        visual = {
          a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        command = {
          a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        replace = {
          a = { bg = colors.red, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        inactive = {
          a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
          b = { bg = colors.inactive_bg, fg = colors.semilightgray },
          c = { bg = colors.inactive_bg, fg = colors.semilightgray },
        },
      }
    else
      my_lualine_theme = "tokyonight-night"
    end

    lualine.setup({
      options = {
        theme = my_lualine_theme,
        globalstatus = true,
        -- ignore_focus = { "NvimTree" },
      },
      sections = {
        lualine_c = {
          { "filename" },
          {
            function()
              return require("auto-session.lib").current_session_name(true)
            end,
          },
        },
        lualine_x = {
          {
            lualine_mason_updates,
            color = { fg = "#56B6C2" },
          },
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "lsp_status" },
          -- { "encoding" },
          -- { "fileformat" },
          { "filetype" },
        },
      },
      extensions = {
        "lazy",
        "mason",
        "nvim-tree",
      },
    })
  end,
}
