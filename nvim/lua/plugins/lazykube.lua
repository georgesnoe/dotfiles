return {
  "georgesnoe/lazykube.nvim",
  dependencies = { "akinsho/toggleterm.nvim" },
  --- @module "lazykube"
  opts = {
    border = "single",
  },
  --- @module "lazy"
  --- @type LazyKeysSpec[]
  keys = {
    {
      "<leader>lk",
      function()
        require("lazykube").open()
      end,
      desc = "Open Lazykube",
    },
  },
}
