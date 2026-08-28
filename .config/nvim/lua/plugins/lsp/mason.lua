return {
	"williamboman/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"ts_ls",
			"html",
			"cssls",
			"lua_ls",
			"pyright",
			"clangd",
			"rust_analyzer"
		},
	},
	dependencies = {
		{
			"williamboman/mason.nvim",
			opts = {},
		},
		"neovim/nvim-lspconfig",
	},
}
