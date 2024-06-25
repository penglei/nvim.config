local completion = {}

completion["neovim/nvim-lspconfig"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("completion.lsp"),
	dependencies = {
		{ "ray-x/lsp_signature.nvim" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{
			"nvimdev/lspsaga.nvim",
			config = require("completion.lspsaga"),
		},
	},
}

completion["penglei/nvim-cmp"] = {
	lazy = true,
	event = "InsertEnter",
	config = require("completion.cmp"),
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			dependencies = { "rafamadriz/friendly-snippets" },
			config = require("completion.luasnip"),
		},
		{ "onsails/lspkind.nvim" },
		{ "lukas-reineke/cmp-under-comparator" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "andersevenrud/cmp-tmux" },
		{ "hrsh7th/cmp-path" },
		{ "f3fora/cmp-spell" },
		{ "hrsh7th/cmp-buffer" },
		{ "kdheepak/cmp-latex-symbols" },
		{ "ray-x/cmp-treesitter" },
	},
}


-- completion["dense-analysis/ale"] = {
-- 	lazy = true,
-- 	event = { "BufReadPost",},
-- }

completion["eraserhd/parinfer-rust"] = {
	dir = vim.fn.expand("$HOME/.config/local-nvim-plugins/parinfer-rust"),
	config = function()
		vim.g.parinfer_dylib_path = vim.fn.expand("$HOME/.nix-profile/lib/libparinfer_rust.dylib")
	end,
}

return completion
