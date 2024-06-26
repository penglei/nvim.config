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

-- theme: nord
ui["shaunsingh/nord.nvim"] = {
	lazy = true,
	config = require("ui.nord"),
}

ui["j-hui/fidget.nvim"] = {
	-- Standalone UI for nvim-lsp progress
	-- TODO:
	--   bug: conflict with clever-f while press 'f' in boot progress
	lazy = true,
	event = "BufReadPost",
	config = require("ui.fidget"),
}

ui["lewis6991/gitsigns.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.gitsigns"),
}

--[[
ui["lukas-reineke/indent-blankline.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("ui.indent-blankline"),
}
--]]

ui["nvim-lualine/lualine.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("ui.lualine"),
}

-- Neovim plugin for dimming the highlights of unused functions, variables, parameters, and more
ui["zbirenbaum/neodim"] = {
	lazy = true,
	event = "LspAttach",
	config = require("ui.neodim"),
}

--ui["karb94/neoscroll.nvim"] = {
--	lazy = true,
--	event = "BufReadPost",
--	config = require("ui.neoscroll"),
--}


ui["rcarriga/nvim-notify"] = {
	lazy = false,
	--event = "VeryLazy",
	config = require("ui.notify"),
}

--[[
ui["folke/paint.nvim"] = { -- comment highlight
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.paint"),
}
--]]

-- --Show where your cursor moves when jumping large distances
-- --  This plugin has a ugly implementation which create some unnecessary windows.
-- ui["edluffy/specs.nvim"] = {
-- 	lazy = true,
-- 	event = "CursorMoved",
-- 	config = require("ui.specs"),
-- 	enabled = false,
-- }

-- the better quickfix manager (trailblazer show marks in qf)
ui["kevinhwang91/nvim-bqf"] = {
	ft = "qf",
}

return ui
