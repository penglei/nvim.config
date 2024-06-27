return function()
  local lspconfig = require("lspconfig")

  require("completion.mason").setup()
  require("completion.mason-lspconfig").setup()

  local base_opts = {
    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  }

  local setup_lsp = function(name, opts)
    local final_opts = vim.tbl_deep_extend("keep", opts, base_opts)
    lspconfig[name].setup(final_opts)
  end

  -- Set lsps (lsp server binary should be prepared manually instead of installing by mason)

  lspconfig.gopls.setup(require("completion.servers.gopls"))
  lspconfig.hls.setup({ filetypes = { "haskell", "lhaskell" } })
  lspconfig.ocamllsp.setup({})
  lspconfig.nickel_ls.setup({})
  lspconfig.nil_ls.setup({})
  lspconfig.buck2.setup({})
  lspconfig.pbls.setup({}) -- need and pbls and protoc binaries

  lspconfig.yamlls.setup({
    settings = {
      yaml = {
        schemas = {
          -- default any schema to prevent lsp schema diagnostic error
          [vim.fn.stdpath("config") .. "/config/schema-any.yaml"] = "/*",
        },
      },
    },
  })
  if vim.fn.executable("dart") == 1 then
    setup_lsp("dartls", require("completion.servers.dartls"))
  end
  if vim.fn.executable("deno") == 1 then
    lspconfig.denols.setup({ cmd = { "deno", "lsp", "--unstable-kv", "--unstable-cron" } })
  end
  -- lspconfig.tsserver.setup{}

  vim.api.nvim_command("LspStart") -- Start LSPs
end
