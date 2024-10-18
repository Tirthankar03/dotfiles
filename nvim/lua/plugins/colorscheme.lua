return {
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = true,
		priority = 1000,
		opts = function()
			return {
				transparent = true,
			}
		end,
		config = function()
			-- Enable transparency in Neovim UI elements
			vim.opt.winblend = 20 -- Controls transparency of floating windows (adjust as needed)
			vim.opt.pumblend = 20 -- Controls transparency of the popup menu (adjust as needed)
			vim.opt.termguicolors = true -- Enable true color support
		end,
	},
}
