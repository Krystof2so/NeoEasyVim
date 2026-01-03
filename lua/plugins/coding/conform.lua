return {
	{
		"stevearc/conform.nvim",
		-- On utilise la configuration centralisée du module core.format.conform
		opts = function()
			require("core.format.conform").setup()
		end,
	},
}
