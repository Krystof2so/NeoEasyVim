-- Gestion de la configuration de Mason et Mason-lspconfig
return {
  -- Mason principal
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
        icons = {
          package_installed   = "✓",
          package_pending     = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },

  {
    "neovim/nvim-lspconfig", -- lspconfig doit aussi être un plugin géré par Lazy
  },
}

