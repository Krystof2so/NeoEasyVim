return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,        -- doit être chargé immédiatement
    build = ":TSUpdate", -- installe et met à jour les parsers
    config = function()
      local ok, ts_configs = pcall(require, "nvim-treesitter.configs")
      if not ok then return end

      ts_configs.setup({
        ensure_installed = { "lua", "python", "rust", "toml" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  }
}

