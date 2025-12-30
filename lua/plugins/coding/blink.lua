-- *********************************************************************
-- * plugins/coding/blink.lua                                          *
-- *                                                                   *
-- * Complétion avec blink.nvim, intégrée avec LuaSnip et snippets     *
-- * Configuration UX : menu et documentation flottante bien délimités *
-- *********************************************************************

return {
  "saghen/blink.cmp",
  version = "*",

  dependencies = {
    "rafamadriz/friendly-snippets",
    "L3MON4D3/LuaSnip",
  },

  event = "InsertEnter",  -- Mode de chargement

  opts = {
    -- Sélection par la touche <Enter>
    keymap = {
      preset = "default",  -- important
      ["<CR>"] = { "accept", "fallback" },
    },

    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 50,
        window = {
          border = "rounded",
          max_width = 80,
          max_height = 40,
        },
      },
      menu = {
        border = "rounded",
        max_height = 18,
        min_width = 30,
      },
    },

    signature = { enabled = true },
  },

  config = function(_, opts)
    require("blink.cmp").setup(opts)

    -- Charger automatiquement les snippets VSCode
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Couleurs pour les fenêtres flottantes LSP/complétion
    vim.cmd([[
      hi LspFloatBorder guifg=#81a1c1 guibg=#2e3440
      hi LspFloatWinNormal guibg=#3b4252 guifg=#d8dee9
    ]])
    end,
}

