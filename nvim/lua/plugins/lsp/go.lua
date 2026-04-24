return {
  "ray-x/go.nvim",
  dependencies = {  -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },

  ft = { "go", "gomod" },
  event = { "CmdlineEnter" },

  build = ':lua require("go.install").update_all_sync()', 

  opts = function()
    local opts = {
      lsp_cfg = false,      
      lsp_keymaps = false,   
      lsp_gofumpt = true,     
    }
    require("go").setup(opts)
    return opts
  end,
}
