return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'saghen/blink.cmp',
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
	},
	config = function()
		-- Get capabilities from blink.cmp
		local capabilities = require('blink.cmp').get_lsp_capabilities()

		local lspconfig = require('lspconfig')

		-- Setup Mason to install and configure servers
		require('mason').setup()
		require('mason-lspconfig').setup({
			ensure_installed = {
				"ts_ls",
				"html",
				"cssls",
				"lua_ls",
				"pyright",
				"clangd",
				"rust_analyzer"
			},
			handlers = {
				-- Default handler applied to all installed servers
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,

				-- Custom configuration for specific servers (example: lua_ls)
				['lua_ls'] = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { 'vim' },
								},
							},
						},
					})
				end,
			},
		})
	end,
}
