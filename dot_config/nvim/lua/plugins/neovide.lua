if not vim.g.neovide then
  return {} -- do nothing if not in a Neovide session
end

return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    options = {
      opt = { -- configure vim.opt options
        -- configure font
        guifont = "Comic Code Ligatures:h12",
        -- line spacing
        linespace = 0,
      },
      g = { -- configure vim.g variables
        -- configure padding
        neovide_padding_top = 0,
        neovide_padding_bottom = 0,
        neovide_padding_right = 0,
        neovide_padding_left = 0,
        neovide_refresh_rate = 60,
        neovide_refresh_rate_idle = 5,
        neovide_hide_mouse_when_typing = true,
        neovide_touch_deadzone = 3.0,
        neovide_cursor_animation_length = 0.08,
        neovide_scroll_animation_length = 0,
        neovide_cursor_antialiasing = false,
      },
    },
  },
}
