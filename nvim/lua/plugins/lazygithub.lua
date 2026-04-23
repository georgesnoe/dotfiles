return {
  "georgesnoe/lazygithub.nvim",
  dependencies = { "akinsho/toggleterm.nvim" },
  --- @module "lazygithub"
  opts = {
    border = "single",
  },
  --- @module "lazy"
  --- @type LazyKeysSpec[]
  keys = {
    {
      "<leader>lg",
      function()
        require("lazygithub").open()
      end,
      desc = "Open Lazygithub",
    },
  },
}
