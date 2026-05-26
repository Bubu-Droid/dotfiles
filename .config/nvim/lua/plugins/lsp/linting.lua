return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    local lint = require("lint")

    -- set up chktex
    local function chktex_setup()
      local pattern = "(%d+):(%d+):(%d+):(.+):(%d+):(.*)"
      local severities = {
        Error = vim.diagnostic.severity.ERROR,
        Warning = vim.diagnostic.severity.WARN,
        Message = vim.diagnostic.severity.INFO,
      }

      lint.linters.chktex = {
        cmd = "chktex",
        stdin = true,
        args = { "-v0", "-I0", "-s", ":", "-f", "%l%b%c%b%d%b%k%b%n%b%m%b%b%b" },
        parser = function(output, _)
          local result = vim.fn.split(output, ":::")
          local diagnostics = {}

          for _, line in ipairs(result) do
            local lineno, off, d, sev, code, desc = string.match(line, pattern)

            lineno = tonumber(lineno or 1) - 1
            off = tonumber(off or 1) - 1
            d = tonumber(d or 1)
            table.insert(diagnostics, {
              source = "chktex",
              lnum = lineno,
              col = off,
              end_lnum = lineno,
              end_col = off + d,
              message = desc,
              severity = assert(severities[sev], "missing mapping for severity " .. sev),
              code = code,
              user_data = {
                lsp = {
                  code = code,
                },
              },
            })
          end
          return diagnostics
        end,
      }
    end

    -- set up clangtidy
    local function clangtidy_setup()
      local pattern = [=[([^:]*):(%d+):(%d+): (%w+): ([^[]+) %[(.*)%]]=]
      local groups = { "file", "lnum", "col", "severity", "message", "code" }

      local severity_map = {
        ["error"] = vim.diagnostic.severity.ERROR,
        ["warning"] = vim.diagnostic.severity.WARN,
        ["information"] = vim.diagnostic.severity.INFO,
        ["hint"] = vim.diagnostic.severity.HINT,
        ["note"] = vim.diagnostic.severity.HINT,
      }

      lint.linters.clangtidy = {
        cmd = "clang-tidy",
        stdin = false,
        args = { "--quiet" },
        ignore_exitcode = true,
        parser = require("lint.parser").from_pattern(pattern, groups, severity_map, { ["source"] = "clang-tidy" }),
      }
    end

    chktex_setup()
    clangtidy_setup()

    lint.linters_by_ft = {
      html = { "htmlhint" },
      htmldjango = { "djlint" },
      css = { "stylelint" },
      javascript = { "eslint_d" },
      python = { "ruff" },
      -- lua = { "selene" },
      tex = { "chktex" },
      sh = { "shellcheck" },
      markdown = { "markdownlint" },
      c = { "clangtidy" },
      cpp = { "clangtidy" },
      -- we don't really need a linter for json
      -- r = { "lintr" },
      yaml = { "yamllint" },
      -- we don't really need a linter for toml
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
