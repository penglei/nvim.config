return function()
	local lspconfig = require("lspconfig")

	require("core.command").CreateDiagnosticAutoToggle()

	require("completion.mason").setup()
	require("completion.mason-lspconfig").setup()


	local opts = {
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
	}

	-- Set lsps that are not supported by `mason.nvim` but supported by `nvim-lspconfig` here.
	if vim.fn.executable("dart") == 1 then
		local _opts = require("completion.servers.dartls")
		local final_opts = vim.tbl_deep_extend("keep", _opts, opts)
		lspconfig.dartls.setup(final_opts)
	end

	lspconfig.hls.setup({ filetypes = { "haskell", "lhaskell" } })
	lspconfig.ocamllsp.setup({})
	lspconfig.nickel_ls.setup({})
	lspconfig.nil_ls.setup {}
	lspconfig.buck2.setup {}
	lspconfig.denols.setup { cmd = { "deno", "lsp", "--unstable-kv", "--unstable-cron" } }
	-- lspconfig.tsserver.setup{}

	vim.api.nvim_command([[LspStart]]) -- Start LSPs
end
