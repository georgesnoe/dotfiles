return {
  "mgierada/lazydocker.nvim",
  dependencies = { "akinsho/toggleterm.nvim" },
  --- @module "lazydocker"
  opts = {
    border = "single",
  },
  --- @module "lazy"
  --- @type LazyKeysSpec[]
  keys = {
    {
      "<leader>ld",
      function()
        require("lazydocker").open()
      end,
      desc = "Open Lazydocker floating window",
    },
  },
}
