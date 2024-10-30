return {
  "gbprod/substitute.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local substitute = require("substitute")
    local keymap = vim.keymap

    substitute.setup()

    -- substitute keymaps
    keymap.set("n", "s", substitute.operator, { desc = "Substitute with motion" })
    keymap.set("n", "ss", substitute.line, { desc = "Substitute line" })
    keymap.set("x", "s", substitute.visual, { desc = "Substitute in visual mode" })
    keymap.set("n", "sx", require("substitute.exchange").operator, { desc = "Exchange with motion" })
    keymap.set("n", "sxx", require("substitute.exchange").line, { desc = "Exchange lines" })
  end,
}
