if vim.g.neovide then
  vim.g.neovide_refresh_rate = 30
  vim.g.neovide_refresh_rate_idle = 5
  vim.g.neovide_no_idle = true
  vim.g.neovide_confirm_quit = true
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_profiler = false
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_smooth_blink = false
  vim.g.neovide_cursor_vfx_mode = "railgun"

  ---@param scale_factor number
  ---@return number
  local function clamp_scale_factor(scale_factor)
    return math.max(math.min(scale_factor, vim.g.neovide_max_scale_factor), vim.g.neovide_min_scale_factor)
  end

  ---@param scale_factor number
  ---@param clamp? boolean
  local function set_scale_factor(scale_factor, clamp)
    vim.g.neovide_scale_factor = clamp and clamp_scale_factor(scale_factor) or scale_factor
  end

  local function reset_scale_factor()
    vim.g.neovide_scale_factor = vim.g.neovide_initial_scale_factor
  end

  ---@param increment number
  ---@param clamp? boolean
  local function change_scale_factor(increment, clamp)
    set_scale_factor(vim.g.neovide_scale_factor + increment, clamp)
  end

  vim.g.neovide_increment_scale_factor = vim.g.neovide_increment_scale_factor or 0.1
  vim.g.neovide_min_scale_factor = vim.g.neovide_min_scale_factor or 0.7
  vim.g.neovide_max_scale_factor = vim.g.neovide_max_scale_factor or 2.0
  vim.g.neovide_initial_scale_factor = vim.g.neovide_scale_factor or 1
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor or 1

  vim.api.nvim_create_user_command("NeovideSetScaleFactor", function(event)
    local scale_factor, option = tonumber(event.fargs[1]), event.fargs[2]

    if not scale_factor then
      vim.notify(
        "Error: scale factor argument is nil or not a valid number.",
        vim.log.levels.ERROR,
        { title = "Recipe: neovide" }
      )
      return
    end

    set_scale_factor(scale_factor, option ~= "force")
  end, { nargs = "+" })

  vim.api.nvim_create_user_command(
    "NeovideResetScaleFactor",
    reset_scale_factor,
    { desc = "Reset Neovide scale factor" }
  )

  vim.api.nvim_create_user_command("NeovideIncreaseScaleFactor", function()
    change_scale_factor(vim.g.neovide_increment_scale_factor * vim.v.count1, true)
  end, { desc = "Increase Neovide scale factor" })

  vim.api.nvim_create_user_command("NeovideDecreaseScaleFactor", function()
    change_scale_factor(-vim.g.neovide_increment_scale_factor * vim.v.count1, true)
  end, { desc = "Decrease Neovide scale factor" })

  vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(vim.g.neovide_increment_scale_factor * vim.v.count1, true)
  end, { desc = "Increase Neovide scale factor" })

  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(-vim.g.neovide_increment_scale_factor * vim.v.count1, true)
  end, { desc = "Decrease Neovide scale factor" })

  vim.keymap.set("n", "<C-0>", reset_scale_factor, { desc = "Reset Neovide scale factor" })
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- vim.cmd("colorscheme tokyonight-day")
vim.cmd("set nospell")

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.arb",
  command = "setfiletype json",
})

require("blink-cmp").setup({
  sources = {},
  signature = {
    enabled = true,
  },
  fuzzy = { implementation = "rust" },
  term = {
    completion = {
      ghost_text = {
        enabled = function()
          return true
        end,
      },
    },
  },
})

require("neo-tree").setup({
  sources = {
    "filesystem",
    "buffers",
    "git_status",
    "document_symbols",
  },
  filesystem = {
    group_empty_dirs = false,
    filtered_items = {
      hide_dotfiles = false,
      hide_hidden = false,
      hide_gitignored = false,
      hide_ignored = false,
      visible = true,
    },
  },
  source_selector = {
    winbar = true,
    statusline = true,
    sources = {
      { source = "filesystem" },
      { source = "buffers" },
      { source = "git_status" },
      { source = "document_symbols" },
    },
    truncation_character = "…",
  },
  window = {
    mappings = {
      ["P"] = {
        "toggle_preview",
        config = {
          use_float = true,
          use_image_nvim = true,
        },
      },
    },
  },
})

require("render-markdown").setup({
  enabled = true,
  render_modes = { "n", "c", "t" },
  file_types = { "markdown" },
})

local highlight = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowCyan",
}

local hooks = require("ibl.hooks")

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
  vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
  vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
  vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
  vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
  vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
  vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

vim.g.rainbow_delimiters = { highlight = highlight }
require("ibl").setup({
  indent = { highlight = highlight },
  whitespace = {
    highlight = {
      "NonText",
      "Whitespace",
      "CursorColumn",
    },
    remove_blankline_trail = true,
  },
  scope = { enabled = true },
})
hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
