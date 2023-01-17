-- Setup Packer
if vim.g.neovide then
  vim.opt.guifont = { "Comic Code Ligatures", ":h12" }
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_refresh_rate_idle = 5
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_touch_deadzone = 3.0
  vim.g.neovide_cursor_animation_length = 0.06
  vim.g.neovide_cursor_antialiasing = false
end

local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end

fn.serverstart("nvim.sock")

-- Set mapleader
vim.g.mapleader = " "

-- Load plugins
require('packer_setup')
require('plugins')
-- Editor appearance / behavior
require('catp-conf')
require('appearance')
require('buffers')
require('editor')
-- Plugin Configurations
require('aerial-config')
require('cmp-config')
require('treesitter-config')
require('indent-config')
require('lualine-config')
require('telescope-config')
-- Completion
require('completion')
