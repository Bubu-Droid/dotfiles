return {
  "kylechui/nvim-surround",
  event = "VeryLazy",
  opts = {
    move_cursor = "sticky",
  },

  -- Old text                    Command         New text ~
  -- arg*s                       ysiwffunc       func(args)
  -- f*unc_name(a, b, x)         dsf             a, b, x
  -- f*unc_name(a, b, x)         csfnew_name     new_name(a, b, x)
  -- *inner text                 ys$i/<CR>\      /inner text\
  -- *x                          ysl"            "x"
}
