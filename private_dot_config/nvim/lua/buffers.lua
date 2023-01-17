local wk = require("which-key")
local mocha = require("catppuccin.palettes").get_palette("mocha")
local frappe = require("catppuccin.palettes").get_palette("frappe")

require("bufferline").setup({
  highlights = require("catppuccin.groups.integrations.bufferline").get {
    styles = { "italic", "bold" },
    custom = {
      all = {
        fill = { bg = "#000000" },
      },
      mocha = {
        background = { fg = mocha.text },
      },
      frappe = {
        background = { fg = frappe.text },
      },
      latte = {
        background = { fg = "#000000" },
      },
    },
  },
  options = {
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    separator_style = "slant",
  },
})

wk.register({
  ["]b"] = { "<cmd>:bnext<CR>", "Cycle next buffer", noremap = true },
  ["[b"] = { "<cmd>:bprev<CR>", "Cycle previous buffer", noremap = true },
  ["<C-w>d"] = { "<cmd>:bdelete<CR>", "Close current buffer", noremap = true },
})
