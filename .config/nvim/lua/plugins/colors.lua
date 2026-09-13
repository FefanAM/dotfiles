return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "frappe",
				transparent_background = true,
				float = {
					transparent = true, -- enable transparent floating windows
					solid = false, -- use solid styling for floating windows, see |winborder|
				},
				integrations = {
					cmp = true,
					nvimtree = true,
					lualine = {
						all = function(colors)
							---@type CtpIntegrationLualineOverride
							return {
								-- Specifying a normal-mode status line override for section a's background and b's foreground to use lavender like the main Catppuccin theme
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
