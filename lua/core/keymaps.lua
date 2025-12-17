-- ************************
-- * lua/core/keymaps.lua *
-- ************************

vim.g.mapleader = " "
local map = vim.keymap.set


-- **************
-- * Raccourcis *
-- **************

-- Raccourcis utilitaires
map("n", "<leader>h", ":nohlsearch<CR>", { desc = "Suppression surlignage recherche" })

-- Lazy.nvim 
map("n", "<leader>l", "", { desc = " Lazy" }) -- mapping “vide” juste pour le groupe
map("n", "<leader>ll", ":Lazy<CR>", { desc = "Ouverture de Lazy" })
map("n", "<leader>lu", ":Lazy update<CR>", { desc = "Lazy update" })
map("n", "<leader>ls", ":Lazy sync<CR>", { desc = "Lazy sync" })

-- Neotree
map("n", "<leader>e", "", { desc = " Neotree" })
map("n", "<leader>ee", ":Neotree<CR>", { desc = "Ouverture de Neotree" })
map("n", "<leader>eb", ":Neotree buffers<CR>", {desc = "Liste des buffers ouverts" })

-- *************************************
-- * Groupe de mappings pour Which-key *
-- *************************************

local ok, wk = pcall(require, "which-key")
if ok then
  wk.register({
    e = { name = "Neotree" },
    l = { name = "Lazy" },
  }, { prefix = "<leader>", mode = "n" })
end

