return {
	"nat-418/boole.nvim",
	config = function()
		require("boole").setup({
			mappings = {
				increment = '<leader>t',
				decrement = '<leader>T'
			},
			allow_caps_additions = {
				{ 'public',  'protected', 'private' },
				{ 'local',   'global' },
				{ 'enabled', 'disabled' },
			}
		})
	end
}
