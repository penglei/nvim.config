local M = {}

M.setup = function()
	local lspconfig = require("lspconfig")
	local mason_lspconfig = require("mason-lspconfig")

	mason_lspconfig.setup({
		-- Set the language servers that will be installed during bootstrap here
		-- check the below link for all the supported LSPs:
		-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations
		ensure_installed =
		{
			"bashls",
			"clangd",
			"html",
			"jsonls",
			"lua_ls",
			"pylsp",
		}
	})

	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		signs = true,
		underline = true,

		-- Set it to false if diagnostics virtual text is annoying.
		virtual_text = true,

		-- set update_in_insert to false bacause it was enabled by lspsaga
		update_in_insert = false,
	})

	local opts = {
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
	}

	--A handler to setup all servers defined under `completion/servers/*.lua`
	--@param lsp_name string
	local function mason_handler(lsp_name)
		-- vim.notify(string.format("init lsp: %s", lsp_name), vim.log.levels.INFO, { title = "mason auto install and initialize lsp" })
		local ok, custom_handler = pcall(require, "completion.servers." .. lsp_name)
		if not ok then
			-- Default to use factory config for server(s) that doesn't include a spec
			lspconfig[lsp_name].setup(opts)
			return
		elseif type(custom_handler) == "function" then
			--- Case where language server requires its own setup
			--- Make sure to call require("lspconfig")[lsp_name].setup() in the function
			--- See `clangd.lua` for example.
			custom_handler(opts)
		elseif type(custom_handler) == "table" then
			lspconfig[lsp_name].setup(vim.tbl_deep_extend("force", opts, custom_handler))
		else
			vim.notify(
				string.format(
					"Failed to setup [%s].\n\nServer definition under `completion/servers` must return\neither a fun(opts) or a table (got '%s' instead)",
					lsp_name,
					type(custom_handler)
				),
				vim.log.levels.ERROR,
				{ title = "nvim-lspconfig" }
			)
		end
	end

	mason_lspconfig.setup_handlers({ mason_handler })
end

return M
