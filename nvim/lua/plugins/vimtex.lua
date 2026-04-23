return {
  "lervag/vimtex",
  ft = { "tex", "bib" },
  init = function()
    vim.g.vimtex_view_general_viewer = "atril"
    vim.g.vimtex_imaps_enabled = 0
    vim.g.vimtex_complete_enabled = 0
  end,
}
