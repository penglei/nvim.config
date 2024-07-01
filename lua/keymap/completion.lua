local bind = require("keymap.bind")
local map_cr = bind.map_cr

local map_callback = bind.map_callback

local mapping = {}

function mapping.lsp(buf)
  local plug_map = {
    -- LSP-related keymaps, work only when event = { "InsertEnter", "LspStart" }
    ["n|<leader>o"] = map_cr("Lspsaga outline"):with_buffer(buf):with_noremap():with_silent():with_desc("lsp: Toggle outline"),
    --["n|g["] = map_cr("Lspsaga diagnostic_jump_prev"):with_buffer(buf):with_noremap():with_silent():with_desc("lsp: Prev diagnostic"),
    --["n|g]"] = map_cr("Lspsaga diagnostic_jump_next"):with_buffer(buf):with_noremap():with_silent():with_desc("lsp: Next diagnostic"),
    -- ["n|<leader>sl"] = map_cr("Lspsaga show_line_diagnostics"):with_buffer(buf):with_noremap():with_silent():with_desc("lsp: Line diagnostic"),
    ["n|gs"] = map_cr("Lspsaga show_cursor_diagnostics"):with_buffer(buf):with_noremap():with_silent():with_desc("lsp: Cursor diagnostic"),
    ["n|,s"] = map_callback(function()
        vim.lsp.buf.signature_help()
      end)
      :with_noremap()
      :with_silent()
      :with_desc("lsp: Signature help"),
    ["n|,r"] = map_cr("Lspsaga rename"):with_buffer(buf):with_noremap():with_silent():with_desc("lsp: Rename in file range"),
    ["n|,R"] = map_cr("Lspsaga rename ++project"):with_buffer(buf):with_noremap():with_silent():with_desc("lsp: Rename in project range"),
    -- ["n|K"] = map_cr("Lspsaga hover_doc"):with_buffer(buf):with_noremap():with_silent():with_desc("lsp: Show doc"),
    ["n|K"] = map_callback(function()
        if vim.bo.filetype == "haskell" then
          vim.lsp.buf.hover() -- native doc popup renders link correct.
        else
          vim.cmd(":Lspsaga hover_doc")
        end
      end)
      :with_noremap()
      :with_silent()
      :with_desc("lsp: Show doc"),
    ["nv|,a"] = map_cr("Lspsaga code_action"):with_buffer(buf):with_noremap():with_silent():with_desc("lsp: Code action for cursor"),
    ["n|gD"] = map_cr("Lspsaga peek_definition"):with_buffer(buf):with_noremap():with_silent():with_desc("lsp: Preview definition"),
    ["n|gd"] = map_cr("Lspsaga goto_definition"):with_buffer(buf):with_noremap():with_silent():with_desc("lsp: Goto definition"),
    ["n|gr"] = map_cr("Lspsaga finder"):with_buffer(buf):with_noremap():with_silent():with_desc("lsp: Show reference"),
    ["n|gI"] = map_cr("Lspsaga incoming_calls"):with_buffer(buf):with_noremap():with_silent():with_desc("lsp: Show all incoming calls on the cursor symbol"),
    ["n|go"] = map_cr("Lspsaga outgoing_calls"):with_buffer(buf):with_noremap():with_silent():with_desc("lsp: Show outgoing calls"),
  }

  bind.nvim_load_mapping(plug_map)
end

return mapping
