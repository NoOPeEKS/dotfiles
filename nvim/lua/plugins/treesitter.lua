return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = { "lua", "go","rust","python", "markdown", "markdown_inline", "elixir", "heex", "ruby", "angular" },
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
