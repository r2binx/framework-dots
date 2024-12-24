-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
local g = vim.g
g.snacks_animate = false

-- opt.guifont = "Comic Code Ligatures:h12"
-- opt.linespace = 0
g.neovide_padding_top = 5
g.neovide_padding_bottom = 2
g.neovide_padding_right = 0
g.neovide_padding_left = 0
g.neovide_refresh_rate = 60
g.neovide_refresh_rate_idle = 5
g.neovide_hide_mouse_when_typing = true
g.neovide_touch_deadzone = 3.0
g.neovide_cursor_animation_length = 0.08
g.neovide_scroll_animation_length = 0
g.neovide_cursor_antialiasing = false
