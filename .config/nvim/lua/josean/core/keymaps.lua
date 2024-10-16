vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- latex hotkeys
-- keymap.set("n", "<leader>ll", "<cmd>!latexmk -pdf -pvc main.tex<CR>", { desc = "Compile the latex file" }) -- shit doesn't work idk why. zathura doesn't refresh.
keymap.set("n", "<leader>le", "<plug>(vimtex-errors)", { desc = "Open the error console" })
keymap.set("n", "cse", "<plug>(vimtex-env-change)", { desc = "Change the surrounding enviroment" })
keymap.set("n", "dse", "<plug>(vimtex-env-delete)", { desc = "Delete the surrounding enviroment" })
keymap.set("n", "csc", "<plug>(vimtex-cmd-change)", { desc = "Change the surrounding command" })
keymap.set("n", "dsc", "<plug>(vimtex-cmd-delete)", { desc = "Delete the surrounding command" })
keymap.set("n", "ds$", "<plug>(vimtex-env-delete-math)", { desc = "Delete the surrounding command" })
keymap.set("n", "cs$", "<plug>(vimtex-env-change-math)", { desc = "Change the surrounding command" })
keymap.set("n", "tsd", "<plug>(vimtex-delim-toggle-modifier)", { desc = "Change the delimiter size" })
keymap.set("n", "tsf", "<plug>(vimtex-cmd-toggle-frac)", { desc = "Change the delimiter size" })
keymap.set("i", "ji", "<ESC>A\\\\<ESC>o&= ", { desc = "Add align item" })
keymap.set("i", "jc", "<ESC>A\\\\<ESC>ocasi", { desc = "Add case item" })

-- auto-spell correction
keymap.set("i", "<C-l>", "<ESC>mki<C-x><C-s><ESC>`k", { desc = "Correct spelling on the fly" })
