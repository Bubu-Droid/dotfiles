return {
  "rmagatti/auto-session",
  lazy = false,

  opts = {
    auto_restore = true,
    suppressed_dirs = { "~/", "~/Desktop", "~/Downloads", "/" },

    -- This is a bit tricky. If you have switched
    -- branches externally and some file has underwent
    -- some change which has not been saved yet,
    -- then AutoSession warns you that
    -- the current buffer has been modified and has
    -- unsaved changes. If you think that picking no
    -- here and saving the changes in the current buffer
    -- would fix the problem, you're wrong!
    -- This results in the changes being written into the
    -- switched branch which is not ideal at all. The best
    -- you can do here is, when AutoSession warns you,
    -- switch branches externally back to the initial branch
    -- and save the changes there. From this point on you
    -- are free to do whatever you want to.

    git_use_branch_name = true,
    git_auto_restore_on_branch_change = true,
    -- args_allow_files_auto_save = true,
  },

  keys = {
    -- auto-session keymaps
    { "<leader>wr", "<cmd>AutoSession restore<CR>", desc = "Restore session for cwd" },
    { "<leader>ws", "<cmd>AutoSession save<CR>", desc = "Save session for auto session root dir" },
    { "<leader>wd", "<cmd>AutoSession delete<CR>", desc = "Delete session for auto session root dir" },
  },
}
