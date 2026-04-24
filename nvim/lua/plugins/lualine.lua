return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  event = "BufReadPre",

  config = function()
    require("lualine").setup {
      options = {
        icons_enabled = true,
        theme = "tokyonight",

        section_separators = { left = "", right = "" },

        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        },
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = "" }, right_padding = 2 },
        },
        lualine_b = { { "filename", path = 1 } },
        lualine_c = { "branch" },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn", "info", "hint" },
            symbols = {
              error = "󱎘 ",
              warn  = " ",
              info  = " ",
              hint  = "󱐋 ",
            },
            colored = true,
            update_in_insert = false,
          },
        },
        lualine_y = { "progress" },
        lualine_z = {
          { "filetype", separator = { right = "" }, left_padding = 2 },
        },
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = { "nvim-tree", "aerial" },
    }
  end,
}
