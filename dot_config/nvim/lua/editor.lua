local wk = require("which-key")

--  System clipboard
vim.opt.clipboard = 'unnamedplus'
-- Wild menu
vim.o.wildmenu = true

-- Tabs
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Misc
vim.o.mouse = 'a'
vim.o.autoindent = false

-- Search
-- Do case insensitive search but be case sensitive when searching w/ capital letter
vim.o.ignorecase = true
vim.o.smartcase = true

-- EasyMotion
vim.g.EasyMotion_do_mapping = 0
vim.g.EasyMotion_smartcase = 1
vim.g.EasyMotion_use_smartsign_us = 1

wk.register({
  ["<leader>e"] = { "<Plug>(easymotion-prefix)", "EasyMotion prefix", noremap = true },
  ["<leader>ef"] = { "<Plug>(easymotion-s)", "EasyMotion anywhere", noremap = true },
  ["<leader>ec"] = { "<Plug>(easymotion-f)", "EasyMotion to char forward", noremap = true },
  ["<leader>es"] = { "<Plug>(easymotion-s2)", "EasyMotion to 2 char forward", noremap = true },
})

-- CamelCaseMotion
-- wk.register({
--   ["<leader>w"] = { "<Plug>CamelCaseMotion_w", "CamelCase word forward", noremap = true },
--   ["<leader>b"] = { "<Plug>CamelCaseMotion_b", "CamelCase word backward", noremap = true },
--   ["<leader>e"] = { "<Plug>CamelCaseMotion_e", "CamelCase word end", noremap = true },
--   ["<leader>ge"] = { "<Plug>CamelCaseMotion_ge", "CamelCase last word end", noremap = true },
-- })
