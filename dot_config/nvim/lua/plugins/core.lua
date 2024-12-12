-- local hooks = require("ibl.hooks")
-- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "catppuccin/nvim",
    opts = {
      flavour = "frappe",
      integrations = {
        indent_blankline = {
          enabled = true,
          colored_indent_levels = true,
        },
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    dependencies = { "catppuccin/nvim" },
    opts = {
      scope = {
        enabled = true,
        show_start = true,
        show_end = false,
        highlight = {
          "RainbowRed",
          "RainbowYellow",
          "RainbowBlue",
          "RainbowOrange",
          "RainbowGreen",
          "RainbowViolet",
          "RainbowCyan",
        },
      },
      -- indent = {
      --   highlight = {
      --     "RainbowRed",
      --     "RainbowYellow",
      --     "RainbowBlue",
      --     "RainbowOrange",
      --     "RainbowGreen",
      --     "RainbowViolet",
      --     "RainbowCyan",
      --   },
      -- },
    },
    config = function(_, opts)
      local hooks = require("ibl.hooks")
      local ibl = require("ibl")

      ibl.setup(opts)

      local highlights = opts.scope.highlight
      local num_highlights = #highlights

      -- Custom scope highlight hook
      hooks.register(hooks.type.SCOPE_HIGHLIGHT, function(_, bufnr, scope, _)
        local api = vim.api
        local bo = vim.bo[bufnr]

        -- Get the scope's start position
        local start_row = scope:start()

        -- Get the actual line text
        local lines = api.nvim_buf_get_lines(bufnr, start_row, start_row + 1, false)
        local line = lines[1] or ""

        -- Extract leading whitespace
        local indent_str = line:match("^%s*") or ""
        local indent_level = 0
        local tabstop = bo.tabstop
        local shiftwidth = bo.shiftwidth

        -- Iterate over the leading whitespace using byte values for efficiency
        for i = 1, #indent_str do
          local byte = indent_str:byte(i)
          if byte == 9 then
            indent_level = indent_level + tabstop
          else
            indent_level = indent_level + 1
          end
        end

        -- Calculate the indent level based on shiftwidth
        indent_level = math.floor(indent_level / shiftwidth)

        -- Debug prints
        -- print("Line:", line)
        -- print("Indent string:", vim.inspect(indent_str))
        -- print("Indent level:", indent_level)

        -- Calculate which highlight to use (cycling through the available colors)
        local highlight_index = (indent_level % num_highlights) + 1
        -- print("Highlight index:", highlight_index)

        return highlight_index
      end)
    end,
  },
}
