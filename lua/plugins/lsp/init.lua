return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")

      -- Serveurs à installer automatiquement
      local servers = { "texlab", "lua_ls", "pyright", "ruff", "rust_analyzer" }
      mason_lspconfig.setup({ ensure_installed = servers })

      -- Parcourir les serveurs installés
      local installed_servers = mason_lspconfig.get_installed_servers()
      for _, server_name in ipairs(installed_servers) do
        -- Charger la config spécifique si elle existe
        local ok, config = pcall(require, "plugins.lsp.config." .. server_name)
        if ok and config then
          vim.lsp.config(server_name, config)
        end
        -- Activer le serveur pour ses filetypes
        -- vim.lsp.enable(server_name)
      end
    end,
  },
}

