return {
  "nickjvandyke/opencode.nvim",
  dependencies = {
    {
      "folke/snacks.nvim",
      optional = true,
      --- @module "snacks"
      --- @type snacks.Config
      opts = {
        input = {},
        picker = {
          actions = {
            opencode_send = function(...)
              return require("opencode").snacks_picker_send(...)
            end,
          },
          win = {
            input = {
              keys = {
                ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
              },
            },
          },
        },
      },
    },
  },
  --- @module "lazy"
  --- @type LazyKeysSpec[]
  keys = {
    {
      "<C-a>",
      function()
        require("opencode").ask("@this: ", { submit = true })
      end,
      mode = { "n", "x" },
      desc = "Ask opencode…",
    },
    {
      "<C-x>",
      function()
        require("opencode").select()
      end,
      mode = { "n", "x" },
      desc = "Execute opencode action…",
    },
    {
      "<C-.>",
      function()
        require("opencode").toggle()
      end,
      mode = { "n", "t" },
      desc = "Toggle opencode",
    },
    {
      "go",
      function()
        return require("opencode").operator("@this ")
      end,
      mode = { "n", "x" },
      desc = "Add range to opencode",
      expr = true,
    },
    {
      "goo",
      function()
        return require("opencode").operator("@this ") .. "_"
      end,
      mode = { "n", "x" },
      desc = "Add line to opencode",
      expr = true,
    },
    {
      "<S-C-u>",
      function()
        require("opencode").command("session.half.page.up")
      end,
      mode = { "n" },
      desc = "Scroll opencode up",
    },
    {
      "<S-C-d>",
      function()
        require("opencode").command("session.half.page.down")
      end,
      mode = { "n" },
      desc = "Scroll opencode down",
    },
  },
}
