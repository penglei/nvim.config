local ui = {}

ui["goolord/alpha-nvim"] = {
	lazy = true,
	event = "BufWinEnter",
	config = require("ui.alpha"),
}
ui["akinsho/bufferline.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("ui.bufferline"),
}
ui["catppuccin/nvim"] = {
	lazy = false,
	name = "catppuccin",
	config = require("ui.catppuccin"),
}
ui["j-hui/fidget.nvim"] = {
	-- Standalone UI for nvim-lsp progress
	-- TODO:
	--   BUG: conflict with clever-f while press 'f' in boot progress
	lazy = true,
	event = "BufReadPost",
	config = require("ui.fidget"),
}
ui["lewis6991/gitsigns.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.gitsigns"),
}
ui["lukas-reineke/indent-blankline.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("ui.indent-blankline"),
}
ui["nvim-lualine/lualine.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("ui.lualine"),
}

ui["zbirenbaum/neodim"] = {
	-- Neovim plugin for dimming the highlights of unused functions, variables, parameters, and more
	lazy = true,
	event = "LspAttach",
	config = require("ui.neodim"),
}

--ui["karb94/neoscroll.nvim"] = {
--	lazy = true,
--	event = "BufReadPost",
--	config = require("ui.neoscroll"),
--}

ui["shaunsingh/nord.nvim"] = { -- theme: nord
	lazy = true,
	config = require("ui.nord"),
}

-- ui["rcarriga/nvim-notify"] = {
-- 	lazy = true,
-- 	event = "VeryLazy",
-- 	config = require("ui.notify"),
-- }

ui["folke/paint.nvim"] = { -- comment highlight
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.paint"),
}

ui["edluffy/specs.nvim"] = {
	--Show where your cursor moves when jumping large distances
	--  This plugin has a ugly implementation which create some unnecessary windows.
	lazy = true,
	event = "CursorMoved",
	config = require("ui.specs"),
	enabled = false,
}

ui["kevinhwang91/nvim-bqf"] = {
	-- the better quickfix manager (trailblazer show marks in qf)
	ft = "qf",
}

return ui
