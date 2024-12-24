return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  -- {
  --   "folke/snacks.nvim",
  --   opts = {
  --     styles = {
  --       terminal = {
  --         -- Matches the split terminal background color with the normal background color
  --         wo = { winhighlight = "NormalFloat:Normal,WinBar:SnacksWinBar" },
  --       },
  --     },
  --   },
  -- },
  {
    "catppuccin",
    opts = {
      flavour = "frappe",
      term_colors = true,
      integrations = {
        indent_blankline = {
          enabled = true,
          colored_indent_levels = true,
        },
      },
    },
  },
  {
    "chrisgrieser/nvim-spider",
    keys = {
      {
        "w",
        function()
          require("spider").motion("w")
        end,
        desc = "Next word",
        mode = { "n", "o", "x" },
      },
      {
        "e",
        function()
          require("spider").motion("e")
        end,
        desc = "Next end of word",
        mode = { "n", "o", "x" },
      },
      {
        "b",
        function()
          require("spider").motion("b")
        end,
        desc = "Previous word",
        mode = { "n", "o", "x" },
      },
      {
        "ge",
        function()
          require("spider").motion("ge")
        end,
        desc = "Previous end of word",
        mode = { "n", "o", "x" },
      },
    },
  },
}
