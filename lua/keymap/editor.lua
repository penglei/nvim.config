local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback
local et = bind.escape_termcode

local plug_map = {
	-- Plugin: accelerate-jk
	-- ["n|j"] = map_callback(function()
	-- 	return et("<Plug>(accelerated_jk_gj)")
	-- end):with_expr(),
	-- ["n|k"] = map_callback(function()
	-- 	return et("<Plug>(accelerated_jk_gk)")
	-- end):with_expr(),

	-- Plugin: auto_session
	["n|<leader>ss"] = map_cu("SaveSession"):with_noremap():with_silent():with_desc("session: Save"),
	["n|<leader>sr"] = map_cu("RestoreSession"):with_noremap():with_silent():with_desc("session: Restore"),
	["n|<leader>sd"] = map_cu("DeleteSession"):with_noremap():with_silent():with_desc("session: Delete"),

	--[[ 看起来所有buffer管理的插件都会导致swp file异常的问题
	-- Plugin: nvim-bufdel
	["n|<leader>x"] = map_cr("BufDel"):with_noremap():with_silent():with_desc("buffer: Close current"),
	--]]

	-- Plugin: clever-f
	["n|;"] = map_callback(function()
		return et("<Plug>(clever-f-repeat-forward)")
	end):with_expr(),

	-- Plugin: comment.nvim
	["n|<leader>/"] = map_callback(function()
			require("Comment.api").toggle.linewise.current()
		end)
		:with_silent()
		:with_noremap()
		:with_desc("edit: toggle line-comments"),
	["v|<leader>/"] = map_cmd("<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")
		:with_silent()
		:with_noremap()
		:with_desc("edit: toggle selected line-comments"),
	-- ["n|gbc"] = map_callback(function()
	-- 		return vim.v.count == 0 and et("<Plug>(comment_toggle_blockwise_current)")
	-- 			or et("<Plug>(comment_toggle_blockwise_count)")
	-- 	end)
	-- 	:with_silent()
	-- 	:with_noremap()
	-- 	:with_expr()
	-- 	:with_desc("edit: Toggle comment for block"),
	-- ["n|gc"] = map_cmd("<Plug>(comment_toggle_linewise)")
	-- 	:with_silent()
	-- 	:with_noremap()
	-- 	:with_desc("edit: Toggle comment for line with operator"),
	-- ["n|gb"] = map_cmd("<Plug>(comment_toggle_blockwise)")
	-- 	:with_silent()
	-- 	:with_noremap()
	-- 	:with_desc("edit: Toggle comment for block with operator"),
	-- ["x|gc"] = map_cmd("<Plug>(comment_toggle_linewise_visual)")
	-- 	:with_silent()
	-- 	:with_noremap()
	-- 	:with_desc("edit: Toggle comment for line with selection"),
	-- ["x|gb"] = map_cmd("<Plug>(comment_toggle_blockwise_visual)")
	-- 	:with_silent()
	-- 	:with_noremap()
	-- 	:with_desc("edit: Toggle comment for block with selection"),

	-- Plugin: diffview
	--["n|<leader>D"] = map_cr("DiffviewOpen"):with_silent():with_noremap():with_desc("git: Show diff"),
	--["n|<leader><leader>D"] = map_cr("DiffviewClose"):with_silent():with_noremap():with_desc("git: Close diff"),

	-- Plugin: vim-easy-align
	--["n|gea"] = map_callback(function()
	--		return et("<Plug>(EasyAlign)")
	--	end)
	--	:with_expr()
	--	:with_desc("edit: Align with delimiter"),
	--["x|gea"] = map_callback(function()
	--		return et("<Plug>(EasyAlign)")
	--	end)
	--	:with_expr()
	--	:with_desc("edit: Align with delimiter"),

	-- Plugin: hop
	["n|gw"] = map_cu("HopWord"):with_noremap():with_desc("jump: Goto word"),
	["n|gl"] = map_cu("HopLine"):with_noremap():with_desc("jump: Goto line"),
	--["n|<leader>k"] = map_cu("HopLine"):with_noremap():with_desc("jump: Goto line"),
	--["n|<leader>c"] = map_cu("HopChar1"):with_noremap():with_desc("jump: Goto one char"),
	--["n|<leader>cc"] = map_cu("HopChar2"):with_noremap():with_desc("jump: Goto two chars"),

	-- Plugin: nvim-treehopper
	-- o: Operator-pending mode. 先按了操作，进入等待范围选择，比如 y(复制),d(删除),c(修改)
	--    这是因为vim是先输入要做的操作，再输入范围。
	["o|m"] = map_cu("lua require('tsht').nodes()"):with_silent():with_desc("jump: Operate across syntax tree"),

	-- Plugin: tabout
	--["i|<A-l>"] = map_cmd("<Plug>(TaboutMulti)"):with_silent():with_noremap():with_desc("edit: Goto end of pair"),
	--["i|<A-h>"] = map_cmd("<Plug>(TaboutBackMulti)"):with_silent():with_noremap():with_desc("edit: Goto begin of pair"),
}

bind.nvim_load_mapping(plug_map)
