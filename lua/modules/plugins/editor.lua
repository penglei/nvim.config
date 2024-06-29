local editor = {}

-- editor["rmagatti/auto-session"] = {
-- 	lazy = true,
-- 	cmd = { "SessionSave", "SessionRestore", "SessionDelete" },
-- 	config = require("editor.auto-session"),
-- }

-- A minimalist Neovim plugin that auto pairs & closes brackets
editor["m4xshen/autoclose.nvim"] = {
  lazy = true,
  event = "InsertEnter",
  config = require("editor.autoclose"),
}

editor["max397574/better-escape.nvim"] = {
  lazy = true,
  event = { "CursorHold", "CursorHoldI" },
  config = require("editor.better-escape"),
}

editor["kylechui/nvim-surround"] = {
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
    })
  end,
}

editor["LunarVim/bigfile.nvim"] = {
  lazy = false,
  config = require("editor.bigfile"),
  cond = require("core.settings").load_big_files_faster,
}

-- editor["penglei/symbols-outline.nvim"] = {
-- 	lazy = true,
-- 	cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
-- 	config = require("tool.symbols-outline"),
-- }

-- --bug: 这个插件可能跟其它插件有冲突，使用这个插件关闭buffer可能导致swap文件没删除。
-- editor["ojroques/nvim-bufdel"] = {
-- 	lazy = true,
-- 	event = "BufReadPost",
-- }
editor["famiu/bufdelete.nvim"] = {
  lazy = true,
  event = "VeryLazy",
}

editor["rhysd/clever-f.vim"] = {
  lazy = true,
  event = { "BufReadPost", "BufAdd", "BufNewFile" },
  config = require("editor.cleverf"),
}
editor["numToStr/Comment.nvim"] = {
  lazy = true,
  event = { "CursorHold", "CursorHoldI" },
  config = require("editor.comment"),
}

editor["RRethy/vim-illuminate"] = { -- highlighting other word under cursor
  lazy = true,
  event = { "CursorHold", "CursorHoldI" },
  config = require("editor.vim-illuminate"),
}
editor["romainl/vim-cool"] = { -- better search highlighting
  lazy = true,
  event = { "CursorMoved", "InsertEnter" },
}

editor["smoka7/hop.nvim"] = { -- <leader>w|j quick jump
  lazy = true,
  --branch = "v2",
  event = "BufReadPost",
  config = function()
    require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
  end,
}

-- 三个字符跳到窗口中任何位置.
-- 覆盖了's'
-- editor["ggandor/leap.nvim"] = { -- s{first char}{second char}{Leap Hit}
--   lazy = true,
--   event = "BufReadPost",
--   config = function ()
--   	require("leap").add_default_mappings()
--   end,
-- }

----------------------------------------------------------------------
--                  :treesitter related plugins                    --
----------------------------------------------------------------------
editor["nvim-treesitter/nvim-treesitter"] = {
  build = function()
    if #vim.api.nvim_list_uis() ~= 0 then
      vim.api.nvim_command("TSUpdate")
    end
  end,
  event = { "CursorHold", "CursorHoldI" },
  -- event = { "BufReadPost" },
  config = require("editor.treesitter"),
  dependencies = {
    { "andymass/vim-matchup" },
    { "mfussenegger/nvim-treehopper" },
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    {
      "windwp/nvim-ts-autotag",
      config = require("editor.autotag"),
    },
    {
      "NvChad/nvim-colorizer.lua",
      config = require("editor.colorizer"),
    },
    {
      "hiphish/rainbow-delimiters.nvim",
      -- url = "https://gitlab.com/HiPhish/rainbow-delimiters.nvim.git",
      config = require("editor.rainbow_delims"),
    },
    -- { "nvim-treesitter/nvim-treesitter-context" }, #head line show syntax block context
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      config = require("editor.ts-context-commentstring"),
    },
  },
}

return editor
