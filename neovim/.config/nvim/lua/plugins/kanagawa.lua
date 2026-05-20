return {

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-dragon", -- or "kanagawa-wave" / "kanagawa-lotus"
    },
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd("colorscheme kanagawa-dragon")
    end,
  },
}
