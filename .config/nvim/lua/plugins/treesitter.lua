return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",

  opts = {
    highlight = {
      disable = { "latex" },
      enable = true,
    },

    indent = { enable = true },
    auto_install = true,
    sync_install = false,
    ignore_install = {},
    modules = {},
    additional_vim_regex_highlighting = false,
  },

  -- config = function(_, opts)
  --   local treesitter = require("nvim-treesitter")
  --   treesitter.setup(opts)
  --
  --   vim.api.nvim_create_autocmd("BufEnter", {
  --     callback = function()
  --       pcall(vim.treesitter.start)
  --     end,
  --   })
  -- end,

  config = function()
    local treesitter = require("nvim-treesitter")
    treesitter.install({
      "bash",
      "bibtex",
      "c",
      "cmake",
      "comment",
      "cpp",
      "core_schema",
      "css",
      "csv",
      "diff",
      "editorconfig",
      "git_commit",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "glsl",
      "hjson",
      "hlsl",
      "html",
      "htmldjango",
      "http",
      "ini",
      "java",
      "javascript",
      "javadoc",
      "jinga2",
      "jsdoc",
      "json",
      "json5",
      "json_schema",
      "jsonc",
      "jsonnet",
      "latex",
      "lua",
      "luadoc",
      "mail",
      "make",
      "mandbconfig",
      "markdown",
      "markdown_inline",
      "math",
      "matlab",
      "nginx",
      "perl",
      "python",
      "r",
      "rasi",
      "readline",
      "regex",
      "requirements",
      "rust",
      "scss",
      "sqlite",
      "ssh_client_config",
      "ssh_config",
      "superhtml",
      "toml",
      "udev",
      "vim",
      "vimdoc",
      "wgsl",
      "xml",
      "yaml",
      "zathurarc",
      "zsh",
    })
  end,

  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "py" },
    callback = function()
      vim.treesitter.start()
    end,
  }),
}
