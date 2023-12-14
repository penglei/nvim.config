local editor = {}

editor["rmagatti/auto-session"] = {
	lazy = true,
	cmd = { "SessionSave", "SessionRestore", "SessionDelete" },
	config = require("editor.auto-session"),
}

-- A minimalist Neovim plugin that auto pairs & closes brackets
editor["m4xshen/autoclose.nvim"] = {
	lazy = true,
	event = "InsertEnter",
	config = require("editor.autoclose"),
}

editor["max397574/better-escape.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.better-escape"),
}

editor["kylechui/nvim-surround"] = {
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
}

editor["LunarVim/bigfile.nvim"] = {
	lazy = false,
	config = require("editor.bigfile"),
	cond = require("core.settings").load_big_files_faster,
}

editor["penglei/symbols-outline.nvim"] = {
	lazy = true,
	cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
	config = require("tool.symbols-outline"),
}

--[[ bug: 这个插件可能跟其它插件有冲突，使用这个插件关闭buffer可能导致swap文件没删除。
editor["ojroques/nvim-bufdel"] = {
	lazy = true,
	event = "BufReadPost",
}
--]]

editor["rhysd/clever-f.vim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("editor.cleverf"),
}
editor["numToStr/Comment.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.comment"),
}

editor["RRethy/vim-illuminate"] = { -- highlighting other word under cursor
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.vim-illuminate"),
}
editor["romainl/vim-cool"] = { -- better search highlighting
	lazy = true,
	event = { "CursorMoved", "InsertEnter" },
}

editor["phaazon/hop.nvim"] = { -- <leader>w|j quick jump
	lazy = true,
	branch = "v2",
	event = "BufReadPost",
	config = require("editor.hop"),
}

--editor["folke/flash.nvim"] = {
--	lazy = true,
--	event = { "CursorHold", "CursorHoldI" },
--	config = require("editor.flash"),
--}

editor["sdiehl/vim-cabalfmt"] = {
	lazy = true,
	event = "BufReadPost",
}

----------------------------------------------------------------------
--                  :treesitter related plugins                    --
----------------------------------------------------------------------
editor["nvim-treesitter/nvim-treesitter"] = {
	lazy = true,
	build = function()
		if #vim.api.nvim_list_uis() ~= 0 then
			vim.api.nvim_command("TSUpdate")
		end
	end,
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.treesitter"),
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
		{ "nvim-treesitter/nvim-treesitter-context" },
		{ "mrjones2014/nvim-ts-rainbow" },
		{ "JoosepAlviste/nvim-ts-context-commentstring" },
		{ "mfussenegger/nvim-treehopper" },
		{ "andymass/vim-matchup" },
		{
			"windwp/nvim-ts-autotag",
			config = require("editor.autotag"),
		},
		{
			"NvChad/nvim-colorizer.lua",
			config = require("editor.colorizer"),
		},
		{ -- Occasionally, after pressing the Tab key, the cursor may move to an unexpected location.
			"abecodes/tabout.nvim",
			config = require("editor.tabout"),
		},
	},
}

return editor
