return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'saghen/blink.cmp',
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
	},
	config = function()
		local capabilities = require('blink.cmp').get_lsp_capabilities()

		local lspconfig = require('lspconfig')

		require('mason').setup()
		require('mason-lspconfig').setup({
			ensure_installed = {
				"ts_ls",
				"vue_ls",
				"html",
				"cssls",
				"lua_ls",
				"pyright",
				"clangd",
				"rust_analyzer"
			},
			handlers = {
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,

				['ts_ls'] = function()
					lspconfig.ts_ls.setup({
						capabilities = capabilities,
						filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
						init_options = {
							plugins = {
								{
									name = '@vue/typescript-plugin',
									location = vim.fn.stdpath('data') ..
										'/mason/packages/vue-language-server/node_modules/@vue/language-server',
									languages = { 'vue' },
								},
							},
						},
					})
				end,

				-- Vue language server
				['vue_ls'] = function()
					lspconfig.vue_ls.setup({
						capabilities = capabilities,
					})
				end,

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

		-- Ensure ts_ls attaches to Vue files
		vim.api.nvim_create_autocmd('FileType', {
			pattern = 'vue',
			callback = function(args)
				local root_dir = vim.fs.root(args.buf, { 'package.json' })
				local mason_path = vim.fn.stdpath('data') ..
					'/mason/packages/vue-language-server/node_modules/@vue/language-server'

				vim.lsp.start({
					name = 'ts_ls',
					cmd = { 'typescript-language-server', '--stdio' },
					root_dir = root_dir,
					init_options = {
						plugins = {
							{
								name = '@vue/typescript-plugin',
								location = mason_path,
								languages = { 'vue' },
							},
						},
					},
					capabilities = capabilities,
				})
			end,
		})
	end,
}
