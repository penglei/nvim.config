local tool = {}

--[[
tool["tpope/vim-fugitive"] = {
	lazy = true,
	cmd = { "Git", "G" },
}
--]]

-- Please don't remove which-key.nvim otherwise you need to set timeoutlen=300 at `lua/core/options.lua`
tool["folke/which-key.nvim"] = {
	lazy = true,
	event = "VeryLazy",
	config = require("tool.which-key"),
}

tool["nvim-tree/nvim-tree.lua"] = {
	lazy = true,
	cmd = {
		"NvimTreeToggle",
		"NvimTreeOpen",
		"NvimTreeFindFile",
		"NvimTreeFindFileToggle",
		"NvimTreeRefresh",
	},
	config = require("tool.nvim-tree"),
}

tool["ibhagwan/smartyank.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("tool.smartyank"),
}
--tool["michaelb/sniprun"] = {
--	lazy = true,
--	-- You need to cd to `~/.local/share/nvim/site/lazy/sniprun/` and execute `bash ./install.sh`,
--	-- if you encountered error about no executable sniprun found.
--	build = "bash ./install.sh",
--	cmd = { "SnipRun" },
--	config = require("tool.sniprun"),
--}
tool["akinsho/toggleterm.nvim"] = {
	lazy = true,
	cmd = {
		"ToggleTerm",
		"ToggleTermSetName",
		"ToggleTermToggleAll",
		"ToggleTermSendVisualLines",
		"ToggleTermSendCurrentLine",
		"ToggleTermSendVisualSelection",
	},
	config = require("tool.toggleterm"),
}
tool["folke/trouble.nvim"] = {
	lazy = true,
	cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
	config = require("tool.trouble"),
}

-- Automatically provides suggestions as you type ':'(command mode) or '/'(search mode)
tool["gelguy/wilder.nvim"] = {
	lazy = true,
	event = "CmdlineEnter",
	config = require("tool.wilder"),
	dependencies = { "romgrk/fzy-lua-native" },
}

-- custom jump stack mark
tool["LeonHeidelbach/trailblazer.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("tool.trailblazer"),
}

----------------------------------------------------------------------
--                        Telescope Plugins                         --
----------------------------------------------------------------------
tool["nvim-telescope/telescope.nvim"] = {
	lazy = true,
	cmd = "Telescope",
	ft = { "alpha" },
	config = require("tool.telescope"),
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		{ "nvim-lua/plenary.nvim" },
		{ "debugloop/telescope-undo.nvim" },
		{
			"ahmedkhalf/project.nvim",
			event = "BufReadPost",
			config = require("tool.project"),
		},
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-frecency.nvim",
			dependencies = {
				{ "kkharji/sqlite.lua", config = function ()
					--nix profile install nixpkgs#sqlite.out
					vim.g.sqlite_clib_path = vim.fn.expand("$HOME/.nix-profile/lib/libsqlite3.dylib")
				end},
			}
		},
		{ "jvgrootveld/telescope-zoxide" },
		{ "nvim-telescope/telescope-live-grep-args.nvim" },
	},
}

----------------------------------------------------------------------
--                           DAP Plugins                            --
----------------------------------------------------------------------
--[[
tool["mfussenegger/nvim-dap"] = {
	lazy = true,
	cmd = {
		"DapSetLogLevel",
		"DapShowLog",
		"DapContinue",
		"DapToggleBreakpoint",
		"DapToggleRepl",
		"DapStepOver",
		"DapStepInto",
		"DapStepOut",
		"DapTerminate",
		"DapUIToggle",
	},
	config = require("tool.dap"),
	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			config = require("tool.dap.dapui"),
		},
	},
}
--]]

return tool
