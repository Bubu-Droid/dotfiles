return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    check_ts = true,
    ts_config = {
      lua = { "string" }, -- it will not add a pair on that treesitter node
      javascript = { "template_string" },
      -- java = false, -- don't check treesitter on java
    },
  },

  config = function(_, opts)
    local npairs = require("nvim-autopairs")
    local Rule = require("nvim-autopairs.rule")
    local cond = require("nvim-autopairs.conds")
    local ts_conds = require("nvim-autopairs.ts-conds")

    local brackets = { { "(", ")" }, { "[", "]" }, { "{", "}" } }

    npairs.setup(opts)

    npairs.add_rules({
      -- Rule for a pair with left-side ' ' and right side ' '
      Rule(" ", " ")
        -- Pair will only occur if the conditional function returns true
        :with_pair(function(args)
          -- We are checking if we are inserting a space in (), [], or {}
          local pair = args.line:sub(args.col - 1, args.col)
          return vim.tbl_contains({
            brackets[1][1] .. brackets[1][2],
            brackets[2][1] .. brackets[2][2],
            brackets[3][1] .. brackets[3][2],
          }, pair)
        end)
        :with_move(cond.none())
        :with_cr(cond.none())
        -- We only want to delete the pair of spaces when the cursor is as such: ( | )
        :with_del(function(args)
          local col = vim.api.nvim_win_get_cursor(0)[2]
          local context = args.line:sub(col - 1, col + 2)
          return vim.tbl_contains({
            brackets[1][1] .. "  " .. brackets[1][2],
            brackets[2][1] .. "  " .. brackets[2][2],
            brackets[3][1] .. "  " .. brackets[3][2],
          }, context)
        end),
    })

    -- For each pair of brackets we will add another rule
    for _, bracket in pairs(brackets) do
      npairs.add_rules({
        -- Each of these rules is for a pair with left-side '( ' and right-side ' )' for each bracket type
        Rule(bracket[1] .. " ", " " .. bracket[2])
          :with_pair(cond.none())
          :with_move(function(args)
            return args.char == bracket[2]
          end)
          :with_del(cond.none())
          :use_key(bracket[2])
          -- Removes the trailing whitespace that can occur without this
          :replace_map_cr(function(_)
            return "<C-c>2xi<CR><C-c>O"
          end),
      })
    end

    -- Add trailing commas to "'} inside Lua tables
    npairs.add_rules({
      Rule("{", "},", "lua"):with_pair(ts_conds.is_ts_node({ "table_constructor" })),
      Rule("'", "',", "lua"):with_pair(ts_conds.is_ts_node({ "table_constructor" })),
      Rule('"', '",', "lua"):with_pair(ts_conds.is_ts_node({ "table_constructor" })),
    })
  end,
}
