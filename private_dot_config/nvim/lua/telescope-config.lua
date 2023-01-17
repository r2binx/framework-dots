require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      },
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      theme = "dropdown",
      previewer = false,
      mappings = {
        i = {
          ["<C-d>"] = "delete_buffer",
        },
        n = {
          ["d"] = "delete_buffer",
        }
      }
    }
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}-- Bindings
-- Find files
vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<cr>", {
    noremap = true
})
-- Live Grep
vim.api.nvim_set_keymap("n", "<leader>fg", ":Telescope live_grep<cr>", {
    noremap = true
})
-- Find buffers
vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope buffers<cr>", {
    noremap = true
})
-- Show help tags
vim.api.nvim_set_keymap("n", "<leader>fh", ":Telescope help_tags<cr>", {
    noremap = true
})
-- Show document symbols in Telescope
vim.api.nvim_set_keymap("n", "<leader>s", ":Telescope lsp_document_symbols<cr>", {
    noremap = true
})
-- Show symbol references in Telescope
vim.api.nvim_set_keymap("n", "<leader>gr", ":Telescope lsp_references<cr>", {
    noremap = true
})
