local bind = require("keymap.bind")
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_cr = bind.map_cr
local map_callback = bind.map_callback
local et = bind.escape_termcode

local keymaps = {
  -- Plugin: accelerate-jk
  -- ["n|j"] = map_callback(function()
  -- 	return et("<Plug>(accelerated_jk_gj)")
  -- end):with_expr(),
  -- ["n|k"] = map_callback(function()
  -- 	return et("<Plug>(accelerated_jk_gk)")
  -- end):with_expr(),

  -- Plugin: auto_session
  -- ["n|<leader>ss"] = map_cu("SaveSession"):with_noremap():with_silent():with_desc("session: Save"),
  -- ["n|<leader>sr"] = map_cu("RestoreSession"):with_noremap():with_silent():with_desc("session: Restore"),
  -- ["n|<leader>sd"] = map_cu("DeleteSession"):with_noremap():with_silent():with_desc("session: Delete"),

  --[[ 看起来所有buffer管理的插件都会导致swp file异常的问题
	-- Plugin: nvim-bufdel
	["n|<leader>x"] = map_cr("BufDel"):with_noremap():with_silent():with_desc("buffer: Close current"),
	--]]

  -- Plugin: clever-f
  ["n|;"] = map_callback(function()
    return et("<Plug>(clever-f-repeat-forward)")
  end):with_expr(),

  -- Plugin: comment.nvim
  ["n|,/"] = map_callback(function()
      require("Comment.api").toggle.linewise.current()
    end)
    :with_silent()
    :with_noremap()
    :with_desc("edit: toggle line-comments"),
  -- ["v|,/"] = map_cmd("<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>"):with_silent():with_noremap():with_desc("edit: toggle selected line-comments"),

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

  ["n|,w"] = map_cu("Telescope grep_string"):with_noremap():with_silent():with_desc("find: Current word"),
  -- Plugin: hop
  ["n|gw"] = map_cu("HopWord"):with_noremap():with_desc("jump: Goto word"),
  ["n|gl"] = map_cu("HopLine"):with_noremap():with_desc("jump: Goto line"),

  -- Plugin: nvim-treehopper
  -- o: Operator-pending mode. 先按了操作，进入等待范围选择，比如 y(复制),d(删除),c(修改)
  --    这是因为vim是先输入要做的操作，再输入范围。
  ["o|m"] = map_cu("lua require('tsht').nodes()"):with_silent():with_desc("Operator-pending: motion syntax tree"),

  -- Plugin: vim-fugitive
  --["n|gps"] = map_cr("G push"):with_noremap():with_silent():with_desc("git: Push"),
  --["n|gpl"] = map_cr("G pull"):with_noremap():with_silent():with_desc("git: Pull"),
  --["n|<leader>G"] = map_cu("Git"):with_noremap():with_silent():with_desc("git: Open git-fugitive"),

  -- Plugin: nvim-tree
  ["n|<leader>e"] = map_cr("NvimTreeFindFile"):with_noremap():with_silent():with_desc("nvim-tree: Find file"),
  -- Focus 和 FindFile 在没有auto change root等配置下是等价的
  --["n|<leader>e"] = map_cr("NvimTreeFocus"):with_noremap():with_silent():with_desc("nvim-tree: focus"),

  -- Plugin: sniprun
  --["v|<leader>r"] = map_cr("SnipRun"):with_noremap():with_silent():with_desc("tool: Run code by range"),
  --["n|<leader>r"] = map_cu([[%SnipRun]]):with_noremap():with_silent():with_desc("tool: Run code by file"),

  -- Plugin: toggleterm

  ["t|<Esc><Esc>"] = map_cmd([[<C-\><C-n>]]):with_noremap():with_silent(),
  ["n|<A-i>"] = map_cr([[execute v:count . "ToggleTerm direction=float"]]):with_noremap():with_silent():with_desc("terminal: Toggle float"),
  ["i|<A-i>"] = map_cmd("<Esc><Cmd>ToggleTerm direction=float<CR>"):with_noremap():with_silent():with_desc("terminal: Toggle float"),
  ["t|<A-i>"] = map_cmd("<Esc><Cmd>ToggleTerm<CR>"):with_noremap():with_silent():with_desc("terminal: Toggle float"),

  -- Plugin: trouble
  --["n|gt"] = map_cr("TroubleToggle"):with_noremap():with_silent():with_desc("lsp: Toggle trouble list"),
  -- ["n|<leader>r"] = map_cr("Trouble lsp_references"):with_noremap():with_silent():with_desc("lsp: Show lsp references"),
  ["n|,d"] = map_cr("Trouble diagnostics"):with_noremap():with_silent():with_desc("lsp: Show document diagnostics"),

  -- ["n|<leader>tq"] = map_cr("Trouble quickfix")
  -- 	:with_noremap()
  -- 	:with_silent()
  -- 	:with_desc("lsp: Show quickfix list"),
  -- ["n|<leader>tl"] = map_cr("Trouble loclist"):with_noremap():with_silent():with_desc("lsp: Show loclist"),

  -- Plugin: telescope
  -- ["n|<leader>fc"] = map_cmd("<Cmd>Telescope commands<CR>"):with_silent():with_desc("tool: Toggle commands panel"),
  ["n|<leader>m"] = map_callback(function()
      -- command panel
      require("telescope.builtin").keymaps({
        lhs_filter = function(lhs)
          return not string.find(lhs, "Þ")
        end,
        layout_config = {
          width = 0.6,
          height = 0.7,
          prompt_position = "top",
        },
      })
    end)
    :with_noremap()
    :with_silent()
    :with_desc("tool: Toggle key-map command panel"),
  ["n|<leader>u"] = map_callback(function()
      require("telescope").extensions.undo.undo()
    end)
    :with_noremap()
    :with_silent()
    :with_desc("edit: Show undo history"),
  ["n|<leader>w"] = map_callback(function()
      require("telescope").extensions.live_grep_args.live_grep_args()
    end)
    :with_noremap()
    :with_silent()
    :with_desc("find: Word in project"),
  ["n|<leader>n"] = map_cu(":enew"):with_noremap():with_silent():with_desc("buffer: New"),
  ["n|<leader>f"] = map_cu("Telescope find_files previewer=false"):with_noremap():with_silent():with_desc("find: File in project"),
  ["n|<leader>z"] = map_cu("Telescope zoxide list"):with_noremap():with_silent():with_desc("edit: Change current direrctory by zoxide"),
  ["n|<leader>b"] = map_cu("Telescope buffers previewer=false"):with_noremap():with_silent():with_desc("find: Buffer opened"),
  ["n|<leader>j"] = map_cu("Telescope jumplist previewer=false"):with_noremap():with_silent():with_desc("show jumplist"),
  ["n|<leader>t"] = map_cu("Telescope tagstack previewer=false"):with_noremap():with_silent():with_desc("show tagstack"),
  ["n|<leader>q"] = map_cu("exit"):with_noremap():with_silent():with_desc("exit"),
}

bind.nvim_load_mapping(keymaps)
