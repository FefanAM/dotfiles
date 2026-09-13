return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "frappe",
				transparent_background = true,
				float = {
					transparent = false, -- enable transparent floating windows
					solid = false, -- use solid styling for floating windows, see |winborder|
				},
				integrations = {
					cmp = true,
					nvimtree = true,
					lualine = {
						all = function()
							---@type CtpIntegrationLualineOverride
							return {
								normal = {
									c = { bg = "#414559" },
								}
							}
						end,
					}
				}
			})

			vim.cmd.colorscheme("catppuccin")
		end
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			theme = "tomorrow_night",
		}
	},
}
