local function setup_simple_lsp_formatter()
  require("completion.formatting").configure_format_on_save()
end

local function setup_conform()
  vim.api.nvim_create_user_command("Format", function(args)
    local range = nil
    if args.count ~= -1 then
      local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
      range = {
        start = { args.line1, 0 },
        ["end"] = { args.line2, end_line:len() },
      }
    end
    require("conform").format({ async = true, lsp_format = "fallback", range = range })
  end, { range = true })

  vim.api.nvim_create_user_command("FormatDisable", function(args)
    if args.bang then
      -- FormatDisable! will disable formatting just for this buffer
      vim.b.disable_autoformat = true
    else
      vim.g.disable_autoformat = true
    end
  end, {
    desc = "Disable autoformat-on-save",
    bang = true,
  })

  vim.api.nvim_create_user_command("FormatEnable", function()
    vim.b.disable_autoformat = false
    vim.g.disable_autoformat = false
  end, {
    desc = "Re-enable autoformat-on-save",
  })

  vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  require("conform").setup({
    format_on_save = function(bufnr)
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end

      -- Disable autoformat for files in a certain path
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      if bufname:match("/node_modules/") then
        return
      end

      return { timeout_ms = 500, lsp_format = "fallback" }
    end,
    log_level = vim.log.levels.DEBUG,
    lsp_format = "prefer",
    -- Define your formatters
    formatters_by_ft = {
      nix = { "nixfmt" },
      lua = { "stylua" },
      python = { "isort", "black" },
      javascript = { "prettierd", "prettier" },
      go = { "goimports", "gofmt" },
    },
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
      },
      goimports = {
        append_args = {
          "-local",
          -- 这些常用的顶层module不会被别的module引用，一定是local。
          -- 遗留问题是如何处理公共包(如khaos/pkg)? 只有按照project/lsp root来定义才行。
          "git.woa.com/khaos/platform",
          "git.woa.com/khaos/apiserver",
          "git.woa.com/khaos/scheduler",
        },
      },
    },
  })
end

return function()
  -- setup_simple_lsp_formatter()
  setup_conform()
end
