-- ******************
-- * init.lua       *
-- *                *
-- * Point d'entrée *
-- ******************

-- Bootstrap lazy.nvim
require("core.bootstrap")

-- Désactiver les providers inutiles
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Python dédié Neovim
vim.g.python3_host_prog = vim.fn.expand("~/.venvs/neovim/bin/python")
-- Ajouter Mason au PATH pour que les binaires soient trouvables
vim.env.PATH = vim.env.PATH .. ":" .. vim.fn.stdpath("data") .. "/mason/bin"

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

