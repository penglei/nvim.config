-- real command should be created after lazy load
local M = {}

M.CreateDiagnosticAutoToggle = function()
	vim.api.nvim_create_user_command(
		"DiagnosticAutoToggle",
		(function()
			local show = true
			return function()
				if show then
					show = false
					vim.diagnostic.hide()
				else
					show = true
					vim.diagnostic.show()
				end
			end
		end)(),
		{}
	)
end

--[[
M.CreateDapUIToggle = function()
	vim.api.nvim_create_user_command("DapUIToggle", function()
		require("dapui").toggle()
	end, {})
end
--]]

return M
