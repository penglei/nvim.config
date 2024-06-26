local M = {}

M["ray-x/go.nvim"] = {
	dependencies = { -- optional packages
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		--vim.notify("config ray-x/go")
		require("go").setup()
	end,
	event = { "CmdlineEnter" },
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
-- lang["fatih/vim-go"] = {
-- 	lazy = true,
-- 	ft = "go",
-- 	build = ":GoInstallBinaries",
-- 	config = require("lang.vim-go"),
-- }

M["simrat39/rust-tools.nvim"] = {
	lazy = true,
	ft = "rust",
	config = require("lang.rust-tools"),
	dependencies = { "nvim-lua/plenary.nvim" },
}
M["Saecki/crates.nvim"] = {
	lazy = true,
	event = "BufReadPost Cargo.toml",
	config = require("lang.crates"),
	dependencies = { "nvim-lua/plenary.nvim" },
}

M["iamcco/markdown-preview.nvim"] = {
	lazy = true,
	ft = "markdown",
	build = ":call mkdp#util#install()",
}
M["chrisbra/csv.vim"] = {
	lazy = true,
	ft = "csv",
}
M["edgedb/edgedb-vim"] = {
	lazy = true,
	ft = "edgeql"
}
return M
