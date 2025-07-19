return {
  "everviolet/nvim",
  name = "evergarden",
  priority = 1005,
  config = function()
    require("evergarden").setup({
      theme = {
        variant = "winter"
      }
    })
    vim.cmd("colorscheme evergarden")
  end,
}
