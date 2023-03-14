vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"dap-repl",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.api.nvim_buf_set_keymap(event.buf, "n", "n", "DebugStepOver", {
			callback = function()
				require("dap").step_over()
			end,
			silent = true,
			noremap = true,
			desc = "debugger: step over in dap-repl",
		})
		vim.api.nvim_buf_set_keymap(event.buf, "n", "s", "DebugStepInto", {
			callback = function()
				require("dap").step_into()
			end,
			silent = true,
			noremap = true,
			desc = "debugger: step into in dap-repl",
		})
		vim.api.nvim_buf_set_keymap(event.buf, "n", "o", "DebugStepOut", {
			callback = function()
				require("dap").step_out()
			end,
			silent = true,
			noremap = true,
			desc = "debugger: step out in dap-repl",
		})
		vim.api.nvim_buf_set_keymap(event.buf, "n", "q", "DebugTerminate", {
			callback = function()
				require("dap").terminate()
			end,
			silent = true,
			noremap = true,
			desc = "debugger: terminate",
		})
	end,
})
