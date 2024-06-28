return function()
  local lspconfig = require("lspconfig")

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = true,
    underline = true,

    -- Set it to false if diagnostics virtual text is annoying.
    virtual_text = true,

    -- set update_in_insert to false bacause it was enabled by lspsaga
    update_in_insert = false,
  })

  local common_opts = {
    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  }

  local get_server_opts = function(lsp_name)
    local ok, server_opts = pcall(require, "completion.servers." .. lsp_name)
    if ok and type(server_opts) == "table" then
      return server_opts
    else
      -- vim.notify(string.format("server:%s opt is not table", lsp_name), vim.log.levels.WARN, {
      --   title = "Lsp setup",
      -- })
      return {}
    end
  end

  local setup_lsp = function(lsp_name, opts)
    if opts == nil then
      opts = {}
    end
    local lsp_opts = vim.tbl_deep_extend("force", common_opts, opts)
    local final_opts = vim.tbl_deep_extend("force", get_server_opts(lsp_name), lsp_opts)
    lspconfig[lsp_name].setup(final_opts)
  end

  -- lspconfig.lua_ls.setup(servercfg("lua_ls"))
  setup_lsp("lua_ls")
  -- lspconfig.clangd.setup(servercfg("clangd"))
  setup_lsp("clangd")
  -- lspconfig.bashls.setup({ cmd = { "bash-language-server", "start" }, filetypes = { "bash", "sh" } })
  setup_lsp("bashls", { cmd = { "bash-language-server", "start" }, filetypes = { "bash", "sh" } })
  -- lspconfig.pylsp.setup(servercfg("pylsp"))
  setup_lsp("pylsp")
  -- lspconfig.gopls.setup(servercfg("gopls"))
  setup_lsp("gopls")
  -- lspconfig.html.setup(servercfg("html"))
  setup_lsp("html")
  -- lspconfig.hls.setup({ filetypes = { "haskell", "lhaskell" } })
  setup_lsp("hls", { filetypes = { "haskell", "lhaskell" } })
  -- lspconfig.ocamllsp.setup({})
  setup_lsp("ocamllsp")
  -- lspconfig.nickel_ls.setup({})
  setup_lsp("nickel_ls")
  -- lspconfig.nil_ls.setup({})
  setup_lsp("nil_ls")
  -- lspconfig.buck2.setup({})
  setup_lsp("buck2")
  -- lspconfig.pbls.setup({}) -- need and pbls and protoc binaries
  setup_lsp("pbls")

  -- lspconfig.jsonls.setup(servercfg("jsonls"))
  setup_lsp("jsonls")
  setup_lsp("yamlls", {
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
    setup_lsp("dartls")
  end
  if vim.fn.executable("deno") == 1 then
    -- lspconfig.denols.setup({ cmd = { "deno", "lsp", "--unstable-kv", "--unstable-cron" } })
    setup_lsp("denols", { cmd = { "deno", "lsp", "--unstable-kv", "--unstable-cron" } })
  end
  -- lspconfig.tsserver.setup{}

  vim.api.nvim_command("LspStart") -- Start LSPs
end
