return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },

  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },

  config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local keymap = vim.keymap

    local capabilities = cmp_nvim_lsp.default_capabilities()

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
        keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        keymap.set("n","gr",vim.lsp.buf.references,opts)
        keymap.set("n", "K", vim.lsp.buf.hover, opts)

      end,
    })

    vim.diagnostic.config({
      virtual_text = true,
      underline = false,
      severity_sort = true,
      update_in_insert = false,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "󱎘",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "󱐋",
        },
      },
    })

    vim.lsp.config("gopls", {
      cmd = { "gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      root_markers = { "go.mod", "go.sum", ".git" },
      capabilities = capabilities,

      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
            shadow = true,
          },
          staticcheck = true,
          gofumpt = true,
          semanticTokens = true,
          usePlaceholders = false,
          completeUnimported = true,
        },
      },
    })

    vim.lsp.config("lua_ls", {
      cmd = { "lua-language-server" },
      filetypes = { "lua" },

      root_markers = {
        ".luarc.json",
        ".luarc.jsonc",
        ".git",
      },

      capabilities = capabilities,

      settings = {
        Lua = {
          hint = { enable = true },

          workspace = {
            checkThirdParty = false,
            ignoreDir = {
              "coc",
              "node_modules",
            },

            maxPreload = 500,
            preloadFileSize = 200,
          },

          diagnostics = {
            globals = { "vim" },
          },

          telemetry = {
            enable = false,
          },
        },
      },
    })
  end,
}

