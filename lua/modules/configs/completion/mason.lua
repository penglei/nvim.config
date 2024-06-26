local M = {}

M.setup = function()
	local icons = {
		ui = require("modules.utils.icons").get("ui", true),
		misc = require("modules.utils.icons").get("misc", true),
	}

	require("mason").setup({
		ui = {
			border = "single",
			icons = {
				package_pending = icons.ui.Modified_alt,
				package_installed = icons.ui.Check,
				package_uninstalled = icons.misc.Ghost,
			},
			keymaps = {
				toggle_server_expand = "<CR>",
				install_server = "i",
				update_server = "u",
				check_server_version = "c",
				update_all_servers = "U",
				check_outdated_servers = "C",
				uninstall_server = "X",
				cancel_installation = "<C-c>",
			},
		},
	})

	-- 这种方式安装这些插件有点奇怪，不知道有什么作用，为什么不直接用mason安装呢?
	--[[
	local mason_registry = require("mason-registry")
	-- Additional plugins for pylsp
	mason_registry:on(
		"package:install:success",
		vim.schedule_wrap(function(pkg)
			vim.notify("installing pylsp plugins...")
			if pkg.name ~= "python-lsp-server" then
				return
			end

			local venv = vim.fn.stdpath("data") .. "/mason/packages/python-lsp-server/venv"
			local python = venv .. "/bin/python"
			local black = venv .. "/bin/black"
			local ruff = venv .. "/bin/ruff"

			require("plenary.job")
				:new({
					command = python,
					args = {
						"-m",
						"pip",
						"install",
						"-U",
						"--disable-pip-version-check",
						"python-lsp-black",
						"python-lsp-ruff",
						"pylsp-rope",
					},
					cwd = venv,
					env = { VIRTUAL_ENV = venv },
					on_exit = function()
						if vim.fn.executable(black) == 1 and vim.fn.executable(ruff) == 1 then
							vim.notify(
								"Finished installing pylsp plugins",
								vim.log.levels.INFO,
								{ title = "[lsp] Install Status" }
							)
						else
							vim.notify(
								"Failed to install pylsp plugins. [Executable not found]",
								vim.log.levels.ERROR,
								{ title = "[lsp] Install Failure" }
							)
						end
					end,
					on_start = function()
						vim.notify(
							"Now installing pylsp plugins...",
							vim.log.levels.INFO,
							{ title = "[lsp] Install Status", timeout = 6000 }
						)
					end,
					on_stderr = function(_, msg_stream)
						vim.notify(msg_stream, vim.log.levels.ERROR, { title = "[lsp] Install Failure" })
					end,
				})
				:start()
		end)
	)
	--]]
end

return M
