require("aerial").setup {
  backends = { "lsp", "treesitter", "markdown" },
  close_automatic_events = { "unsupported" },
  --  close_behavior = "auto",
  layout = {

    min_width = 40,
    max_width = 40,

  },
  show_guides = true,

  -- Symbols to display (can be a filetype map)
  -- filter_kind = {
  --   -- "Array",
  --   -- "Boolean",
  --   "Class",
  --   -- "Constant",
  --   "Constructor",
  --   "Enum",
  --   -- "EnumMember",
  --   -- "Event",
  --   -- "Field",
  --   -- "File",
  --   "Function",
  --   "Interface",
  --   -- "Key",
  --   "Method",
  --   "Module",
  --   -- "Namespace",
  --   -- "Null",
  --   -- "Number",
  --   -- "Object",
  --   -- "Operator",
  --   -- "Package",
  --   -- "Property",
  --   -- "String",
  --   "Struct",
  --   -- "TypeParameter",
  --   -- "Variable",
  -- },
  -- Set it to false to display all symbols
  filter_kind = false,
}

-- Bindings
vim.api.nvim_set_keymap('n', '<leader>tb', '<cmd>AerialToggle!<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '{', '<cmd>AerialPrev<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '}', '<cmd>AerialNext<CR>', {noremap=true})
-- vim.api.nvim_set_keymap('n', '[[', '<cmd>AerialPrevUp<CR>', {noremap=true})
-- vim.api.nvim_set_keymap('n', ']]', '<cmd>AerialNextUp<CR>', {noremap=true})
