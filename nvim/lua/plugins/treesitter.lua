return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"lua",
			"javascript",
			"typescript",
			"python",
			"go",
      "gomod",
      "gosum",
      "gowork",
      "gotmpl",
			"sql",
			"make",
			"dockerfile",
			"yaml",
			"graphql",
			"terraform",
			"proto",
			"html",
		},
		sync_install = false,
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
	},
	config = function(_, opts)
		local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
		if not status_ok then
			return
		end
		treesitter.setup(opts)
	end,
}
