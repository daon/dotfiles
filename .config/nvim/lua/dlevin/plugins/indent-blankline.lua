return {
  "lukas-reineke/indent-blankline.nvim",
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help indent_blankline.txt`
  main = "ibl",
  config = function()
    require("ibl").setup()
  end,
}