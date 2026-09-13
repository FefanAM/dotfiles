return {
	"rachartier/tiny-cmdline.nvim",

	require("vim._core.ui2").enable({}),

	init = function()
		vim.o.cmdheight = 0
	end,
}
