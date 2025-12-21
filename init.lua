-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Échec du clonage de lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nAppuyez sur une touche pour quitter..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Désactiver les providers inutiles
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Python dédié Neovim
vim.g.python3_host_prog = vim.fn.expand("~/.venvs/neovim/bin/python")

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Options, keymaps et autocmds
require("core.spell")
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- Setup lazy.nvim et importer tous les plugins
require("lazy").setup("plugins")

