-- Ruler at 100
vim.o.cc = '120'

-- Numbering
vim.o.relativenumber = true
vim.o.number = true

-- Colorscheme
vim.cmd([[
  " Important!!
  if has('termguicolors')
      set termguicolors
  endif
]])

vim.cmd.colorscheme("catppuccin")

-- Add extra Go highlights
vim.g.go_highlight_types = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_function_calls = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_extra_types = 1
vim.g.go_highlight_build_constraints = 1
vim.g.go_highlight_generate_tags = 1
vim.g.go_doc_popup_window = 1
