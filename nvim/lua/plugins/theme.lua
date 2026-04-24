return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.everforest_enable_italic = true
    vim.cmd.colorscheme('tokyonight-night')
  end
}
