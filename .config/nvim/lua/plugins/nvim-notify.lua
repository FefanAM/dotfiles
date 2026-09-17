return {
	'rcarriga/nvim-notify',
	config = function()
		require('notify').setup({
			stages = "slide",
			render = "default",
			timeout = 5000,
			top_down = true,
		})
		vim.notify = require('notify')
	end
}
