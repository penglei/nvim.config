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
