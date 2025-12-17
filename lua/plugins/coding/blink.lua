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
        position = "right",
        window = {
          border = "rounded",
          padding = 1,
          max_width = 80,
          max_height = 40,
        },
      },
      menu = {
        border = "rounded",
        padding = 1,
        direction = "auto", -- bas si possible, sinon haut
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
  end,
}

